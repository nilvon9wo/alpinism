public with sharing class ALP_POKR_SuitHelper {
    private ALP_POKR_SuitHelper() {
    }

    private static ALP_POKR_SuitHelper instance;
    public static ALP_POKR_SuitHelper getInstance() {
        if (instance == null) {
            instance = new ALP_POKR_SuitHelper();
        }
        return instance;
    }
    private static final Map<String, ALP_POKR_Suit> SUIT_BY_CODE_MAP = new Map<String, ALP_POKR_Suit>{
            'S' => ALP_POKR_Suit.SPADES,
            'H' => ALP_POKR_Suit.HEARTS,
            'D' => ALP_POKR_Suit.DIAMONDS,
            'C' => ALP_POKR_Suit.CLUBS
    };

    public ALP_POKR_Suit fromCodeToEnum(String code) {
        return SUIT_BY_CODE_MAP.get(code.right(1));
    }
}