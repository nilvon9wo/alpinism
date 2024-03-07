public with sharing class ALP_MNSP_SquareCell {
    private final ALP_Cell__c cell;

    public ALP_MNSP_SquareCell(ALP_Cell__c cell) {
        this.cell = cell;
    }

    public ALP_MNSP_SquareCell setAnnotation(List<ALP_MNSP_SquareCell> cellList) {
        this.cell.Annotation__c = this.cell.Contains_Mine__c
                ? '*'
                : this.calculateAnnotation(this.countSurroundingMines(cellList));
        return this;
    }

    private Integer countSurroundingMines(List<ALP_MNSP_SquareCell> cellList) {
        Integer surroundingMineCount = 0;
        for (ALP_MNSP_SquareCell cellWrapper : cellList) {
            if (
                    cellWrapper.cell.Contains_Mine__c
                            && this.isNeighbourTo(cellWrapper)
            ) {
                surroundingMineCount++;
            }
        }
        return surroundingMineCount;
    }

    private String calculateAnnotation(Integer mineCount) {
        return mineCount > 0
                ? String.valueOf(mineCount)
                : !this.cell.Contains_Mine__c
                        ? ' '
                        : '';
    }

    public Boolean isNeighbourTo(ALP_MNSP_SquareCell that) {
        return (this.cell.Row__c != that.cell.Row__c || this.cell.Column__c != that.cell.Column__c) &&
                (this.cell.Row__c >= that.cell.Row__c - 1 && this.cell.Row__c <= that.cell.Row__c + 1) &&
                (this.cell.Column__c >= that.cell.Column__c - 1 && this.cell.Column__c <= that.cell.Column__c + 1);
    }

    public ALP_Cell__c toCell() {
        return this.cell;
    }
}