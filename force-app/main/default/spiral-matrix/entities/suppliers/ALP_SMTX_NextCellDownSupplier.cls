public with sharing class ALP_SMTX_NextCellDownSupplier implements ALP_SMTX_NextCellSupplierIntf {
	public ALP_SMTX_SpiralCell getNextCell(ALP_SMTX_SpiralGridIntf grid) {
		ALP_SMTX_SpiralCell lastPopulatedCell = grid.getLastPopulatedCell();
		return grid.get(new ALP_SMTX_SpiralCell(lastPopulatedCell.row + 1, lastPopulatedCell.column));
	}
}