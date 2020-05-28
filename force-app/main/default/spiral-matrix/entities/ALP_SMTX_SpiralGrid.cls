public with sharing class ALP_SMTX_SpiralGrid implements ALP_SMTX_SpiralGridIntf {
	private Integer dimension;
	public Integer getDimension() {
		return dimension;
	}

	private ALP_SMTX_NextCellLookup nextCellLookup;
	private ALP_SMTX_RowFillerLookup rowFillerLookup;

	public ALP_SMTX_SpiralGrid(
			Integer dimension,
			ALP_SMTX_NextCellLookup nextCellLookup,
			ALP_SMTX_RowFillerLookup rowFillerLookup
	) {
		this.dimension = dimension;
		this.nextCellLookup = nextCellLookup;
		this.rowFillerLookup = rowFillerLookup;
	}

	public ALP_SMTX_SpiralGrid(Integer dimension) {
		this(dimension, ALP_SMTX_NextCellLookup.getIntance(), ALP_SMTX_RowFillerLookup.getIntance());
	}

	private Map<Integer, Map<Integer, ALP_SMTX_SpiralCell>> cellByColumnByRowMap
			= new Map<Integer, Map<Integer, ALP_SMTX_SpiralCell>>();
	public Map<Integer, Map<Integer, ALP_SMTX_SpiralCell>> getCellByColumnByRowMap() {
		return this.cellByColumnByRowMap;
	}

	private ALP_SMTX_SpiralCell lastPopulatedCell;
	public ALP_SMTX_SpiralCell getLastPopulatedCell() {
		return this.lastPopulatedCell;
	}
	public ALP_SMTX_SpiralCell setLastPopulatedCell(ALP_SMTX_SpiralCell cell) {
		this.lastPopulatedCell = cell;
		return cell;
	}

	private ALP_SMTX_Direction nextDirection;
	public ALP_SMTX_Direction getNextDirection() {
		return this.nextDirection;
	}

	private Double finalValue {
		get {
			if (this.finalValue == null) {
				this.finalValue = Math.pow(this.dimension, 2);
			}
			return this.finalValue;
		}
		set;
	}

	public ALP_SMTX_SpiralGrid populate() {
		return this.populateBorderCells()
				.fillOtherCells();
	}

	private ALP_SMTX_SpiralGrid populateBorderCells() {
		for (Integer row = 1; row <= this.dimension; row++) {
			this.rowFillerLookup.fillRow(this, row);
		}
		this.nextDirection = ALP_SMTX_Direction.UP;
		return this;
	}

	public ALP_SMTX_SpiralGrid fill(Integer row, Map<Integer, ALP_SMTX_SpiralCell> cellByColumnMap) {
		this.cellByColumnByRowMap.put(row, cellByColumnMap);
		return this;
	}

	private ALP_SMTX_SpiralGrid fillOtherCells() {
		return (this.finalValue == this.lastPopulatedCell.value)
				? this
				: this.fillOtherCells(this.nextCellLookup.getNextCell(this));
	}

	private ALP_SMTX_SpiralGrid fillOtherCells(ALP_SMTX_SpiralCell targetCell) {
		if (targetCell.value == null) {
			targetCell.fill(this, this.lastPopulatedCell.value + 1);
		}
		else {
			this.nextDirection
					= ALP_SMTX_DirectionHelper.NEXT_DIRECTION_BY_LAST_DIRECTION_MAP.get(this.nextDirection);
		}

		return this.fillOtherCells();
	}

	public List<List<Integer>> toRowValueListList() {
		List<List<Integer>> rowValueListList = new List<List<Integer>>();
		for (Integer row = 1; row <= this.dimension; row++) {
			rowValueListList.add(
					this.toRowValueList(
							this.cellByColumnByRowMap.get(row)
					)
			);
		}
		return rowValueListList;
	}

	private List<Integer> toRowValueList(Map<Integer, ALP_SMTX_SpiralCell> cellByColumnMap) {
		List<Integer> rowList = new List<Integer>();
		for (Integer column = 1; column <= this.dimension; column++) {
			rowList.add(cellByColumnMap.get(column).value);
		}
		return rowList;
	}
}