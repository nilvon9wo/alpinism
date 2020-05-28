public with sharing class ALP_SMTX_MiddleRowFiller implements ALP_SMTX_RowFillerIntf {
	public ALP_SMTX_SpiralGridIntf fillRow(ALP_SMTX_SpiralGridIntf grid, Integer row) {
		Integer dimension = grid.getDimension();
		for (Integer column = 1; column <= dimension; column++) {
			grid.put(new ALP_Cell__c(
					Row__c = row,
					Column__c = column,
					Rank__c = (dimension == column)
							? dimension + row - 1
							: null
			));
		}
		return grid;
	}
}