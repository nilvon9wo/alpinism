public with sharing class ALP_SMTX_FirstRowFiller implements ALP_SMTX_RowFillerIntf {
	public ALP_SMTX_SquareGridIntf fillRow(ALP_SMTX_SquareGridIntf grid, Integer row) {
		Map<Integer, ALP_SMTX_SquareCell> cellByColumnMap = new Map<Integer, ALP_SMTX_SquareCell>();
		Integer dimension = grid.getDimension();
		for (Integer column = 1; column <= dimension; column++) {
			ALP_SMTX_SquareCell cell = new ALP_SMTX_SquareCell(column);
			cellByColumnMap.put(column, cell);
			grid.setLastPopulatedCell(cell);
		}
		return grid.fill(1, cellByColumnMap);
	}
}