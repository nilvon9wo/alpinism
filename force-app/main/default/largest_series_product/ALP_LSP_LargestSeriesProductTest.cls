@IsTest
public with sharing class ALP_LSP_LargestSeriesProductTest {
    private static final User TEST_USER = TEST_DummyUserFactoryOutlet.TEST_ADMIN_USER;
    private static final ALP_LSP_LargestSeriesProduct PRODUCT_UNDER_TEST = ALP_LSP_LargestSeriesProduct.getInstance();

    @IsTest
    public static void testLargestSize2ProductIs72() {
        String testSeries = '0123456789';
        Integer testSize = 2;
        Integer expectedResult = 72;
        testLargestProduct(testSeries, testSize, expectedResult);
    }

    @IsTest
    public static void testLargestSize2ProductOfTinyNumber12Is2() {
        String testSeries = '12';
        Integer testSize = 2;
        Integer expectedResult = 2;
        testLargestProduct(testSeries, testSize, expectedResult);
    }

    @IsTest
    public static void testLargestSize2ProductOfTinyNumber19Is2() {
        String testSeries = '19';
        Integer testSize = 2;
        Integer expectedResult = 9;
        testLargestProduct(testSeries, testSize, expectedResult);
    }

    @IsTest
    public static void testLargestSize2ProductOfShuffledNumber() {
        String testSeries = '576802143';
        Integer testSize = 2;
        Integer expectedResult = 48;
        testLargestProduct(testSeries, testSize, expectedResult);
    }

    @IsTest
    public static void testLargestSize3ProductIs504() {
        String testSeries = '0123456789';
        Integer testSize = 3;
        Integer expectedResult = 504;
        testLargestProduct(testSeries, testSize, expectedResult);
    }

    @IsTest
    public static void testLargestSize3ProductOfShuffledNumber() {
        String testSeries = '1027839564';
        Integer testSize = 3;
        Integer expectedResult = 270;
        testLargestProduct(testSeries, testSize, expectedResult);
    }

    @IsTest
    public static void testLargestSize5ProductIs15120() {
        String testSeries = '0123456789';
        Integer testSize = 5;
        Integer expectedResult = 15120;
        testLargestProduct(testSeries, testSize, expectedResult);
    }

    @IsTest
    public static void testLargestSize6ProductOfABigNumber() {
        String testSeries = '73167176531330624919225119674426574742355349194934';
        Integer testSize = 6;
        Integer expectedResult = 23520;
        testLargestProduct(testSeries, testSize, expectedResult);
    }

    @IsTest
    public static void testLargestSize6ProductOfAnotherBigNumber() {
        String testSeries = '52677741234314237566414902593461595376319419139427';
        Integer testSize = 6;
        Integer expectedResult = 28350;
        testLargestProduct(testSeries, testSize, expectedResult);
    }

    @IsTest
    public static void testLargestProductOfAllZerosIsZero() {
        String testSeries = '0000';
        Integer testSize = 2;
        Integer expectedResult = 0;
        testLargestProduct(testSeries, testSize, expectedResult);
    }

    @IsTest
    public static void testLargestProductOfWhereAllProductsAreZeroIsZero() {
        String testSeries = '99099';
        Integer testSize = 3;
        Integer expectedResult = 0;
        testLargestProduct(testSeries, testSize, expectedResult);
    }

    @IsTest
    public static void testLargestSize0ProductOfEmptyStringIs1() {
        String testSeries = '';
        Integer testSize = 0;
        Integer expectedResult = 1;
        testLargestProduct(testSeries, testSize, expectedResult);
    }

    @IsTest
    public static void testLargestSize0ProductOfNonEmptyStringIs1() {
        String testSeries = '123';
        Integer testSize = 0;
        Integer expectedResult = 1;
        testLargestProduct(testSeries, testSize, expectedResult);
    }

    private static void testLargestProduct(String testSeries, Integer testSize, Integer expectedResult) {
        // Act
        Integer actualResult;
        Test.startTest();
        System.runAs(TEST_USER) {
            actualResult = PRODUCT_UNDER_TEST.largestProduct(testSeries, testSize);
        }
        Test.stopTest();

        // Assert
        System.assertEquals(expectedResult, actualResult);
    }

    @IsTest
    public static void testLargestExceptionIfSizeIsLargerThanSeries() {
        String testSeries = '123';
        Integer testSize = 4;
        testLargestProductException(testSeries, testSize);
    }

    @IsTest
    public static void testLargestNonZeroSizeProductExceptionIfSeriesIsEmpty() {
        String testSeries = '';
        Integer testSize = 1;
        testLargestProductException(testSeries, testSize);
    }

    @IsTest
    public static void testLargestNegativeSizeProductExceptionIfSeriesIsNonEmpty() {
        String testSeries = '1234';
        Integer testSize = -1;
        testLargestProductException(testSeries, testSize);
    }

    private static void testLargestProductException(String testSeries, Integer testSize) {
        // Act
        ALP_LSP_IllegalArgumentException caughtException;
        Test.startTest();
        System.runAs(TEST_USER) {
            try {
                PRODUCT_UNDER_TEST.largestProduct(testSeries, testSize);
            }
            catch (ALP_LSP_IllegalArgumentException ex) {
                caughtException = ex;
            }
        }
        Test.stopTest();

        // Assert
        System.assertNotEquals(null, caughtException);

    }
}