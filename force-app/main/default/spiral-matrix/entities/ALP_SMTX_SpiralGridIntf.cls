public interface ALP_SMTX_SpiralGridIntf {
	Integer getDimension();
	ALP_SMTX_SpiralCell get(ALP_SMTX_SpiralCell cell);
	ALP_SMTX_SpiralGridIntf put(ALP_SMTX_SpiralCell cell);
	ALP_SMTX_SpiralCell getLastPopulatedCell();
	ALP_SMTX_Direction getNextDirection();
}