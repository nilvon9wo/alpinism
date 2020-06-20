public with sharing class ALP_POKR_HandIsHighStraight implements ALP_POKR_HandPredicateIntf{
    public Boolean isTrueFor(ALP_POKR_Hand hand) {
        return hand.isHighScoringStraight;
    }
}