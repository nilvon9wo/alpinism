public with sharing class ALP_MNSP_SquareCellListFactory {
    private static final String MINE_MARKER = '*';

    private ALP_MNSP_SquareCellListFactory() {
    }

    private static ALP_MNSP_SquareCellListFactory instance;
    public static ALP_MNSP_SquareCellListFactory getInstance() {
        if (instance == null) {
            instance = new ALP_MNSP_SquareCellListFactory();
        }
        return instance;
    }

    public ALP_MNSP_SquareCellList createFor(List<String> rowStringList) {
        ALP_MNSP_SquareCellList cellList = new ALP_MNSP_SquareCellList();
        for (Integer rowIndex = 0; rowIndex < rowStringList.size() - 1; rowIndex++) {
            cellList.add(this.createFor(rowIndex, rowStringList[rowIndex]));
        }
        return cellList;
    }

    private ALP_MNSP_SquareCellList createFor(Integer rowIndex, String rowString) {
        ALP_MNSP_SquareCellList cellList = new ALP_MNSP_SquareCellList();
        List<String> columnStringList = rowString.split('');
        for (Integer columnIndex = 0; columnIndex < columnStringList.size() - 1; columnIndex++) {
            cellList.add(new ALP_Cell__c(
                    Row__c = rowIndex,
                    Column__c = columnIndex,
                    Contains_Mine__c = columnStringList[columnIndex] == MINE_MARKER
            ));
        }
        return cellList;
    }

}