public with sharing class ALP_SMTX_LastRowFiller implements ALP_SMTX_RowFillerIntf {
	public ALP_SMTX_SpiralGridIntf fillRow(ALP_SMTX_SpiralGridIntf grid, Integer row) {
		Map<Integer, ALP_SMTX_SpiralCell> cellByColumnMap = new Map<Integer, ALP_SMTX_SpiralCell>();
		Integer smallestValue = 2 * row - 1;
		for (Integer column = row; column >= 1; column--) {
			cellByColumnMap.put(column, new ALP_SMTX_SpiralCell(grid, row, column, smallestValue++));
		}
		return grid.fill(row, cellByColumnMap);
	}
}