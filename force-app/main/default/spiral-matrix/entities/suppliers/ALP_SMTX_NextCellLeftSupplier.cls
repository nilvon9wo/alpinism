public with sharing class ALP_SMTX_NextCellLeftSupplier implements ALP_SMTX_NextCellSupplierIntf {
	public ALP_SMTX_SquareCell getNextCell(ALP_SMTX_SquareGridIntf grid) {
		ALP_SMTX_SquareCell lastPopulatedCell = grid.getLastPopulatedCell();
		return grid.getCellByColumnByRowMap().get(lastPopulatedCell.row)
				.get(lastPopulatedCell.column - 1);
	}
}