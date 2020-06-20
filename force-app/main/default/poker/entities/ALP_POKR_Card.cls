public with sharing class ALP_POKR_Card implements Comparable {
    public ALP_POKR_Rank rank { get; private set; }
    public ALP_POKR_Suit suit { get; private set; }

    private ALP_POKR_Card(ALP_POKR_Rank rank, ALP_POKR_Suit suit) {
        this.rank = rank;
        this.suit = suit;
    }

    public ALP_POKR_Card(String code) {
        this(
                ALP_POKR_RankHelper.getInstance().fromCodeToEnum(code),
                ALP_POKR_SuitHelper.getInstance().fromCodeToEnum(code)
        );
    }

    public Integer compareTo(Object that) {
        return ((ALP_POKR_Card) that).rank.ordinal() - this.rank.ordinal();
    }
}