public with sharing class ALP_CONX_HexCellList {
    List<ALP_CONX_HexCell> cellList;

    public ALP_CONX_HexCellList(List<ALP_CONX_HexCell> cellList) {
        this.cellList = cellList.clone();
    }

    public ALP_CONX_HexCellList add(List<ALP_CONX_HexCell> cellList) {
        this.cellList.addAll(cellList);
        return this;
    }

    public ALP_CONX_HexCellList filter(ALP_CONX_HexCellPredicateIntf predicate) {
        List<ALP_CONX_HexCell> filteredList = new List<ALP_CONX_HexCell>();
        for (ALP_CONX_HexCell cell : this.cellList) {
            if (predicate.isTrueFor(cell)) {
                filteredList.add(cell);
            }
        }
        this.cellList = filteredList;
        return this;
    }

    public List<ALP_CONX_HexCell> toList() {
        return this.cellList;
    }
}