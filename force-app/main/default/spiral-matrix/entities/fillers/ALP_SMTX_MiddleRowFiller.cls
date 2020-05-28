public with sharing class ALP_SMTX_MiddleRowFiller implements ALP_SMTX_RowFillerIntf {
	public ALP_SMTX_SpiralGridIntf fillRow(ALP_SMTX_SpiralGridIntf grid, Integer row) {
		Map<Integer, ALP_SMTX_SpiralCell> cellByColumnMap = new Map<Integer, ALP_SMTX_SpiralCell>();
		Integer dimension = grid.getDimension();
		for (Integer column = 1; column <= dimension; column++) {
			Integer value = (dimension == column)
					? dimension + row - 1
					: null;
			cellByColumnMap.put(column, new ALP_SMTX_SpiralCell(grid, row, column, value));
		}
		return grid.fill(row, cellByColumnMap);
	}
}