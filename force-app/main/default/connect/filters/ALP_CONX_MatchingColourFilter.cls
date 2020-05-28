public with sharing class ALP_CONX_MatchingColourFilter implements ALP_CONX_HexCellPredicateIntf {
	ALP_CONX_Colour targetColour;
	XAP_ENUM_EnumConverter converter;

	public ALP_CONX_MatchingColourFilter(ALP_CONX_Colour targetColour, XAP_ENUM_EnumConverter converter) {
		this.targetColour = targetColour;
		this.converter = converter;
	}

	public ALP_CONX_MatchingColourFilter(ALP_CONX_Colour targetColour) {
		this(targetColour, XAP_ENUM_EnumConverter.getInstance());
	}

	public Boolean isTrueFor(ALP_CONX_HexCell cell) {
		return this.targetColour.equals(cell.stone);
	}
}