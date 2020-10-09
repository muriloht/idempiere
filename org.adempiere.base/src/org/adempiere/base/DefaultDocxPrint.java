/**
 *
 */
package org.adempiere.base;

import java.util.logging.Level;

import org.compiere.model.PrintInfo;
import org.compiere.util.CLogger;

/**
 * @author marcelino <matheus.marcelino@devcoffee.com.br>
 *
 */
public class DefaultDocxPrint implements IDocxPrint {

	/**
	 *
	 */
	protected CLogger log = CLogger.getCLogger(getClass());

	public DefaultDocxPrint() {
		// TODO Auto-generated constructor stub
	}

	/* (non-Javadoc)
	 * @see org.adempiere.base.ICloudStorage#start(java.lang.Integer, java.util.List)
	 */
	@Override
	public void start(Integer AD_PrintFormat_ID, String fileName, PrintInfo printInfo) {
		// TODO Auto-generated method stub
		log.log(Level.WARNING, "Classe default sem implementacao.");
	}

	/* (non-Javadoc)
	 * @see org.adempiere.base.ICloudStorage#uploadToCloud()
	 */
	@Override
	public void printDocx() {
		// TODO Auto-generated method stub

	}

}
