public with sharing class ALP_POKR_Hand {
    private ALP_POKR_RankHelper rankHelper;

    public String handCode { get; private set; }

    private ALP_POKR_Hand(String handCode, ALP_POKR_RankHelper rankHelper) {
        this.handCode = handCode;
        this.rankHelper = rankHelper;
    }

    public ALP_POKR_Hand(String handCode) {
        this(handCode, ALP_POKR_RankHelper.getInstance());
    }

    private List<ALP_POKR_Card> cardList {
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

    private Map<ALP_POKR_Rank, ALP_POKR_Card> cardsByRankMap {
        get {
            if (this.cardsByRankMap == null) {
                this.cardsByRankMap = new Map<ALP_POKR_Rank, ALP_POKR_Card>();
                for (ALP_POKR_Card card : this.cardList) {
                    this.cardsByRankMap.put(card.rank, card);
                }
            }
            return this.cardsByRankMap;
        }
        set;
    }

    private Map<ALP_POKR_Suit, ALP_POKR_Card> cardsBySuitMap {
        get {
            if (this.cardsBySuitMap == null) {
                this.cardsBySuitMap = new Map<ALP_POKR_Suit, ALP_POKR_Card>();
                for (ALP_POKR_Card card : this.cardList) {
                    this.cardsBySuitMap.put(card.suit, card);
                }
            }
            return this.cardsBySuitMap;
        }
        set;
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

    private Integer numberOfRanks {
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

    /**
  def highest_group_rank(%Hand{rank_grouping: rank_grouping}),
    do:
      rank_grouping
      |> Enum.to_list()
      |> Enum.map(&elem(&1, 0))
      |> Enum.max(&Ranks.is_higher_first/2)

  defp has_target_length(%Hand{rank_grouping: rank_grouping}, target_length),
    do:
      rank_grouping
      |> Map.values()
      |> Enum.any?(&(length(&1) == target_length))
end

*/
}