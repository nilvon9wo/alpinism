public with sharing class ALP_POKR_Hand {
    private final ALP_POKR_RankHelper rankHelper;

    public String handCode { get; private set; }

    private ALP_POKR_Hand(String handCode, ALP_POKR_RankHelper rankHelper) {
        this.handCode = handCode;
        this.rankHelper = rankHelper;
    }

    public ALP_POKR_Hand(String handCode) {
        this(handCode, ALP_POKR_RankHelper.getInstance());
    }

    private final List<ALP_POKR_Card> cardList {
        get {
            if (this.cardList == null) {
                this.cardList = new List<ALP_POKR_Card>();
                for (String cardCode : this.handCode.split(' ')) {
                    this.cardList.add(new ALP_POKR_Card(cardCode));
                }
                this.cardList.sort();
            }
            return this.cardList;
        }
        set;
    }

    public ALP_POKR_Card get(Integer index) {
        return this.cardList[index];
    }

    public Integer size {
        get {
            if (this.size == null) {
                this.size = this.cardList.size();
            }
            return this.size;
        }
        private set;
    }

    private final Map<ALP_POKR_Rank, List<ALP_POKR_Card>> cardsByRankMap {
        get {
            if (this.cardsByRankMap == null) {
                this.cardsByRankMap = new Map<ALP_POKR_Rank, List<ALP_POKR_Card>>();
                for (ALP_POKR_Card card : this.cardList) {
                    ALP_POKR_Rank rank = card.rank;
                    List<ALP_POKR_Card> cardList = this.cardsByRankMap.get(rank);
                    if (cardList == null) {
                        cardList = new List<ALP_POKR_Card>();
                        this.cardsByRankMap.put(card.rank, cardList);
                    }
                    cardList.add(card);
                }
            }
            return this.cardsByRankMap;
        }
        set;
    }

    private final Map<ALP_POKR_Suit, List<ALP_POKR_Card>> cardsBySuitMap {
        get {
            if (this.cardsBySuitMap == null) {
                this.cardsBySuitMap = new Map<ALP_POKR_Suit, List<ALP_POKR_Card>>();
                for (ALP_POKR_Card card : this.cardList) {
                    ALP_POKR_Suit suit = card.suit;
                    List<ALP_POKR_Card> cardList = this.cardsBySuitMap.get(suit);
                    if (cardList == null) {
                        cardList = new List<ALP_POKR_Card>();
                        this.cardsBySuitMap.put(card.suit, cardList);
                    }
                    cardList.add(card);
                }
            }
            return this.cardsBySuitMap;
        }
        set;
    }

    public ALP_POKR_HandGroupShape groupShape {
        get {
            if (this.groupShape == null) {
                this.groupShape = new ALP_POKR_HandGroupShape(this.cardsByRankMap);
            }
            return this.groupShape;
        }
        private set;
    }

    public Boolean isStraight {
        get {
            if (this.isStraight == null) {
                this.isStraight = this.isHighScoringStraight || this.isLowScoringStraight;
            }
            return this.isStraight;
        }
        private set;
    }

    public Boolean isHighScoringStraight {
        get {
            if (this.isHighScoringStraight == null) {
                this.isHighScoringStraight = this.isHighScoringStraight(
                        1, this.rankHelper.getNextRankDown(this.cardList[0].rank)
                );
            }
            return this.isHighScoringStraight;
        }
        private set;
    }

    private Boolean isHighScoringStraight(Integer nextIndex, ALP_POKR_Rank nextRank) {
        return (nextIndex > this.cardList.size() - 1)
                || (
                this.cardList[nextIndex].rank.equals(nextRank)
                        && this.isHighScoringStraight(
                        nextIndex + 1,
                        this.rankHelper.getNextRankDown(nextRank)
                )
        );
    }

    public Boolean isLowScoringStraight {
        get {
            if (this.isLowScoringStraight == null) {
                this.isLowScoringStraight = this.cardList[0].rank.equals(ALP_POKR_Rank.ACE)
                        && this.cardList[1].rank.equals(ALP_POKR_Rank.FIVE)
                        && this.cardList[2].rank.equals(ALP_POKR_Rank.FOUR)
                        && this.cardList[3].rank.equals(ALP_POKR_Rank.THREE)
                        && this.cardList[4].rank.equals(ALP_POKR_Rank.TWO);
            }
            return this.isLowScoringStraight;
        }
        private set;
    }

    public Boolean isFlush {
        get {
            if (this.isFlush == null) {
                this.isFlush = this.cardsBySuitMap.size() == 1;
            }
            return this.isFlush;
        }
        private set;
    }

    private final Integer numberOfRanks {
        get {
            if (this.numberOfRanks == null) {
                this.numberOfRanks = this.cardsByRankMap.size();
            }
            return this.numberOfRanks;
        }
        set;

    }

    public Boolean hasExactlyTwoRanks {
        get {
            if (this.hasExactlyTwoRanks == null) {
                this.hasExactlyTwoRanks = numberOfRanks == 2;
            }
            return this.hasExactlyTwoRanks;
        }
        private set;
    }

    public Boolean hasRankGroups {
        get {
            if (this.hasRankGroups == null) {
                this.hasRankGroups = numberOfRanks < this.size;
            }
            return this.hasRankGroups;
        }
        private set;
    }

    public String toCode() {
        return this.handCode;
    }
}