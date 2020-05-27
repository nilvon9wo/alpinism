public interface ALP_SMTX_SquareGridIntf {
	Integer getDimension();

	Map<Integer, Map<Integer, ALP_SMTX_SquareCell>> getCellByColumnByRowMap();
	ALP_SMTX_SquareGridIntf fill(Integer row, Map<Integer, ALP_SMTX_SquareCell> cellByColumnMap);

	ALP_SMTX_SquareCell getLastPopulatedCell();
	ALP_SMTX_SquareCell setLastPopulatedCell(ALP_SMTX_SquareCell cell);

	ALP_SMTX_Direction getNextDirection();

}