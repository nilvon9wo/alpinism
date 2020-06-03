public with sharing class ALP_MNSP_CellNeighbourFilter implements ALP_MNSP_SquareCellPredicateIntf {
    ALP_MNSP_SquareCell cell;

    public ALP_MNSP_CellNeighbourFilter(ALP_MNSP_SquareCell cell) {
        this.cell = cell;
    }

    public Boolean isTrueFor(ALP_MNSP_SquareCell that) {
        return that.isNeighbourTo(this.cell);
    }
}