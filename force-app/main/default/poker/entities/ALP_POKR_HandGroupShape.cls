public with sharing class ALP_POKR_HandGroupShape implements Comparable {
    private final Map<ALP_POKR_Rank, List<ALP_POKR_Card>> cardsByRankMap;
    private final ALP_POKR_RankHelper rankHelper;

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
                this.largestGroupSize = 0;
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
                this.numberOfGroups = 0;
                for (List<ALP_POKR_Card> cards : this.cardsByRankMap.values()) {
                    if (cards.size() > 1) {
                        this.numberOfGroups++;
                    }
                }
            }
            return this.numberOfGroups;
        }
        private set;
    }

    public Integer compareTo(Object thatObject) {
        ALP_POKR_HandGroupShape that = (ALP_POKR_HandGroupShape) thatObject;
        return (this.isThisObviouslyBetterThan(that))
                ? -1
                : (that.isThisObviouslyBetterThan(this))
                        ? 1
                        : (this.equals(that))
                                ? 0
                                : this.compareWithoutBestGroups(that);
    }

    private Boolean isThisObviouslyBetterThan(ALP_POKR_HandGroupShape that) {
        return this.largestGroupSize > that.largestGroupSize
                || (
                this.largestGroupSize == that.largestGroupSize
                        && this.numberOfGroups > that.numberOfGroups
        )
                || (
                this.largestGroupSize == that.largestGroupSize
                        && this.numberOfGroups == that.numberOfGroups
                        && this.rankHelper.isHigherFirst(this.largestGroupRank, that.largestGroupRank)
        );
    }

    public Boolean equals(Object thatObject) {
        ALP_POKR_HandGroupShape that = (ALP_POKR_HandGroupShape) thatObject;
        return this.largestGroupSize == that.largestGroupSize
                && this.numberOfGroups == that.numberOfGroups
                && this.areCardsByRankMapsEqual(that);
    }

    private Boolean areCardsByRankMapsEqual(ALP_POKR_HandGroupShape that) {
        for (ALP_POKR_Rank thisRank : this.cardsByRankMap.keySet()) {
            List<ALP_POKR_Card> thatCards = that.cardsByRankMap.get(thisRank);
            Boolean hasSameNumberOfCards = thatCards != null
                    && this.cardsByRankMap.get(thisRank).size() == thatCards.size();
            if (!hasSameNumberOfCards) {
                return false;
            }
        }
        return true;
    }

    private Integer compareWithoutBestGroups(ALP_POKR_HandGroupShape that) {
        return (this.largestGroupSize == that.largestGroupSize)
                ? this.removeBestGroup(this).compareTo(this.removeBestGroup(that))
                : 1;
    }

    private ALP_POKR_HandGroupShape removeBestGroup(ALP_POKR_HandGroupShape groupShape) {
        Map<ALP_POKR_Rank, List<ALP_POKR_Card>> cardsByRankMap = groupShape.cardsByRankMap.clone();
        cardsByRankMap.remove(groupShape.largestGroupRank);
        return new ALP_POKR_HandGroupShape(cardsByRankMap);
    }

    public override Integer hashCode() {
        Integer result = System.hashCode(cardsByRankMap);
        result = (31 * result) + System.hashCode(rankHelper);
        result = (31 * result) + System.hashCode(largestGroupSize);
        result = (31 * result) + System.hashCode(largestGroupRank);
        result = (31 * result) + System.hashCode(numberOfGroups);
        return result;
    }
}