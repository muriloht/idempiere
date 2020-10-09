package org.brerp.docxprint.component;

import java.util.ArrayList;
import java.util.List;

import org.adempiere.base.IDocxPrint;
import org.adempiere.base.IDocxPrintFactory;
import org.brerp.docxprint.util.DocxPrint;
import org.compiere.model.PrintInfo;

public class DocxPrintFactory implements IDocxPrintFactory {

	@Override
	public List<IDocxPrint> getIDocxPrints(Integer AD_PrintFormat_ID, String fileName, PrintInfo printInfo) {
		List<IDocxPrint> docxPrints = new ArrayList<IDocxPrint>();

		docxPrints.add(new DocxPrint());

		return docxPrints;
	}
}

