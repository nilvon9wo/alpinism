public with sharing class ALP_CONX_HexCell {
	private static final Map<String, ALP_CONX_Colour> COLOUR_BY_OCCUPANT_MAP = new Map<String, ALP_CONX_Colour>{
			'X' => ALP_CONX_Colour.BLACK,
			'O' => ALP_CONX_Colour.WHITE,
			'.' => ALP_CONX_Colour.NONE
	};

	public ALP_Cell__c cell { get; private set; }

	private ALP_CONX_HexCell(Integer row, Integer column, ALP_CONX_Colour colour) {
		this.cell = new ALP_Cell__c(
				Row__c = row,
				Column__c = column,
				Z__c = -row - column,
				Stone_Colour__c = String.valueOf(colour)
		);
	}

	public ALP_CONX_HexCell(Integer rowIndex, Integer columnIndex) {
		this(rowIndex, columnIndex, ALP_CONX_Colour.NONE);
	}

	public ALP_CONX_HexCell(Integer rowIndex, Integer columnIndex, String occupant) {
		this(rowIndex, columnIndex, COLOUR_BY_OCCUPANT_MAP.get(occupant));
	}

	public String stone {
		get {
			return this.cell.Stone_Colour__c;
		}
	}

	public Integer get(SObjectField axis) {
		return ((Decimal) this.cell.get(axis))
				.intValue();
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
		return this.isNeighbourTo(that, ALP_Cell__c.Row__c, ALP_Cell__c.Column__c, ALP_Cell__c.Z__c)
				|| this.isNeighbourTo(that, ALP_Cell__c.Row__c, ALP_Cell__c.Z__c, ALP_Cell__c.Column__c)
				|| this.isNeighbourTo(that, ALP_Cell__c.Column__c, ALP_Cell__c.Row__c, ALP_Cell__c.Z__c)
				|| this.isNeighbourTo(that, ALP_Cell__c.Column__c, ALP_Cell__c.Z__c, ALP_Cell__c.Row__c)
				|| this.isNeighbourTo(that, ALP_Cell__c.Z__c, ALP_Cell__c.Row__c, ALP_Cell__c.Column__c)
				|| this.isNeighbourTo(that, ALP_Cell__c.Z__c, ALP_Cell__c.Column__c, ALP_Cell__c.Row__c);
	}

	private Boolean isNeighbourTo(ALP_CONX_HexCell that, SObjectField same, SObjectField oneDown, SObjectField oneUp) {
		return (this.get(same) == (that.get(same)))
				&& (this.get(oneDown) == (that.get(oneDown) - 1))
				&& (this.get(oneUp) == (that.get(oneUp) + 1));
	}

	public String toLocationString() {
		return '('
				+ this.cell.Row__c + ','
				+ this.cell.Column__c + ','
				+ this.cell.Z__c
				+ ')' ;
	}
}