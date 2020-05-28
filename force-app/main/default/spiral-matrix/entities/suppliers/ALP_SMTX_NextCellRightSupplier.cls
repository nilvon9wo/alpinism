public with sharing class ALP_SMTX_NextCellRightSupplier implements ALP_SMTX_NextCellSupplierIntf {
	public ALP_SMTX_SpiralCell getNextCell(ALP_SMTX_SpiralGridIntf grid) {
		ALP_SMTX_SpiralCell lastPopulatedCell = grid.getLastPopulatedCell();
		return grid.getCellByColumnByRowMap().get(lastPopulatedCell.row)
				.get(lastPopulatedCell.column + 1);
	}
}