public with sharing class ALP_SMTX_SpiralCell {
	public Integer row {get; private set;}
	public Integer column {get; private set;}
	public Integer value {get; set;}

	public ALP_SMTX_SpiralCell(
			Integer row,
			Integer column,
			Integer value
	) {
		this.row = row;
		this.column = column;
		this.value = value;
	}

	public ALP_SMTX_SpiralCell(
			Integer row,
			Integer column
	) {
		this(row, column, null);
	}

	public ALP_SMTX_SpiralCell(Integer value) {
		this(1, value, value);
	}
}