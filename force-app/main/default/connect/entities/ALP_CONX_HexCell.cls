public with sharing class ALP_CONX_HexCell {
	private static final Map<String, ALP_CONX_Colour> COLOUR_BY_OCCUPANT_MAP = new Map<String, ALP_CONX_Colour>{
			'X' => ALP_CONX_Colour.BLACK,
			'O' => ALP_CONX_Colour.WHITE,
			'.' => ALP_CONX_Colour.NONE
	};

	public Integer x { get; private set; }
	public Integer y { get; private set; }
	public Integer z { get; private set; }
	public ALP_CONX_Colour stone { get; private set; }

	private Map<ALP_CONX_Axis, Integer> locationMap {
		get {
			if (this.locationMap == null) {
				this.locationMap = this.toLocationMap(this);
			}
			return this.locationMap;
		}
		set;
	}

	private ALP_CONX_HexCell(Integer x, Integer y, ALP_CONX_Colour colour) {
		this.x = x;
		this.y = y;
		this.z = -x - y;
		this.stone = colour;
	}

	public ALP_CONX_HexCell(Integer rowIndex, Integer columnIndex) {
		this(rowIndex, columnIndex, ALP_CONX_Colour.NONE);
	}

	public ALP_CONX_HexCell(Integer rowIndex, Integer columnIndex, String occupant) {
		this(rowIndex, columnIndex, COLOUR_BY_OCCUPANT_MAP.get(occupant));
	}

	public Integer get(ALP_CONX_Axis axis) {
		return this.locationMap.get(axis);
	}

	public Boolean isNeighbourTo(List<ALP_CONX_HexCell> those) {
		for (ALP_CONX_HexCell that : those) {
			if (this.isNeighbourTo(that)) {
				return true;
			}
		}
		return false;
	}

	private Boolean isNeighbourTo(ALP_CONX_HexCell that) {
		Map<ALP_CONX_Axis, Integer> thatLocationMap = this.toLocationMap(that);
		return this.isNeighbourTo(thatLocationMap, ALP_CONX_Axis.X, ALP_CONX_Axis.Y, ALP_CONX_Axis.Z)
				|| this.isNeighbourTo(thatLocationMap, ALP_CONX_Axis.X, ALP_CONX_Axis.Z, ALP_CONX_Axis.Y)
				|| this.isNeighbourTo(thatLocationMap, ALP_CONX_Axis.Y, ALP_CONX_Axis.X, ALP_CONX_Axis.Z)
				|| this.isNeighbourTo(thatLocationMap, ALP_CONX_Axis.Y, ALP_CONX_Axis.Z, ALP_CONX_Axis.X)
				|| this.isNeighbourTo(thatLocationMap, ALP_CONX_Axis.Z, ALP_CONX_Axis.X, ALP_CONX_Axis.Y)
				|| this.isNeighbourTo(thatLocationMap, ALP_CONX_Axis.Z, ALP_CONX_Axis.Y, ALP_CONX_Axis.X);
	}

	private Boolean isNeighbourTo(Map<ALP_CONX_Axis, Integer> thatLocationMap, ALP_CONX_Axis same, ALP_CONX_Axis oneDown, ALP_CONX_Axis oneUp) {
		return (this.locationMap.get(same) == (thatLocationMap.get(same)))
				&& (this.locationMap.get(oneDown) == (thatLocationMap.get(oneDown) - 1))
				&& (this.locationMap.get(oneUp) == (thatLocationMap.get(oneUp) + 1));
	}

	public String toLocationString() {
		return this.locationMap.toString();
	}

	private Map<ALP_CONX_Axis, Integer> toLocationMap(ALP_CONX_HexCell cell) {
		return new Map<ALP_CONX_Axis, Integer>{
				ALP_CONX_Axis.X => cell.x,
				ALP_CONX_Axis.Y => cell.y,
				ALP_CONX_Axis.Z => cell.z
		};
	}
}