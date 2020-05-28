public with sharing class ALP_SMTX_NextCellUpSupplier implements ALP_SMTX_NextCellSupplierIntf {
	public ALP_SMTX_SpiralCell getNextCell(ALP_SMTX_SpiralGridIntf grid) {
		ALP_SMTX_SpiralCell lastPopulatedCell = grid.getLastPopulatedCell();
		return grid.getCellByColumnByRowMap().get(lastPopulatedCell.row - 1)
				.get(lastPopulatedCell.column);
	}
}