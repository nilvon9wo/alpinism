public with sharing class ALP_CONX_HexCellListDecorator {
	List<ALP_CONX_HexCell> cellList;

	public ALP_CONX_HexCellListDecorator(List<ALP_CONX_HexCell> cellList) {
		this.cellList = cellList;
	}

	public List<ALP_CONX_HexCell> filter(ALP_CONX_HexCellPredicateIntf predicate) {
		List<ALP_CONX_HexCell> filteredList = new List<ALP_CONX_HexCell>();
		for (ALP_CONX_HexCell cell : this.cellList) {
			if (predicate.isTrueFor(cell)) {
				filteredList.add(cell);
			}
		}
		return filteredList;
	}
}