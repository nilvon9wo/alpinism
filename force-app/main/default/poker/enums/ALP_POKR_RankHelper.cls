public with sharing class ALP_POKR_RankHelper {
    private ALP_POKR_RankHelper() {
    }

    private static ALP_POKR_RankHelper instance;
    public static ALP_POKR_RankHelper getInstance() {
        if (instance == null) {
            instance = new ALP_POKR_RankHelper();
        }
        return instance;
    }
    private static final Map<String, ALP_POKR_Rank> RANK_BY_CODE_MAP = new Map<String, ALP_POKR_Rank>{
            '2' => ALP_POKR_Rank.TWO,
            '3' => ALP_POKR_Rank.THREE,
            '4' => ALP_POKR_Rank.FOUR,
            '5' => ALP_POKR_Rank.FIVE,
            '6' => ALP_POKR_Rank.SIX,
            '7' => ALP_POKR_Rank.SEVEN,
            '8' => ALP_POKR_Rank.EIGHT,
            '9' => ALP_POKR_Rank.NINE,
            '10' => ALP_POKR_Rank.TEN,
            'J' => ALP_POKR_Rank.JACK,
            'Q' => ALP_POKR_Rank.QUEEN,
            'K' => ALP_POKR_Rank.KING,
            'A' => ALP_POKR_Rank.ACE
    };

    public ALP_POKR_Rank fromCodeToEnum(String code) {
        return RANK_BY_CODE_MAP.get(code.left(code.length() - 1));
    }

    public Boolean isHigherFirst(ALP_POKR_Rank rank1, ALP_POKR_Rank rank2) {
        return rank1.ordinal() > rank2.ordinal();
    }

    public ALP_POKR_Rank getNextRankDown(ALP_POKR_Rank rank) {
        return (rank.equals(ALP_POKR_Rank.TWO))
                ? ALP_POKR_Rank.ACE
                : ALP_POKR_Rank.values()[rank.ordinal() - 1];
    }
}