public with sharing class ALP_POKR_HandIsStraight implements ALP_POKR_HandPredicateIntf{
    public Boolean isTrueFor(ALP_POKR_Hand hand) {
        return hand.isStraight;
    }
}