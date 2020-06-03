public with sharing class ALP_MNSP_SquareCellListPublisher {
    private ALP_MNSP_SquareCellListPublisher() {
    }

    private static ALP_MNSP_SquareCellListPublisher instance;
    public static ALP_MNSP_SquareCellListPublisher getInstance() {
        if (instance == null) {
            instance = new ALP_MNSP_SquareCellListPublisher();
        }
        return instance;
    }

    public List<String> reveal(ALP_MNSP_SquareCellList cellWrapperList) {
        Map<Integer, Map<Integer, ALP_Cell__c>> cellByColumnByRowMap
                = new Map<Integer, Map<Integer, ALP_Cell__c>>();
        Integer maximumRow = 0;
        Integer maximumColumn = 0;
        for (ALP_MNSP_SquareCell cellWrapper : cellWrapperList.toList()) {
            ALP_Cell__c cell = cellWrapper.toCell();
            Integer row = Integer.valueOf(cell.Row__c);
            if (row > maximumRow) {
                maximumRow = row;
            }

            Integer column = Integer.valueOf(cell.Column__c);
            if (column > maximumColumn) {
                maximumColumn = column;
            }

            Map<Integer, ALP_Cell__c> cellByColumnMap = cellByColumnByRowMap.get(row);
            if (cellByColumnMap == null) {
                cellByColumnMap = new Map<Integer, ALP_Cell__c>();
                cellByColumnByRowMap.put(row, cellByColumnMap);
            }
            cellByColumnMap.put(column, cell);
        }

        return this.reveal(cellByColumnByRowMap, maximumRow, maximumColumn);
    }

    public List<String> reveal(
            Map<Integer, Map<Integer, ALP_Cell__c>> cellByColumnByRowMap,
            Integer maximumRow,
            Integer maximumColumn
    ) {
        List<String> rowStringList = new List<String>();
        for (Integer rowIndex = 0; rowIndex < maximumRow; rowIndex++) {
            rowStringList.add(this.reveal(cellByColumnByRowMap.get(rowIndex), maximumColumn));
        }
        return rowStringList;
    }

    public String reveal(Map<Integer, ALP_Cell__c> cellByColumnMap, Integer maximumColumn) {
        String rowString = '';
        for (Integer columnIndex = 0; columnIndex < maximumColumn; columnIndex++) {
            rowString += cellByColumnMap.get(columnIndex).Annotation__c;
        }
        return rowString;
    }
}