/**
 *
 */
package org.adempiere.base;

import java.util.List;

import org.compiere.model.PrintInfo;

/**
 * @author marcelino <matheus.marcelino@devcoffee.com.br>
 *
 */
public interface IDocxPrintFactory {

	public List<IDocxPrint> getIDocxPrints (Integer AD_PrintFormat_ID, String fileName, PrintInfo printInfo);

}
