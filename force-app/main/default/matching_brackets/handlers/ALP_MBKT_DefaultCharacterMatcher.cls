public with sharing class ALP_MBKT_DefaultCharacterMatcher implements ALP_MBKT_CharacterHandlerProviderIntf {
    private ALP_MBKT_DefaultCharacterMatcher() {
    }
    private static ALP_MBKT_DefaultCharacterMatcher instance;
    public static ALP_MBKT_DefaultCharacterMatcher getInstance() {
        if (instance == null) {
            instance = new ALP_MBKT_DefaultCharacterMatcher();
        }
        return instance;
    }

    public static final String OPEN_BRACE = '{';
    public static final String CLOSE_BRACE = '}';
    public static final String OPEN_BRACKET = '[';
    public static final String CLOSE_BRACKET = ']';
    public static final String OPEN_PARENTHESIS = '(';
    public static final String CLOSE_PARENTHESIS = ')';

    public static final Map<String, String> CLOSER_BY_OPENER_MAP = new Map<String, String>{
            OPEN_BRACE => CLOSE_BRACE,
            OPEN_BRACKET => CLOSE_BRACKET,
            OPEN_PARENTHESIS => CLOSE_PARENTHESIS
    };

    private static final Map<String, ALP_MBKT_CharacterHandlerIntf> DEFAULT_HANDLER_BY_CHARACTER_MAP {
        get {
            if (DEFAULT_HANDLER_BY_CHARACTER_MAP == null) {
                ALP_MBKT_CharacterHandlerIntf openHandler = new ALP_MBKT_OpenerHandler();
                ALP_MBKT_CharacterHandlerIntf closeHandler = new ALP_MBKT_CloserHandler(CLOSER_BY_OPENER_MAP);

                DEFAULT_HANDLER_BY_CHARACTER_MAP = new Map<String, ALP_MBKT_CharacterHandlerIntf>{
                        OPEN_BRACE => openHandler,
                        OPEN_BRACKET => openHandler,
                        OPEN_PARENTHESIS => openHandler,
                        CLOSE_BRACE => closeHandler,
                        CLOSE_BRACKET => closeHandler,
                        CLOSE_PARENTHESIS => closeHandler
                };
            }
            return DEFAULT_HANDLER_BY_CHARACTER_MAP;
        }
        private set;
    }

    public ALP_MBKT_CharacterHandlerIntf supplyFor(String character) {
        return DEFAULT_HANDLER_BY_CHARACTER_MAP.get(character);
    }
}