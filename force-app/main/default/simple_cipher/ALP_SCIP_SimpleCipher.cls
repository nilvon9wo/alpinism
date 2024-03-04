public with sharing class ALP_SCIP_SimpleCipher {
    final ALP_SCIP_TransformationInterpreterIntf decodingInterpreter;
    final ALP_SCIP_TransformationInterpreterIntf encodingInterpreter;

    private ALP_SCIP_SimpleCipher(
            ALP_SCIP_TransformationInterpreterIntf decodingInterpreter,
            ALP_SCIP_TransformationInterpreterIntf encodingInterpreter
    ) {
        this.decodingInterpreter = decodingInterpreter;
        this.encodingInterpreter = encodingInterpreter;
    }

    private ALP_SCIP_SimpleCipher() {
        this(ALP_SCIP_DecodingInterpreter.getInstance(), ALP_SCIP_EncodingInterpreter.getInstance());
    }

    private static ALP_SCIP_SimpleCipher instance;
    public static ALP_SCIP_SimpleCipher getInstance() {
        if (instance == null) {
            instance = new ALP_SCIP_SimpleCipher();
        }
        return instance;
    }

    private static final Integer VALUE_OF_a = 'a'.codePointAt(0);
    private static final Integer VALUE_OF_z = 'z'.codePointAt(0);

    /*
      Given a `plaintext` and `key`, encode each character of the `plaintext` by
      shifting it by the corresponding letter in the alphabet shifted by the number
      of letters represented by the `key` character, repeating the `key` if it is
      shorter than the `plaintext`.

      For example, for the letter 'd', the alphabet is rotated to become:

      defghijklmnopqrstuvwxyzabc

      You would encode the `plaintext` by taking the current letter and mapping it
      to the letter in the same position in this rotated alphabet.

      abcdefghijklmnopqrstuvwxyz
      defghijklmnopqrstuvwxyzabc

      "a" becomes "d", "t" becomes "w", etc...

      Each letter in the `plaintext` will be encoded with the alphabet of the `key`
      character in the same position. If the `key` is shorter than the `plaintext`,
      repeat the `key`.

      Example:

      plaintext = "testing"
      key = "abc"

      The key should repeat to become the same length as the text, becoming
      "abcabca". If the key is longer than the text, only use as many letters of it
      as are necessary.
      */
    public String encode(String plainText, String key) {
        return this.transform(plainText, key, this.encodingInterpreter);
    }

    /*
      Given a `ciphertext` and `key`, decode each character of the `ciphertext` by
      finding the corresponding letter in the alphabet shifted by the number of
      letters represented by the `key` character, repeating the `key` if it is
      shorter than the `ciphertext`.

      The same rules for key length and shifted alphabets apply as in `encode/2`,
      but you will go the opposite way, so "d" becomes "a", "w" becomes "t",
      etc..., depending on how much you shift the alphabet.
     */
    public String decode(String cipherText, String key) {
        return this.transform(cipherText, key, this.decodingInterpreter);
    }

    private String transform(String text, String key, ALP_SCIP_TransformationInterpreterIntf interpreter) {
        Integer textLength = text.length();
        String paddedKey = key.rightPad(textLength, key);

        List<Integer> resultValueList = new List<Integer>();
        for (Integer i = 0; i < textLength; i++) {
            resultValueList.add(
                    this.transform(text.codePointAt(i), paddedKey.codePointAt(i), interpreter)
            );
        }
        return String.fromCharArray(resultValueList);
    }

    private Integer transform(
            Integer textCharValue,
            Integer keyCharValue,
            ALP_SCIP_TransformationInterpreterIntf interpreter
    ) {
        return this.isLowerCaseLetter(textCharValue)
                ? interpreter.interpret(textCharValue, keyCharValue)
                : textCharValue;
    }

    private Boolean isLowerCaseLetter(Integer characterValue) {
        return VALUE_OF_a <= characterValue
                && characterValue <= VALUE_OF_z;
    }
}