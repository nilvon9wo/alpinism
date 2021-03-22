public with sharing class ALP_MBKT_Definitions {
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
}