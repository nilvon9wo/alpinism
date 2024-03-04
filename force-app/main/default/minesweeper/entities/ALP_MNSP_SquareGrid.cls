public with sharing class ALP_MNSP_SquareGrid {
    final ALP_MNSP_SquareCellList cellList;
    final ALP_MNSP_SquareCellListPublisher cellListPublisher;

    private ALP_MNSP_SquareGrid(ALP_MNSP_SquareCellList cellList, ALP_MNSP_SquareCellListPublisher cellListPublisher) {
        this.cellList = cellList;
        this.cellListPublisher = cellListPublisher;
    }

    public ALP_MNSP_SquareGrid(List<String> rowStringList) {
        this(rowStringList, ALP_MNSP_SquareCellListFactory.getInstance(), ALP_MNSP_SquareCellListPublisher.getInstance());
    }

    private ALP_MNSP_SquareGrid(
            List<String> rowStringList,
            ALP_MNSP_SquareCellListFactory cellFactory,
            ALP_MNSP_SquareCellListPublisher cellListPublisher
    ) {
        this(cellFactory.createFor(rowStringList), cellListPublisher);
    }

    public ALP_MNSP_SquareGrid annotate() {
        this.cellList.forEach(new ALP_MNSP_ApplyAnnotationStrategy(this.cellList));
        return this;
    }

    public List<String> toStringList() {
        return this.cellListPublisher.reveal(this.cellList);
    }
}