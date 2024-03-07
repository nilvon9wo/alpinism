public with sharing class ALP_SMTX_NextCellUpSupplier implements ALP_SMTX_NextCellSupplierIntf {
    public ALP_Cell__c getNextCell(ALP_SMTX_SpiralGridIntf grid) {
        ALP_Cell__c lastPopulatedCell = grid.getLastPopulatedCell();
        return grid.get(new ALP_Cell__c(
                Row__c = lastPopulatedCell.Row__c - 1,
                Column__c = lastPopulatedCell.Column__c
        ));
    }
}