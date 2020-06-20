public with sharing class ALP_POKR_HandHasExactlyTwoRanks implements ALP_POKR_HandPredicateIntf {
    public Boolean isTrueFor(ALP_POKR_Hand hand) {
        return hand.hasExactlyTwoRanks;
    }
}