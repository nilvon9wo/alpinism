public with sharing class ALP_SMTX_FirstRowFiller implements ALP_SMTX_RowFillerIntf {
	public ALP_SMTX_SpiralGridIntf fillRow(ALP_SMTX_SpiralGridIntf grid, Integer row) {
		Integer dimension = grid.getDimension();
		for (Integer column = 1; column <= dimension; column++) {
			grid.put(new ALP_Cell__c(
					Row__c = 1,
					Column__c = column,
					Rank__c = column
			));
		}
		return grid;
	}
}