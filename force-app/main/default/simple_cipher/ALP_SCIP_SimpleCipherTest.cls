@IsTest
public with sharing class ALP_SCIP_SimpleCipherTest {
    private static final User TEST_USER = TEST_DummyUserFactoryOutlet.TEST_ADMIN_USER;
    private static final ALP_SCIP_SimpleCipher CIPHER_UNDER_TEST = new ALP_SCIP_SimpleCipher();

    // Encoding Tests ------------------------------------------------------------------------

    @IsTest
    public static void testEncodingAWithJustAReturnsOriginalText() {
        String testPlainText = 'a';
        String testKey = 'a';
        String expectedResult = testPlainText;
        testEncoding(testPlainText, testKey, expectedResult);
    }

    @IsTest
    public static void testEncodingBWithJustAReturnsOriginalText() {
        String testPlainText = 'b';
        String testKey = 'a';
        String expectedResult = testPlainText;
        testEncoding(testPlainText, testKey, expectedResult);
    }

    @IsTest
    public static void testEncodingCWithJustAReturnsOriginalText() {
        String testPlainText = 'c';
        String testKey = 'a';
        String expectedResult = testPlainText;
        testEncoding(testPlainText, testKey, expectedResult);
    }

    @IsTest
    public static void testEncodingAWithDShiftsTextByFour() {
        String testPlainText = 'a';
        String testKey = 'd';
        String expectedResult = 'd';
        testEncoding(testPlainText, testKey, expectedResult);
    }

    @IsTest
    public static void testEncodingBWithDShiftsTextByFour() {
        String testPlainText = 'b';
        String testKey = 'd';
        String expectedResult = 'e';
        testEncoding(testPlainText, testKey, expectedResult);
    }

    @IsTest
    public static void testEncodingCWithDShiftsTextByFour() {
        String testPlainText = 'c';
        String testKey = 'd';
        String expectedResult = 'f';
        testEncoding(testPlainText, testKey, expectedResult);
    }

    @IsTest
    public static void testEncodingABCWithABCShiftsForCorrespondingLettersInKey() {
        String testPlainText = 'abc';
        String testKey = 'abc';
        String expectedResult = 'ace';
        testEncoding(testPlainText, testKey, expectedResult);
    }

    @IsTest
    public static void testEncodingBCDWithABCShiftsForCorrespondingLettersInKey() {
        String testPlainText = 'bcd';
        String testKey = 'abc';
        String expectedResult = 'bdf';
        testEncoding(testPlainText, testKey, expectedResult);
    }

    @IsTest
    public static void testEncodingCDEWithABCShiftsForCorrespondingLettersInKey() {
        String testPlainText = 'cde';
        String testKey = 'abc';
        String expectedResult = 'ceg';
        testEncoding(testPlainText, testKey, expectedResult);
    }

    @IsTest
    public static void testEncodingIAmAPandaBearWithABCShiftsForCorrespondingLettersInKey() {
        String testPlainText = 'iamapandabear';
        String testKey = 'abc';
        String expectedResult = 'dddddddddddddd';
        testEncoding(testPlainText, testKey, expectedResult);
    }

    @IsTest
    public static void testEncodingOnlyTranslatesLowercaseAThroughZ() {
        String testPlainText = 'this is a test!';
        String testKey = 'd';
        String expectedResult = 'wklv lv d whvw!';
        testEncoding(testPlainText, testKey, expectedResult);
    }

    @IsTest
    public static void testEncodingRepeatsSingleCharacterKeyWhenShorterThanTargetText() {
        String testPlainText = 'abc';
        String testKey = 'a';
        String expectedResult = 'abc';
        testEncoding(testPlainText, testKey, expectedResult);
    }

    @IsTest
    public static void testEncodingRepeatsMultipleCharacterKeyWhenShorterThanTargetText() {
        String testPlainText = 'abcdefghi';
        String testKey = 'abc';
        String expectedResult = 'acedfhgik';
        testEncoding(testPlainText, testKey, expectedResult);
    }

    @IsTest
    public static void testEncodingTruncatesKeyToRequiredLengthIfLongerThanText() {
        String testPlainText = 'abc';
        String testKey = 'somewhatlongkey';
        String expectedResult = 'spo';
        testEncoding(testPlainText, testKey, expectedResult);
    }

    private static void testEncoding(String testPlainText, String testKey, String expectedResult) {
        // Act
        String actualResult;
        Test.startTest();
        System.runAs(TEST_USER) {
            actualResult = CIPHER_UNDER_TEST.encode(testPlainText, testKey);
        }
        Test.stopTest();

        // Assert
        System.assertEquals(expectedResult, actualResult);
    }

    // Decoding tests ---------------------------------------------------------------

    @IsTest
    public static void testDecodingAWithJustAReturnsOriginalText() {
        String testCipherText = 'a';
        String testKey = 'a';
        String expectedResult = testCipherText;
        testDecoding(testCipherText, testKey, expectedResult);
    }

    @IsTest
    public static void testDecodingBWithJustAReturnsOriginalText() {
        String testCipherText = 'b';
        String testKey = 'a';
        String expectedResult = testCipherText;
        testDecoding(testCipherText, testKey, expectedResult);
    }

    @IsTest
    public static void testDecodingCWithJustAReturnsOriginalText() {
        String testCipherText = 'c';
        String testKey = 'a';
        String expectedResult = testCipherText;
        testDecoding(testCipherText, testKey, expectedResult);
    }

    @IsTest
    public static void testDecodingDWithDUnshiftsTextByFour() {
        String testCipherText = 'd';
        String testKey = 'd';
        String expectedResult = 'a';
        testDecoding(testCipherText, testKey, expectedResult);
    }

    @IsTest
    public static void testDecodingEWithDUnshiftsTextByFour() {
        String testCipherText = 'e';
        String testKey = 'd';
        String expectedResult = 'b';
        testDecoding(testCipherText, testKey, expectedResult);
    }

    @IsTest
    public static void testDecodingFWithDUnshiftsTextByFour() {
        String testCipherText = 'f';
        String testKey = 'd';
        String expectedResult = 'c';
        testDecoding(testCipherText, testKey, expectedResult);
    }

    @IsTest
    public static void testDecodingACEWithABCShiftsForCorrespondingLettersInKey() {
        String testPlainText = 'ace';
        String testKey = 'abc';
        String expectedResult = 'abc';
        testDecoding(testPlainText, testKey, expectedResult);
    }

    @IsTest
    public static void testDecodingBDFWithABCShiftsForCorrespondingLettersInKey() {
        String testPlainText = 'bdf';
        String testKey = 'abc';
        String expectedResult = 'bcd';
        testDecoding(testPlainText, testKey, expectedResult);
    }

    @IsTest
    public static void testDecodingCEGWithABCShiftsForCorrespondingLettersInKey() {
        String testPlainText = 'ceg';
        String testKey = 'abc';
        String expectedResult = 'cde';
        testDecoding(testPlainText, testKey, expectedResult);
    }


    @IsTest
    public static void testDecodingDDDDDDDDDDDDDDWithABCShiftsForCorrespondingLettersInKey() {
        String testPlainText = 'dddddddddddddd';
        String testKey = 'abc';
        String expectedResult = 'iamapandabear';
        testDecoding(testPlainText, testKey, expectedResult);
    }

    @IsTest
    public static void testDecodingOnlyTranslatesLowercaseAThroughZ() {
        String testPlainText = 'wklv lv d whvw!';
        String testKey = 'd';
        String expectedResult = 'this is a test!';
        testDecoding(testPlainText, testKey, expectedResult);
    }

    @IsTest
    public static void testDecodingRepeatsSingleCharacterKeyWhenShorterThanTargetText() {
        String testPlainText = 'abc';
        String testKey = 'a';
        String expectedResult = 'abc';
        testDecoding(testPlainText, testKey, expectedResult);
    }

    @IsTest
    public static void testDecodingRepeatsMultipleCharacterKeyWhenShorterThanTargetText() {
        String testPlainText = 'abcdefghik';
        String testKey = 'abc';
        String expectedResult = 'acedfhgi';
        testDecoding(testPlainText, testKey, expectedResult);
    }

    @IsTest
    public static void testDecodingTruncatesKeyToRequiredLengthIfLongerThanText() {
        String testPlainText = 'abc';
        String testKey = 'somewhatlongkey';
        String expectedResult = 'inq';
        testDecoding(testPlainText, testKey, expectedResult);
    }

    private static void testDecoding(String testCipherText, String testKey, String expectedResult) {
        // Act
        String actualResult;
        Test.startTest();
        System.runAs(TEST_USER) {
            actualResult = CIPHER_UNDER_TEST.decode(testCipherText, testKey);
        }
        Test.stopTest();

        // Assert
        System.assertEquals(expectedResult, actualResult);
    }

    // Process Test --------------------------------------------------------------------

    @IsTest
    public static void testDecodingRevealsKeyIfProvidedCipherAndPlainText() {
        // Arrange
        String testPlainText = 'attackxatxdawn';
        String testKey = 'supersecretkey';

        // In general, it is a bad idea to test more than one thing in a single test.
        // However, encode() is relatively well tested on its own and we wish to provide a "Round-trip" test.
        String testCipherText = CIPHER_UNDER_TEST.encode(testPlainText, testKey);

        // Act
        String actualResult;
        Test.startTest();
        System.runAs(TEST_USER) {
            actualResult = CIPHER_UNDER_TEST.decode(testCipherText, testPlainText);
        }
        Test.stopTest();

        // Assert
        System.assertEquals(testKey, actualResult);
    }
}