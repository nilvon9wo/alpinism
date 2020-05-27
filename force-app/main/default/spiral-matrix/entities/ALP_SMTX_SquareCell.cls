public with sharing class ALP_SMTX_SquareCell {
	public Integer row {get; private set;}
	public Integer column {get; private set;}
	public Integer value {get; set;}

	public ALP_SMTX_SquareCell(Integer row, Integer column, Integer value) {
		this.row = row;
		this.column = column;
		this.value = value;
	}

	public ALP_SMTX_SquareCell(Integer value) {
		this(1, value - 1, value);
	}

	public ALP_SMTX_SquareCell fill(ALP_SMTX_SquareGridIntf grid, Integer nextValue) {
		this.value = nextValue;
		return grid.setLastPopulatedCell(this);
	}
}