public with sharing class ALP_CONX_CellNeighbourFilter implements ALP_CONX_HexCellPredicateIntf {
    final List<ALP_CONX_HexCell> connectedCellList;

    public ALP_CONX_CellNeighbourFilter(List<ALP_CONX_HexCell> connectedCellList) {
        this.connectedCellList = connectedCellList;
    }

    public Boolean isTrueFor(ALP_CONX_HexCell cell) {
        return cell.isNeighbourTo(connectedCellList);
    }
}