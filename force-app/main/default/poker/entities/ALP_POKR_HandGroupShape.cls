public with sharing class ALP_POKR_HandGroupShape implements Comparable {
    private Map<ALP_POKR_Rank, List<ALP_POKR_Card>> cardsByRankMap;
    private ALP_POKR_RankHelper rankHelper;

    private ALP_POKR_HandGroupShape(
            Map<ALP_POKR_Rank, List<ALP_POKR_Card>> cardsByRankMap,
            ALP_POKR_RankHelper rankHelper
    ) {
        this.cardsByRankMap = cardsByRankMap;
        this.rankHelper = rankHelper;
    }

    public ALP_POKR_HandGroupShape(Map<ALP_POKR_Rank, List<ALP_POKR_Card>> cardsByRankMap) {
        this(cardsByRankMap, ALP_POKR_RankHelper.getInstance());
    }

    public Integer largestGroupSize {
        get {
            if (this.largestGroupSize == null) {
                this.largestGroupSize = 1;
                for (List<ALP_POKR_Card> cards : this.cardsByRankMap.values()) {
                    Integer cardCount = cards.size();
                    if (cardCount > this.largestGroupSize) {
                        this.largestGroupSize = cardCount;
                    }
                }
            }
            return this.largestGroupSize;
        }
        private set;
    }

    public ALP_POKR_Rank largestGroupRank {
        get {
            if (this.largestGroupRank == null) {
                this.largestGroupRank = ALP_POKR_Rank.TWO;
                for (ALP_POKR_Rank rank : this.cardsByRankMap.keySet()) {
                    if (
                            this.rankHelper.isHigherFirst(rank, this.largestGroupRank)
                                    && this.cardsByRankMap.get(rank).size() == this.largestGroupSize
                            ) {
                        this.largestGroupRank = rank;
                    }
                }
            }
            return this.largestGroupRank;
        }
        private set;
    }


    public Integer numberOfGroups {
        get {
            if (this.numberOfGroups == null) {
                this.numberOfGroups = this.cardsByRankMap.size();
            }
            return this.numberOfGroups;
        }
        private set;
    }

    public Integer compareTo(Object thatObject) {
        ALP_POKR_HandGroupShape that = (ALP_POKR_HandGroupShape) thatObject;
        System.debug('############## this.largestGroupSize:' + this.largestGroupSize);
        System.debug('############## that.largestGroupSize:' + that.largestGroupSize);
        System.debug('############## this.largestGroupSize > that.largestGroupSize:' + (this.largestGroupSize > that.largestGroupSize));
        System.debug('############## this.numberOfGroups:' + this.numberOfGroups);
        System.debug('############## that.numberOfGroups:' + that.numberOfGroups);
        System.debug('############## this.numberOfGroups > that.numberOfGroups:' + (this.numberOfGroups > that.numberOfGroups));
        System.debug('############## this.largestGroupRank:' + this.largestGroupRank);
        System.debug('############## that.largestGroupRank:' + that.largestGroupRank);
        System.debug('############## this.rankHelper.isHigherFirst(this.largestGroupRank, that.largestGroupRank):' + (this.rankHelper.isHigherFirst(this.largestGroupRank, that.largestGroupRank)));

        return (
                this.largestGroupSize > that.largestGroupSize
                        || (
                        this.largestGroupSize == that.largestGroupSize
                                && this.numberOfGroups > that.numberOfGroups
                )
                        || (
                        this.largestGroupSize == that.largestGroupSize
                                && this.numberOfGroups == that.numberOfGroups
                                && this.rankHelper.isHigherFirst(this.largestGroupRank, that.largestGroupRank)
                )
        )
                ? -1
                : (
                        this.largestGroupSize == that.largestGroupSize
                                && this.numberOfGroups == that.numberOfGroups
                                && this.largestGroupRank == that.largestGroupRank
                )
                        ? 0
                        : 1;
    }
}