public with sharing class ALP_SCIP_EncodingInterpreter implements ALP_SCIP_TransformationInterpreterIntf {
    private ALP_SCIP_EncodingInterpreter() {
    }

    private static ALP_SCIP_EncodingInterpreter instance;
    public static ALP_SCIP_EncodingInterpreter getInstance() {
        if (instance == null) {
            instance = new ALP_SCIP_EncodingInterpreter();
        }
        return instance;
    }

    private static final Integer VALUE_OF_a = 'a'.codePointAt(0);
    private static final Integer VALUE_OF_z = 'z'.codePointAt(0);
    private static final Integer LETTERS_IN_ENGLISH_ALPHABET = 26;

    public Integer interpret(Integer textCharValue, Integer keyCharValue) {
        Integer encodedValue = textCharValue + keyCharValue - VALUE_OF_a;
        return (encodedValue <= VALUE_OF_z)
                ? encodedValue
                : encodedValue - LETTERS_IN_ENGLISH_ALPHABET;
    }
}