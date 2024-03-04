public with sharing class ALP_MBKT_MatchingBrackets {
    final ALP_MBKT_CharacterHandlerProviderIntf characterHandlerProvider;

    public ALP_MBKT_MatchingBrackets(ALP_MBKT_CharacterHandlerProviderIntf characterHandlerProvider) {
        this.characterHandlerProvider = characterHandlerProvider;
    }

    private ALP_MBKT_MatchingBrackets() {
        this(ALP_MBKT_DefaultCharacterMatcher.getInstance());
    }

    public static ALP_MBKT_MatchingBrackets instance;
    public static ALP_MBKT_MatchingBrackets getInstance() {
        if (instance == null) {
            instance = new ALP_MBKT_MatchingBrackets();
        }
        return instance;
    }

    public Boolean isPaired(String inputString) {
        List<String> unclosedOpenerList = new List<String>();
        for (String character : inputString.split('')) {
            ALP_MBKT_CharacterHandlerIntf handler = this.characterHandlerProvider.supplyFor(character);
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