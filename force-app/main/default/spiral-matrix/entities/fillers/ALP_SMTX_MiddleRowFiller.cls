public with sharing class ALP_SMTX_MiddleRowFiller implements ALP_SMTX_RowFillerIntf {
	public ALP_SMTX_SpiralGridIntf fillRow(ALP_SMTX_SpiralGridIntf grid, Integer row) {
		Integer dimension = grid.getDimension();
		for (Integer column = 1; column <= dimension; column++) {
			Integer value = (dimension == column)
					? dimension + row - 1
					: null;
			grid.put(new ALP_SMTX_SpiralCell(row, column, value));
		}
		return grid;
	}
}