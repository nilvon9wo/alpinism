public with sharing class ALP_MNSP_SquareCellList {
    private List<ALP_MNSP_SquareCell> cellList;

    public ALP_MNSP_SquareCellList(List<ALP_MNSP_SquareCell> cellList) {
        this.cellList = cellList.clone();
    }

    public ALP_MNSP_SquareCellList() {
        this(new List<ALP_MNSP_SquareCell>());
    }

    public ALP_MNSP_SquareCellList add(ALP_MNSP_SquareCellList those) {
        return this.add(those.cellList);
    }

    public ALP_MNSP_SquareCellList add(List<ALP_MNSP_SquareCell> cellList) {
        this.cellList.addAll(cellList);
        return this;
    }

    public ALP_MNSP_SquareCellList add(ALP_Cell__c cell) {
        this.cellList.add(new ALP_MNSP_SquareCell(cell));
        return this;
    }

    public ALP_MNSP_SquareCellList filter(ALP_MNSP_SquareCellPredicateIntf predicate) {
        List<ALP_MNSP_SquareCell> filteredList = new List<ALP_MNSP_SquareCell>();
        for (ALP_MNSP_SquareCell cell : this.cellList) {
            if (predicate.isTrueFor(cell)) {
                filteredList.add(cell);
            }
        }
        return new ALP_MNSP_SquareCellList(filteredList);
    }

//    public ALP_MNSP_SquareCellList setAnnotations() {
//        for (ALP_MNSP_SquareCell cell : this.cellList) {
//            cell.setAnnotation(this.cellList);
//        }
//        return this;
//    }

    public ALP_MNSP_SquareCellList forEach(ALP_MNSP_SquareCellStrategyIntf strategy) {
        for (ALP_MNSP_SquareCell cell : this.cellList) {
            strategy.execute(cell);
        }
        return this;
    }

    public List<ALP_MNSP_SquareCell> toList() {
        return this.cellList;
    }
}