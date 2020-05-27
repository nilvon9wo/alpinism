public with sharing class ALP_SMTX_NextCellUpSupplier implements ALP_SMTX_NextCellSupplierIntf {
	public ALP_SMTX_SquareCell getNextCell(ALP_SMTX_SquareGridIntf grid) {
		ALP_SMTX_SquareCell lastPopulatedCell = grid.getLastPopulatedCell();
		return grid.getCellByColumnByRowMap().get(lastPopulatedCell.row - 1)
				.get(lastPopulatedCell.column);
	}
}