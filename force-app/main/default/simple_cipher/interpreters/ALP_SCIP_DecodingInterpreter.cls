public with sharing class ALP_SCIP_DecodingInterpreter implements ALP_SCIP_TransformationInterpreterIntf {
    private ALP_SCIP_DecodingInterpreter() {
    }

    private static ALP_SCIP_DecodingInterpreter instance;
    public static ALP_SCIP_DecodingInterpreter getInstance() {
        if (instance == null) {
            instance = new ALP_SCIP_DecodingInterpreter();
        }
        return instance;
    }


    private static final Integer VALUE_OF_a = 'a'.codePointAt(0);
    private static final Integer LETTERS_IN_ENGLISH_ALPHABET = 26;

    public Integer interpret(Integer textCharValue, Integer keyCharValue) {
        Integer decodedValue = textCharValue - keyCharValue + VALUE_OF_a;
        return (decodedValue >= VALUE_OF_a)
                ? decodedValue
                : decodedValue + LETTERS_IN_ENGLISH_ALPHABET;
    }
}