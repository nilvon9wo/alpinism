public interface ALP_SMTX_SpiralGridIntf {
	Integer getDimension();
	ALP_Cell__c get(ALP_Cell__c cell);
	ALP_SMTX_SpiralGridIntf put(ALP_Cell__c cell);
	ALP_Cell__c getLastPopulatedCell();
	ALP_SMTX_Direction getNextDirection();
}