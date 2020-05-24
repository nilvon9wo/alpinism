public with sharing class ALP_CONX_MatchingColourFilter implements ALP_CONX_HexCellPredicateIntf {
	ALP_CONX_Colour targetColour;

	public ALP_CONX_MatchingColourFilter(ALP_CONX_Colour targetColour) {
		this.targetColour = targetColour;
	}

	public Boolean isTrueFor(Object obj) {
		return this.isTrueFor((ALP_CONX_HexCell) obj);
	}

	public Boolean isTrueFor(ALP_CONX_HexCell cell) {
		return this.targetColour.equals(cell.stone);
	}
}