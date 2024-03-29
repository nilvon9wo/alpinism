public with sharing class ALP_CONX_CellDisconnectedFilter implements ALP_CONX_HexCellPredicateIntf {
    final Set<ALP_CONX_HexCell> connectedCellSet;

    public ALP_CONX_CellDisconnectedFilter(List<ALP_CONX_HexCell> connectedCellList) {
        this.connectedCellSet = new Set<ALP_CONX_HexCell>(connectedCellList);
    }

    public Boolean isTrueFor(ALP_CONX_HexCell cell) {
        return !connectedCellSet.contains(cell);
    }
}