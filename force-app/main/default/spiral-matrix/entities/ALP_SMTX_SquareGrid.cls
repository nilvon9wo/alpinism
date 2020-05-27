public with sharing class ALP_SMTX_SquareGrid implements ALP_SMTX_SquareGridIntf {
	private Integer dimension;
	public Integer getDimension() {
		return dimension;
	}

	private ALP_SMTX_NextCellLookup nextCellLookup;
	private ALP_SMTX_RowFillerLookup rowFillerLookup;

	public ALP_SMTX_SquareGrid(
			Integer dimension,
			ALP_SMTX_NextCellLookup nextCellLookup,
			ALP_SMTX_RowFillerLookup rowFillerLookup
	) {
		this.dimension = dimension;
		this.nextCellLookup = nextCellLookup;
		this.rowFillerLookup = rowFillerLookup;
	}

	public ALP_SMTX_SquareGrid(Integer dimension) {
		this(dimension, ALP_SMTX_NextCellLookup.getIntance(), ALP_SMTX_RowFillerLookup.getIntance());
	}

	private Map<Integer, Map<Integer, ALP_SMTX_SquareCell>> cellByColumnByRowMap
			= new Map<Integer, Map<Integer, ALP_SMTX_SquareCell>>();
	public Map<Integer, Map<Integer, ALP_SMTX_SquareCell>> getCellByColumnByRowMap() {
		return this.cellByColumnByRowMap;
	}

	private ALP_SMTX_SquareCell lastPopulatedCell;
	public ALP_SMTX_SquareCell getLastPopulatedCell() {
		return this.lastPopulatedCell;
	}
	public ALP_SMTX_SquareCell setLastPopulatedCell(ALP_SMTX_SquareCell cell) {
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

	public ALP_SMTX_SquareGrid populate() {
		return this.populateBorderCells()
				.fillOtherCells();
	}

	private ALP_SMTX_SquareGrid populateBorderCells() {
		for (Integer row = 1; row <= this.dimension; row++) {
			this.rowFillerLookup.fillRow(this, row);
		}
		this.nextDirection = ALP_SMTX_Direction.UP;
		return this;
	}

	public ALP_SMTX_SquareGrid fill(Integer row, Map<Integer, ALP_SMTX_SquareCell> cellByColumnMap) {
		this.cellByColumnByRowMap.put(row, cellByColumnMap);
		return this;
	}

	private ALP_SMTX_SquareGrid fillOtherCells() {
		if (this.finalValue != this.lastPopulatedCell.value) {
			ALP_SMTX_SquareCell targetCell = this.nextCellLookup.getNextCell(this);

			if (targetCell.value == null) {
				targetCell.fill(this, this.lastPopulatedCell.value + 1);
			}
			else {
				this.nextDirection
						= ALP_SMTX_DirectionHelper.NEXT_DIRECTION_BY_LAST_DIRECTION_MAP.get(this.nextDirection);
			}
			this.fillOtherCells();
		}
		return this;
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

	private List<Integer> toRowValueList(Map<Integer, ALP_SMTX_SquareCell> cellByColumnMap) {
		List<Integer> rowList = new List<Integer>();
		for (Integer column = 1; column <= this.dimension; column++) {
			rowList.add(cellByColumnMap.get(column).value);
		}
		return rowList;
	}
}