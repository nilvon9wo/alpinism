public with sharing class ALP_MNSP_ApplyAnnotationStrategy implements ALP_MNSP_SquareCellStrategyIntf {
    ALP_MNSP_SquareCellList cellList;

    public ALP_MNSP_ApplyAnnotationStrategy(ALP_MNSP_SquareCellList cellList) {
        this.cellList = cellList;
    }

    public ALP_MNSP_SquareCell execute(ALP_MNSP_SquareCell targetCell) {
        return targetCell.setAnnotation(this.cellList.toList());
    }
}