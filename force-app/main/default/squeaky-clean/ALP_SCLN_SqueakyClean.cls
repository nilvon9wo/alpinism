public with sharing class ALP_SCLN_SqueakyClean {
    private static final Integer PRINTABLE_ASCII_LOWER_BOUND = 32;
    private static final Integer PRINTABLE_ASCII_UPPER_BOUND = 126;
    private static final Pattern BASIC_LATIN_LETTER_PATTERN = Pattern.compile('^[a-zA-Z]$');
    private static final Pattern UPPER_CASE_LETTER_PATTERN = Pattern.compile('^[A-Z]$');
    private static final Map<String, String> LEET_SPEAK_LETTER_BY_DIGIT_MAP = new Map<String, String>{
            '0' => 'o',
            '1' => 'l',
            '3' => 'e',
            '4' => 'a',
            '5' => 's',
            '7' => 't',
            '8' => 'b',
            '9' => 'g'
    };

    public static String clean(String identifier) {
        if (String.isBlank(identifier)) {
            return '';
        }

        String cleanIdentifier = identifier.replace(' ', '_');
        String printableCharacters = filterNonPrintableCharacters(cleanIdentifier);
        String camelIdentifier = convertDashToCamelCase(printableCharacters);
        String letters = replaceLeetSpeak(camelIdentifier);
        return removeIllegalCharacters(letters);
    }

    private static String filterNonPrintableCharacters(String inputString) {
        String printableCharacters = '';
        for (String character : inputString.split('')) {
            Integer charCode = character.charAt(0);
            if (charCode >= PRINTABLE_ASCII_LOWER_BOUND && charCode <= PRINTABLE_ASCII_UPPER_BOUND) {
                printableCharacters += character;
            }
        }
        return printableCharacters;
    }

    private static String convertDashToCamelCase(String inputString) {
        String processedString = '';
        Boolean caseFlag = false;
        for (String character : inputString.split('')) {
            if (character == '-') {
                caseFlag = true;
            } else if (caseFlag || isUpperCase(character)) {
                processedString += character.toUpperCase();
                caseFlag = false;
            } else {
                processedString += character.toLowerCase();
            }
        }
        return processedString;
    }

    private static Boolean isUpperCase(String character) {
        return character == character.toUpperCase()
                && UPPER_CASE_LETTER_PATTERN.matcher(character)
                .find();
    }

    private static String replaceLeetSpeak(String inputString) {
        String processedString = '';
        for (String character : inputString.split('')) {
            String mappedCharacter = LEET_SPEAK_LETTER_BY_DIGIT_MAP.get(character);
            processedString += ((mappedCharacter != null)
                    ? mappedCharacter
                    : character);
        }
        return processedString;
    }

    public static String removeIllegalCharacters(String inputString) {
        String processedString = '';
        for (String character : inputString.split('')) {
            if (isLegalLetter(character) || character == '_') {
                processedString += character;
            }
        }
        return processedString;
    }

    private static Boolean isLegalLetter(String character) {
        return BASIC_LATIN_LETTER_PATTERN.matcher(character)
                .find();
    }
}