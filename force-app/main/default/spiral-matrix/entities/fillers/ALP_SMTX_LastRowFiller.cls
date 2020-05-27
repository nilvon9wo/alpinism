public with sharing class ALP_SMTX_LastRowFiller implements ALP_SMTX_RowFillerIntf {
	public ALP_SMTX_SquareGridIntf fillRow(ALP_SMTX_SquareGridIntf grid, Integer row) {
		Map<Integer, ALP_SMTX_SquareCell> cellByColumnMap = new Map<Integer, ALP_SMTX_SquareCell>();
		Integer smallestValue = 2 * row - 1;
		for (Integer column = row; column >= 1; column--) {
			ALP_SMTX_SquareCell cell = new ALP_SMTX_SquareCell(row, column, smallestValue++);
			cellByColumnMap.put(column, cell);
			grid.setLastPopulatedCell(cell);
		}
		return grid.fill(row, cellByColumnMap);
	}
}