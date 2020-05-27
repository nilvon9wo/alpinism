public interface ALP_SMTX_SquareGridIntf {
	Map<Integer, Map<Integer, ALP_SMTX_SquareCell>> getCellByColumnByRowMap();
	ALP_SMTX_SquareCell getLastPopulatedCell();
	ALP_SMTX_SquareCell setLastPopulatedCell(ALP_SMTX_SquareCell cell);
}