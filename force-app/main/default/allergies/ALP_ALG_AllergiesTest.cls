@IsTest
public with sharing class ALP_ALG_AllergiesTest {
    private static final User TEST_USER = TEST_DummyUserFactoryOutlet.TEST_ADMIN_USER;
    private static final ALP_ALG_Allergies ALLERGIES_UNDER_TEST = ALP_ALG_Allergies.getInstance();

    private static final Boolean IS_ALLERGIC = true;
    private static final Boolean NOT_ALLERGIC = false;

    // Test List --------------------------------------------------------------------

    @IsTest
    public static void testList0ReturnsNoAllergiesAtAll() {
        Integer testCode = 0;
        Set<ALP_ALG_Allergen> expectedResultSet = new Set<ALP_ALG_Allergen>();
        testList(testCode, expectedResultSet);
    }

    @IsTest
    public static void testList1ReturnsJustEggs() {
        Integer testCode = 1;
        Set<ALP_ALG_Allergen> expectedResultSet = new Set<ALP_ALG_Allergen>{ALP_ALG_Allergen.EGGS};
        testList(testCode, expectedResultSet);
    }

    @IsTest
    public static void testList2ReturnsJustPeanuts() {
        Integer testCode = 2;
        Set<ALP_ALG_Allergen> expectedResultSet = new Set<ALP_ALG_Allergen>{ALP_ALG_Allergen.PEANUTS};
        testList(testCode, expectedResultSet);
    }

    @IsTest
    public static void testList8ReturnsJustPeanuts() {
        Integer testCode = 8;
        Set<ALP_ALG_Allergen> expectedResultSet = new Set<ALP_ALG_Allergen>{ALP_ALG_Allergen.STRAWBERRIES};
        testList(testCode, expectedResultSet);
    }

    @IsTest
    public static void testList3ReturnsEggsAndPeanuts() {
        Integer testCode = 3;
        Set<ALP_ALG_Allergen> expectedResultSet = new Set<ALP_ALG_Allergen>{
                ALP_ALG_Allergen.EGGS,
                ALP_ALG_Allergen.PEANUTS
        };
        testList(testCode, expectedResultSet);
    }

    @IsTest
    public static void testList5ReturnsEggsAndShellfish() {
        Integer testCode = 5;
        Set<ALP_ALG_Allergen> expectedResultSet = new Set<ALP_ALG_Allergen>{
                ALP_ALG_Allergen.EGGS,
                ALP_ALG_Allergen.SHELLFISH
        };
        testList(testCode, expectedResultSet);
    }

    @IsTest
    public static void testList248ReturnsCatsChocolatePollenStrawberriesAndTomatoes() {
        Integer testCode = 248;
        Set<ALP_ALG_Allergen> expectedResultSet = new Set<ALP_ALG_Allergen>{
                ALP_ALG_Allergen.CATS,
                ALP_ALG_Allergen.CHOCOLATE,
                ALP_ALG_Allergen.POLLEN,
                ALP_ALG_Allergen.STRAWBERRIES,
                ALP_ALG_Allergen.TOMATOES
        };
        testList(testCode, expectedResultSet);
    }

    @IsTest
    public static void testList255ReturnsEverything() {
        Integer testCode = 255;
        Set<ALP_ALG_Allergen> expectedResultSet = new Set<ALP_ALG_Allergen>{
                ALP_ALG_Allergen.CATS,
                ALP_ALG_Allergen.CHOCOLATE,
                ALP_ALG_Allergen.EGGS,
                ALP_ALG_Allergen.PEANUTS,
                ALP_ALG_Allergen.POLLEN,
                ALP_ALG_Allergen.SHELLFISH,
                ALP_ALG_Allergen.STRAWBERRIES,
                ALP_ALG_Allergen.TOMATOES
        };
        testList(testCode, expectedResultSet);
    }

    @IsTest
    public static void testList509IgnoresNonAllergenScoreParts() {
        Integer testCode = 509;
        Set<ALP_ALG_Allergen> expectedResultSet = new Set<ALP_ALG_Allergen>{
                ALP_ALG_Allergen.CATS,
                ALP_ALG_Allergen.CHOCOLATE,
                ALP_ALG_Allergen.EGGS,
                ALP_ALG_Allergen.POLLEN,
                ALP_ALG_Allergen.SHELLFISH,
                ALP_ALG_Allergen.STRAWBERRIES,
                ALP_ALG_Allergen.TOMATOES
        };
        testList(testCode, expectedResultSet);
    }

    private static void testList(Integer testCode, Set<ALP_ALG_Allergen> expectedResultSet) {
        // Act
        List<ALP_ALG_Allergen> actualResultList;
        Test.startTest();
        System.runAs(TEST_USER) {
            actualResultList = ALLERGIES_UNDER_TEST.toList(testCode);
        }
        Test.stopTest();

        // Assert
        assertIsASetContaining(expectedResultSet, actualResultList);
    }

    private static void  assertIsASetContaining(
            Set<ALP_ALG_Allergen> expectedAllergenSet,
            List<ALP_ALG_Allergen> actualAllergenList
    ) {
        assertIsASetContaining(expectedAllergenSet, new Set<ALP_ALG_Allergen>(actualAllergenList));
    }

    private static void  assertIsASetContaining(
            Set<ALP_ALG_Allergen> expectedAllergenSet,
            Set<ALP_ALG_Allergen> actualAllergenSet
    ) {
        System.assert(expectedAllergenSet.containsAll(actualAllergenSet));
        System.assert(actualAllergenSet.containsAll(expectedAllergenSet));
    }


    // Test isAllergicTo eggs --------------------------------------------------------------------

    @IsTest
    public static void testIsAllergicToReturnsFalseFor0WithEggs() {
        Integer testCode = 0;
        String testAllergen = 'eggs';
        testIsAllergicTo(testCode, testAllergen, NOT_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor1WithEggs() {
        Integer testCode = 1;
        String testAllergen = 'eggs';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsFalseFor2WithEggs() {
        Integer testCode = 2;
        String testAllergen = 'eggs';
        testIsAllergicTo(testCode, testAllergen, NOT_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor3WithEggs() {
        Integer testCode = 3;
        String testAllergen = 'eggs';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor255WithEggs() {
        Integer testCode = 255;
        String testAllergen = 'eggs';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    // Test isAllergicTo peanuts --------------------------------------------------------------------

    @IsTest
    public static void testIsAllergicToReturnsFalseFor0WithPeanuts() {
        Integer testCode = 0;
        String testAllergen = 'peanuts';
        testIsAllergicTo(testCode, testAllergen, NOT_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor2WithPeanuts() {
        Integer testCode = 2;
        String testAllergen = 'peanuts';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsFalseFor5WithPeanuts() {
        Integer testCode = 5;
        String testAllergen = 'peanuts';
        testIsAllergicTo(testCode, testAllergen, NOT_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor7WithPeanuts() {
        Integer testCode = 7;
        String testAllergen = 'peanuts';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor255WithPeanuts() {
        Integer testCode = 255;
        String testAllergen = 'peanuts';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    // Test isAllergicTo shellfish --------------------------------------------------------------------

    @IsTest
    public static void testIsAllergicToReturnsFalseFor0WithShellfish() {
        Integer testCode = 0;
        String testAllergen = 'shellfish';
        testIsAllergicTo(testCode, testAllergen, NOT_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor4WithShellfish() {
        Integer testCode = 4;
        String testAllergen = 'shellfish';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsFalseFor10WithShellfish() {
        Integer testCode = 10;
        String testAllergen = 'shellfish';
        testIsAllergicTo(testCode, testAllergen, NOT_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor14WithShellfish() {
        Integer testCode = 14;
        String testAllergen = 'shellfish';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor255WithShellfish() {
        Integer testCode = 255;
        String testAllergen = 'shellfish';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    // Test isAllergicTo strawberries --------------------------------------------------------------------

    @IsTest
    public static void testIsAllergicToReturnsFalseFor0WithStrawberries() {
        Integer testCode = 0;
        String testAllergen = 'strawberries';
        testIsAllergicTo(testCode, testAllergen, NOT_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor8WithStrawberries() {
        Integer testCode = 8;
        String testAllergen = 'strawberries';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsFalseFor20WithStrawberries() {
        Integer testCode = 20;
        String testAllergen = 'strawberries';
        testIsAllergicTo(testCode, testAllergen, NOT_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor28WithStrawberries() {
        Integer testCode = 28;
        String testAllergen = 'strawberries';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor255WithStrawberries() {
        Integer testCode = 255;
        String testAllergen = 'strawberries';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    // Test isAllergicTo tomatoes --------------------------------------------------------------------

    @IsTest
    public static void testIsAllergicToReturnsFalseFor0WithTomatoes() {
        Integer testCode = 0;
        String testAllergen = 'tomatoes';
        testIsAllergicTo(testCode, testAllergen, NOT_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor16WithTomatoes() {
        Integer testCode = 16;
        String testAllergen = 'tomatoes';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsFalseFor40WithTomatoes() {
        Integer testCode = 40;
        String testAllergen = 'tomatoes';
        testIsAllergicTo(testCode, testAllergen, NOT_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor56WithTomatoes() {
        Integer testCode = 56;
        String testAllergen = 'tomatoes';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor255WithTomatoes() {
        Integer testCode = 255;
        String testAllergen = 'tomatoes';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    // Test isAllergicTo chocolate --------------------------------------------------------------------

    @IsTest
    public static void testIsAllergicToReturnsFalseFor0WithChocolate() {
        Integer testCode = 0;
        String testAllergen = 'chocolate';
        testIsAllergicTo(testCode, testAllergen, NOT_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor32WithChocolate() {
        Integer testCode = 32;
        String testAllergen = 'chocolate';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsFalseFor80WithChocolate() {
        Integer testCode = 80;
        String testAllergen = 'chocolate';
        testIsAllergicTo(testCode, testAllergen, NOT_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor112WithChocolate() {
        Integer testCode = 112;
        String testAllergen = 'chocolate';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor255WithChocolate() {
        Integer testCode = 255;
        String testAllergen = 'chocolate';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    // Test isAllergicTo pollen --------------------------------------------------------------------

    @IsTest
    public static void testIsAllergicToReturnsFalseFor0WithPollen() {
        Integer testCode = 0;
        String testAllergen = 'pollen';
        testIsAllergicTo(testCode, testAllergen, NOT_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor64WithPollen() {
        Integer testCode = 64;
        String testAllergen = 'pollen';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsFalseFor160WithPollen() {
        Integer testCode = 160;
        String testAllergen = 'pollen';
        testIsAllergicTo(testCode, testAllergen, NOT_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor224WithPollen() {
        Integer testCode = 224;
        String testAllergen = 'pollen';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor255WithPollen() {
        Integer testCode = 255;
        String testAllergen = 'pollen';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    // Test isAllergicTo cats --------------------------------------------------------------------

    @IsTest
    public static void testIsAllergicToReturnsFalseFor0WithCats() {
        Integer testCode = 0;
        String testAllergen = 'cats';
        testIsAllergicTo(testCode, testAllergen, NOT_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsFalseFor64WithCats() {
        Integer testCode = 64;
        String testAllergen = 'cats';
        testIsAllergicTo(testCode, testAllergen, NOT_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor64WithCats() {
        Integer testCode = 128;
        String testAllergen = 'cats';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor192WithCats() {
        Integer testCode = 192;
        String testAllergen = 'cats';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    @IsTest
    public static void testIsAllergicToReturnsTrueFor255WithCats() {
        Integer testCode = 255;
        String testAllergen = 'cats';
        testIsAllergicTo(testCode, testAllergen, IS_ALLERGIC);
    }

    private static void testIsAllergicTo(Integer testCode, String testAllergen, Boolean expectedResult) {
        // Act
        Boolean actualResult;
        Test.startTest();
        System.runAs(TEST_USER) {
            actualResult = ALLERGIES_UNDER_TEST.isAllergicTo(testCode, testAllergen);
        }
        Test.stopTest();

        // Assert
        System.assertEquals(expectedResult, actualResult);
    }
}