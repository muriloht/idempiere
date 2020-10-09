/**
 *
 */
package org.adempiere.base;

import org.compiere.model.PrintInfo;

/**
 * @author marcelino <matheus.marcelino@devcoffee.com.br>
 *
 */
public interface IDocxPrint {

	public void start (Integer AD_PrintFormat_ID, String fileName, PrintInfo printInfo);
	void printDocx();
}
