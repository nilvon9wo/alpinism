public with sharing class ALP_POKR_HandIsFlush implements ALP_POKR_HandPredicateIntf {
    public Boolean isTrueFor(ALP_POKR_Hand hand) {
        return hand.isFlush;
    }
}