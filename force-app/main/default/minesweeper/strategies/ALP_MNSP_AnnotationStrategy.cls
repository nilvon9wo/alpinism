public with sharing class ALP_MNSP_AnnotationStrategy implements ALP_MNSP_SquareCellListStrategyIntf {
    ALP_MNSP_SquareCellList cellList;

    public ALP_MNSP_AnnotationStrategy(ALP_MNSP_SquareCellList cellList) {
        this.cellList = cellList;
    }

    public ALP_MNSP_SquareCellList execute(ALP_MNSP_SquareCell cell) {
            return this.cellList.filter(new ALP_MNSP_CellNeighbourFilter(cell))
                    .setAnnotations();
    }
}