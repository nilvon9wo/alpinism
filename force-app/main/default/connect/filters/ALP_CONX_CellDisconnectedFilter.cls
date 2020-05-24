public with sharing class ALP_CONX_CellDisconnectedFilter implements ALP_CONX_HexCellPredicateIntf {
	Set<ALP_CONX_HexCell> connectedCellSet;

	public ALP_CONX_CellDisconnectedFilter(List<ALP_CONX_HexCell> connectedCellList) {
		this.connectedCellSet = new Set<ALP_CONX_HexCell>(connectedCellList);
	}

	public Boolean isTrueFor(Object obj) {
		return this.isTrueFor((ALP_CONX_HexCell) obj);
	}

	public Boolean isTrueFor(ALP_CONX_HexCell cell) {
		return !connectedCellSet.contains(cell);
	}
}