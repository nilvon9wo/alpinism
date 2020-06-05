@IsTest
public with sharing class ALP_CSQ_CryptoSquareTest {
    private static final User TEST_USER = TEST_DummyUserFactoryOutlet.TEST_ADMIN_USER;
    private static final ALP_CSQ_CryptoSquare SQUARE_UNDER_TEST = ALP_CSQ_CryptoSquare.getInstance();

    @IsTest
    public static void testEncodeReturnsAnEmptyStringWhenTheInputIsEmpty() {
        String testInputString = '';
        String expectedResult = '';
        testEncode(testInputString, expectedResult);
    }

    @IsTest
    public static void testEncodeReturnsCorrectResultForAPerfectLittleSquare() {
        String testInputString = 'abcd';
        String expectedResult = 'ac bd';
        testEncode(testInputString, expectedResult);
    }

    @IsTest
    public static void testEncodeTreatsUpperCaseLettersSameAsLowerCaseLetters() {
        String testInputString = 'ABCD';
        String expectedResult = 'ac bd';
        testEncode(testInputString, expectedResult);
    }

    @IsTest
    public static void testEncodeReturnsCorrectResultForImperfectSquare() {
        String testInputString = 'This is easy';
        String expectedResult = 'tis hsy ie sa';
        testEncode(testInputString, expectedResult);
    }

    @IsTest
    public static void testEncodeReturnIncludesNumbersButExcludesPunctuation() {
        String testInputString = '1, 2, 3, Go! Go, for God\'s sake!';
        String expectedResult = '1gga 2ook 3fde gos ors';
        testEncode(testInputString, expectedResult);
    }

    @IsTest
    public static void testEncodeReturnCorrectResultForLongString() {
        String testInputString = 'If man was meant to stay on the ground, god would have given us roots.';
        String expectedResult = 'imtgdvs fearwer mayoogo anouuio ntnnlvt wttddes aohghn sseoau';
        testEncode(testInputString, expectedResult);
    }

    private static void testEncode(String testInputString, String expectedResult) {
        // Act
        String actualResult;
        Test.startTest();
        System.runAs(TEST_USER) {
            actualResult = SQUARE_UNDER_TEST.encode(testInputString);
        }
        Test.stopTest();

        // Arrange
        System.assertEquals(expectedResult, actualResult);
    }
}