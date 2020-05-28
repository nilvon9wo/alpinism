public interface ALP_SMTX_SpiralGridIntf {
	Integer getDimension();

	Map<Integer, Map<Integer, ALP_SMTX_SpiralCell>> getCellByColumnByRowMap();
	ALP_SMTX_SpiralGridIntf fill(Integer row, Map<Integer, ALP_SMTX_SpiralCell> cellByColumnMap);

	ALP_SMTX_SpiralCell getLastPopulatedCell();
	ALP_SMTX_SpiralCell setLastPopulatedCell(ALP_SMTX_SpiralCell cell);

	ALP_SMTX_Direction getNextDirection();

}