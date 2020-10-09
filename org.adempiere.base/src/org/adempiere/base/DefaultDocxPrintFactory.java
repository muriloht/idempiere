/**
 *
 */
package org.adempiere.base;

import java.util.List;
import java.util.logging.Level;

import org.compiere.model.PrintInfo;
import org.compiere.util.CLogger;

/**
 * @author marcelino <matheus.marcelino@devcoffee.com.br>
 *
 */
public class DefaultDocxPrintFactory implements IDocxPrintFactory {

	/**
	 *
	 */
	protected CLogger log = CLogger.getCLogger(getClass());

	public DefaultDocxPrintFactory() {
		// TODO Auto-generated constructor stub
	}

	/* (non-Javadoc)
	 * @see org.adempiere.base.ICloudStorageFactory#getICloudStorages(java.lang.Integer, java.util.List)
	 */
	@Override
	public List<IDocxPrint> getIDocxPrints(Integer AD_PrintFormat_ID, String fileName, PrintInfo printInfo) {
		// TODO Auto-generated method stub
		log.log(Level.WARNING, "Factory default sem implementacao.");
		return null;
	}

}
