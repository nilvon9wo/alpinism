public with sharing class ALP_MBKT_MatchingBrackets {
    Map<String, ALP_MBKT_CharacterHandlerIntf> handlerByCharacterMap;

    public ALP_MBKT_MatchingBrackets(Map<String, ALP_MBKT_CharacterHandlerIntf> handlerByCharacterMap) {
        this.handlerByCharacterMap = handlerByCharacterMap;
    }

    private ALP_MBKT_MatchingBrackets() {
        this(DEFAULT_HANDLER_BY_CHARACTER_MAP);
    }

    public static ALP_MBKT_MatchingBrackets instance;
    public static ALP_MBKT_MatchingBrackets getInstance() {
        if (instance == null) {
            instance = new ALP_MBKT_MatchingBrackets();
        }
        return instance;
    }

    private static Map<String, ALP_MBKT_CharacterHandlerIntf> DEFAULT_HANDLER_BY_CHARACTER_MAP {
        get {
            if (DEFAULT_HANDLER_BY_CHARACTER_MAP == null) {
                ALP_MBKT_CharacterHandlerIntf openHandler = new ALP_MBKT_OpenerHandler();
                ALP_MBKT_CharacterHandlerIntf closeHandler
                        = new ALP_MBKT_CloserHandler(ALP_MBKT_Definitions.CLOSER_BY_OPENER_MAP);

                DEFAULT_HANDLER_BY_CHARACTER_MAP = new Map<String, ALP_MBKT_CharacterHandlerIntf>{
                        ALP_MBKT_Definitions.OPEN_BRACE => openHandler,
                        ALP_MBKT_Definitions.OPEN_BRACKET => openHandler,
                        ALP_MBKT_Definitions.OPEN_PARENTHESIS => openHandler,
                        ALP_MBKT_Definitions.CLOSE_BRACE => closeHandler,
                        ALP_MBKT_Definitions.CLOSE_BRACKET => closeHandler,
                        ALP_MBKT_Definitions.CLOSE_PARENTHESIS => closeHandler
                };
            }
            return DEFAULT_HANDLER_BY_CHARACTER_MAP;
        }
        private set;
    }

    public Boolean isPaired(String inputString) {
        List<String> unclosedOpenerList = new List<String>();
        for (String character : inputString.split('')) {
            ALP_MBKT_CharacterHandlerIntf handler = this.handlerByCharacterMap.get(character);
            if (handler != null) {
                try {
                    unclosedOpenerList = handler.handle(character, unclosedOpenerList);
                }
                catch (ALP_MBKT_UnexpectedCloserException ex) {
                    return false;
                }
            }
        }
        return unclosedOpenerList.isEmpty();
    }
}