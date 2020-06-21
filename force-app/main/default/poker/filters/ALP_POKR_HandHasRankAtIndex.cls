public with sharing class ALP_POKR_HandHasRankAtIndex implements ALP_POKR_HandPredicateIntf {
    private ALP_POKR_Rank rank;
    private Integer index;

    public ALP_POKR_HandHasRankAtIndex(ALP_POKR_Rank rank, Integer index) {
        this.rank = rank;
        this.index = index;
    }

    public Boolean isTrueFor(ALP_POKR_Hand hand) {
        return hand.get(index).rank == this.rank;
    }
}