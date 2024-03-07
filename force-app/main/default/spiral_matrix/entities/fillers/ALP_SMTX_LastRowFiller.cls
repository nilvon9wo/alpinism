public with sharing class ALP_SMTX_LastRowFiller implements ALP_SMTX_RowFillerIntf {
    public ALP_SMTX_SpiralGridIntf fillRow(ALP_SMTX_SpiralGridIntf grid, Integer row) {
        Integer smallestValue = 2 * row - 1;
        for (Integer column = row; column >= 1; column--) {
            grid.put(new ALP_Cell__c(
                    Row__c = row,
                    Column__c = column,
                    Rank__c = smallestValue++
            ));
        }
        return grid;
    }
}