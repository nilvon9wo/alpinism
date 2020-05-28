public with sharing class ALP_SMTX_SquareCell {
	public Integer row {get; private set;}
	public Integer column {get; private set;}
	public Integer value {get; set;}

	public ALP_SMTX_SquareCell(
			ALP_SMTX_SquareGridIntf grid,
			Integer row,
			Integer column,
			Integer value
	) {
		this.row = row;
		this.column = column;
		this.value = value;

		grid.setLastPopulatedCell(this); 
	}

	public ALP_SMTX_SquareCell(ALP_SMTX_SquareGridIntf grid, Integer value) {
		this(grid, 1, value - 1, value);
	}

	public ALP_SMTX_SquareCell fill(ALP_SMTX_SquareGridIntf grid, Integer nextValue) {
		this.value = nextValue;
		return grid.setLastPopulatedCell(this);
	}
}