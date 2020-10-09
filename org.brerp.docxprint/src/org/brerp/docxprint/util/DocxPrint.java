package org.brerp.docxprint.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.adempiere.base.IDocxPrint;
import org.adempiere.exceptions.AdempiereException;
import org.apache.poi.xwpf.converter.pdf.PdfConverter;
import org.apache.poi.xwpf.converter.pdf.PdfOptions;
import org.apache.poi.xwpf.usermodel.IBodyElement;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;
import org.apache.poi.xwpf.usermodel.XWPFRun;
import org.apache.poi.xwpf.usermodel.XWPFTable;
import org.apache.poi.xwpf.usermodel.XWPFTableCell;
import org.apache.poi.xwpf.usermodel.XWPFTableRow;
import org.compiere.model.MAttachment;
import org.compiere.model.MAttachmentEntry;
import org.compiere.model.MColumn;
import org.compiere.model.MLocation;
import org.compiere.model.MRefList;
import org.compiere.model.MRefTable;
import org.compiere.model.MTable;
import org.compiere.model.PO;
import org.compiere.model.PrintInfo;
import org.compiere.model.Query;
import org.compiere.print.MPrintFormat;
import org.compiere.util.Env;
import org.compiere.util.Msg;

public class DocxPrint implements IDocxPrint {

	private PO po;
	private List<PO> lines = new ArrayList<>();
	private Boolean usedPOList = false;

	public DocxPrint() {
		// TODO Auto-generated constructor stub
	}

	@Override
	public void start(Integer AD_PrintFormat_ID, String fileName, PrintInfo printInfo) {


		MTable referenceTable = new MTable(Env.getCtx(), printInfo.getAD_Table_ID() , null);
		this.po = referenceTable.getPO(printInfo.getRecord_ID(), null);
		XWPFDocument document = null;
		try {

			MPrintFormat printFormat = new MPrintFormat(Env.getCtx(), AD_PrintFormat_ID, null);
			MAttachment attach = printFormat.getAttachment();

			String outputFilePDF = fileName;
			String outputFileDocx = fileName.replaceAll("pdf", "docx");
			String inputFile = null;

			for (MAttachmentEntry attEntry : attach.getEntries())
			{
				if (attEntry.getName().endsWith(".docx"))
				{
					inputFile = attEntry.getFile().getAbsolutePath();
					break;
				}
			}

			if(inputFile == null)
			{
				throw new AdempiereException("Formato de impressão não possui template .Docx em Anexo");
			}

			/*//copio template anexado para a tmp, trabalharei nesse arquivo para injetar variaveis, deixando disponivel para download caso necessário
			File templateDOCX = new File(inputFile);
			File copyTemplateDOCX = new File(outputFileDocx);
			Files.copy(templateDOCX.toPath(), copyTemplateDOCX.toPath());*/

			//parse do arquivo docx gerado
			FileInputStream in = new FileInputStream(inputFile);
			document = new XWPFDocument(in);

			for(IBodyElement element : document.getBodyElements())
			{
				parseElements(element);
			}

			document.write(new FileOutputStream(outputFileDocx));

			//conversão para pdf
			//TODO Convertendo Tabela errado, porém gerando docx corretamente
			if(fileName.contains(".pdf"))
			{
				File outFile = new File(outputFilePDF);
				OutputStream out = new FileOutputStream(outFile);
				PdfOptions options = PdfOptions.create();
				FileInputStream in2 = new FileInputStream(outputFileDocx);
				XWPFDocument docxGerado = new XWPFDocument(in2);
				PdfConverter.getInstance().convert(docxGerado, out, options);
				docxGerado.close();

				/*XWPFDocument docxgerado= new XWPFDocument(Data.class.getResourceAsStream(outputFileDocx));
				File outFile = new File(outputFilePDF);
				outFile.getParentFile().mkdirs();
				OutputStream out = new FileOutputStream(outFile);
				PdfOptions options = PdfOptions.create().fontEncoding("windows-1250");
				PdfConverter.getInstance().convert(docxgerado, out, options);*/

			}
		}
		catch (Exception e)
		{
			throw new AdempiereException(e.getMessage());
		}
		finally
		{
			if(document != null)
				try {
					document.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
		}

	}

	private void parseElements(Object element)
	{
		if(element instanceof XWPFTable)
		{
			XWPFTable table = (XWPFTable) element;
			parseTable(table);
			for(int i = 1; i < lines.size(); i++)
			{
				createRow(table);
			}
			for (XWPFTableRow row : table.getRows())
			{
				usedPOList = false;
				parseElements(row);
				if(lines != null && !lines.isEmpty() && usedPOList)
				{
					usedPOList = false;
					lines.remove(0);
				}
			}
		}
		else if(element instanceof XWPFTableRow)
		{
			XWPFTableRow row = (XWPFTableRow) element;
			for(XWPFTableCell cell : row.getTableCells())
			{
				parseElements(cell);
			}
		}
		else if(element instanceof XWPFTableCell)
		{
			XWPFTableCell cell = (XWPFTableCell) element;
			for(IBodyElement subElement : cell.getBodyElements())
			{
				parseElements(subElement);
			}
		}
		else if(element instanceof XWPFParagraph)
		{
			XWPFParagraph paragraph =(XWPFParagraph) element;
			paragraph.getIRuns();
			for(XWPFRun run : paragraph.getRuns())
			{
				parseElements(run);
			}
		}
		else if(element instanceof XWPFRun)
		{
			XWPFRun run = (XWPFRun) element;
			String text = run.getText(0);
			if(text != null && !text.contains("FK"))
			{
				if(text.contains("@"))
					text = parseText(text);
				run.setText(text, 0);
			}
		}
	}

	private String parseText(String text)
	{
		Boolean isVariable = true;
		do
		{
			int variablePosIni = text.indexOf("@");
			int variablePosFim = text.indexOf("@",variablePosIni+1);

			if(variablePosFim > -1)
			{
				String variable = text.substring(variablePosIni, variablePosFim+1);
				int columnPosIni = variable.indexOf("<");
				int columnPosFim = variable.indexOf(">", columnPosIni);

				String columnName = null;

				String value = null;
				if(columnPosIni > -1 && columnPosFim > -1)
				{
					String tableName = null;
					Integer foreignTableID = 0;
					String foreignKey = variable.substring(1, columnPosIni);
					columnName = variable.substring(columnPosIni+1, columnPosFim);
					MColumn foreignColumn = null;
					if(variable.contains("LINHAS.") && lines != null && !lines.isEmpty())
					{
						foreignKey = foreignKey.replaceAll("LINHAS.", "");
					    foreignColumn = MColumn.get(Env.getCtx(), MTable.getTableName(Env.getCtx(), lines.get(0).get_Table_ID()), foreignKey);
					}
					else
						foreignColumn = MColumn.get(Env.getCtx(), MTable.getTableName(Env.getCtx(), po.get_Table_ID()), foreignKey);

					if(foreignColumn != null)//Correcao feita pelo marcelino
					{
						if(foreignColumn.getAD_Reference_ID() == 19) //tabela direta
						{
							tableName = foreignKey.replace("_ID", "");
							foreignTableID = MTable.getTable_ID(tableName);
						}
						else if(foreignColumn.getAD_Reference_ID() == 18 || foreignColumn.getAD_Reference_ID() == 30) //tabela e procurar
						{
							if(foreignColumn.getAD_Reference_Value_ID() > 0)
							{
								MRefTable refTable = new MRefTable(Env.getCtx(), foreignColumn.getAD_Reference_Value_ID(), null);
								foreignTableID  = refTable.getAD_Table_ID();
							}
							else
							{
								tableName = foreignKey.replace("_ID", "");
								foreignTableID = MTable.getTable_ID(tableName);
							}

						}

					}

					if(foreignTableID > 0)
					{
						MTable foreignTable = new MTable(Env.getCtx(), foreignTableID , null);
						MColumn column = MColumn.get(Env.getCtx(), MTable.getTableName(Env.getCtx(), foreignTableID), columnName);
						Integer foreignID = 0;
						if(variable.contains("LINHAS.") && lines != null && !lines.isEmpty())
						{
							try
							{
								foreignID = lines.get(0).get_ValueAsInt(foreignKey);
							}
							catch(Exception e )
							{
								e.printStackTrace();
							}
						}
						else
						{
							try
							{
								foreignID = po.get_ValueAsInt(foreignKey);
							}
							catch(Exception e )
							{
								e.printStackTrace();
							}
						}

						PO foreignPo  = foreignTable.getPO(foreignID, null);
						if(column.getAD_Reference_ID() == 17)
						{
							value = MRefList.getListName(Env.getCtx(), column.getAD_Reference_Value_ID(), (String)foreignPo.get_Value(columnName));
						}
						else if(column.getAD_Reference_ID() == 21) { // Localizacao (Endereco)

							MLocation location = new MLocation(Env.getCtx(), (Integer)foreignPo.get_Value(columnName), null);
							value = location.toString();
						}
						else
						{
							try
							{
								value = toString(foreignPo.get_Value(columnName));
							}
							catch(Exception e )
							{
								e.printStackTrace();
							}
						}
					}
				}
				else
				{
					columnName = variable.replaceAll("@", "");
					if(columnName.contains("LINHAS.") && lines != null && !lines.isEmpty())
						columnName = columnName.replaceAll("LINHAS.", "");

					MColumn column = null;
					if(variable.contains("LINHAS.") && lines != null && !lines.isEmpty())
					{
						column = MColumn.get(Env.getCtx(), MTable.getTableName(Env.getCtx(), lines.get(0).get_Table_ID()), columnName);
					}
					else
						column = MColumn.get(Env.getCtx(), MTable.getTableName(Env.getCtx(), po.get_Table_ID()), columnName);

					if(column != null)
					{
						if( column.getAD_Reference_ID() == 17)
						{
							if(variable.contains("LINHAS.") && lines != null && !lines.isEmpty())
							{
								try
								{
									value = MRefList.getListName(Env.getCtx(), column.getAD_Reference_Value_ID(), (String)lines.get(0).get_Value(columnName));
								}
								catch(Exception e )
								{
									e.printStackTrace();
								}
								usedPOList = true;
							}
							else
							{
								try
								{
									value = MRefList.getListName(Env.getCtx(), column.getAD_Reference_Value_ID(), (String)po.get_Value(columnName));
								}
								catch(Exception e )
								{
									e.printStackTrace();
								}
							}
						}
						else if( column.getAD_Reference_ID() == 21)// Localizacao (Endereco)
						{
							MLocation location = new MLocation(Env.getCtx(), (Integer)po.get_Value(columnName), null);
							value = location.toString();
						}
						else
						{

							if(variable.contains("LINHAS.") && lines != null && !lines.isEmpty())
							{
								try
								{
									value = toString(lines.get(0).get_Value(columnName));
								}
								catch(Exception e )
								{
									e.printStackTrace();
								}
								usedPOList = true;
							}
							else
							{
								try
								{
									value = toString(po.get_Value(columnName));
								}
								catch(Exception e )
								{
									e.printStackTrace();
								}
							}
						}
					}
					else
					{
						isVariable = false;
					}
				}

				if(value != null)
					text = text.replaceAll(variable, value);
				else
					text = text.replace(variable, " ");// correcao feita pelo marcelino
			}
			else
			{
				isVariable = false;
			}
		}while(text.indexOf("@") >= 0 && isVariable);

		return text;
	}

	private String toString(Object value)
	{

		if(value == null)
		{
			return null;
		}
		else if(value instanceof Integer || value instanceof String)
		{
			return value.toString();
		}
		else if(value instanceof BigDecimal)
		{
			return String.format("%.2f", value);
		}
		else if(value instanceof Boolean)
		{
			return (boolean) value ? Msg.translate(Env.getAD_Language(Env.getCtx()), "Yes") : Msg.translate(Env.getAD_Language(Env.getCtx()), "No");
		}
		else if(value instanceof Timestamp)
		{
			return new SimpleDateFormat("dd/MM/yyyy").format(value);
		}
		else
			return "Tipo desconhecido";

	}

	private void parseTable(XWPFTable docTable)
	{

		if(docTable.getRows() != null && !docTable.getRows().isEmpty())
		{
			XWPFTableRow row = docTable.getRow(0);
			if(row.getTableCells() != null && !row.getTableCells().isEmpty())
			{
				XWPFTableCell cell = row.getCell(0);
				if(cell.getParagraphs() != null && !cell.getParagraphs().isEmpty())
				{
					XWPFParagraph paragraph = cell.getParagraphArray(0);
					if(paragraph.getRuns() != null && !paragraph.getRuns().isEmpty())
					{
						XWPFRun run = paragraph.getRuns().get(0);
						String variable = run.getText(0);

						String[] select = variable.split("\\|");
						String tableName = null;
						String fkName = null;
						String columnID = null;
						String whereClause = null;
						String orderByClause = null;



						for(int i = 0; i < select.length; i++)
						{
							if(i == 2)
							{
								int pointPosition =  select[i].indexOf(".");
								tableName = select[i].substring(0, pointPosition);
								fkName = select[i].substring(pointPosition+1);
							}
							else if(i == 3)
							{
								columnID = select[i];
							}
							else if(i == 4)
							{
								whereClause = select[i];
							}
							else if(i == 5)
							{
								orderByClause = select[i].replaceAll("@", "");
							}
						}

						MTable table = MTable.get(Env.getCtx(), tableName);
						Integer foreignID = po.get_ValueAsInt(columnID);
						if(whereClause == null || whereClause.isEmpty())
						{
							whereClause = fkName + "= ?";
						}
						else
						{
							whereClause += " AND " + fkName + "= ?";
						}
						Query q = new Query(Env.getCtx(), table, whereClause, null);
						lines = q.setOrderBy(orderByClause).setParameters(foreignID).list();
						docTable.removeRow(0);
					}
				}
			}
		}
	}

	private void createRow(XWPFTable table)
	{
		XWPFTableRow newRow = table.createRow();
		XWPFTableRow oldRow = table.getRow(1);

		int i = 0;
		for(XWPFTableCell oldCell : oldRow.getTableCells())
		{
			XWPFTableCell newCell = newRow.getCell(i);
			int j = 0;
			for(XWPFParagraph oldParagraph : oldCell.getParagraphs())
			{
				XWPFParagraph newParagraph = newCell.getParagraphArray(j);
				for(XWPFRun oldRun : oldParagraph.getRuns())
				{
					XWPFRun newRun = newParagraph.createRun();
					newRun.setText(oldRun.getText(0));
					newRun.setBold(oldRun.isBold());
					newRun.setFontFamily(oldRun.getFontFamily());
					newRun.setItalic(oldRun.isItalic());
					newRun.setColor(oldRun.getColor());
				}
				newParagraph.setStyle(oldParagraph.getStyle());
				newParagraph.setAlignment(oldParagraph.getAlignment());
			}

			i++;
		}
	}

	@Override
	public void printDocx() {
		// TODO Auto-generated method stub

	}

}
