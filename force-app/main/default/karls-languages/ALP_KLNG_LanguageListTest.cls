@IsTest
public class ALP_KLNG_LanguageListTest {
    private static final User TEST_USER = TEST_DummyUserFactoryOutlet.TEST_ADMIN_USER;
    private static final ALP_KLNG_LanguageList LIST_UNDER_TEST = new ALP_KLNG_LanguageList();

    // The isEmpty method returns true when the list contains no languages
    @IsTest
    public static void empty() {
        // Arrange
        // Nothing to do here

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = LIST_UNDER_TEST.isEmpty();
        }
        Test.stopTest();

        // Assert
        Assert.isTrue(result);
    }

    // The isEmpty method returns false after adding a language to the list
    @IsTest
    public static void nonEmpty() {
        // Arrange
        LIST_UNDER_TEST.addLanguage('Java');

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = LIST_UNDER_TEST.isEmpty();
        }
        Test.stopTest();

        // Assert
        Assert.isFalse(result);
    }

    // The removeLanguage method correctly removes a language from the list
    @IsTest
    public static void removeLanguage() {
        // Arrange
        LIST_UNDER_TEST.addLanguage('Java');
        LIST_UNDER_TEST.removeLanguage('Java');

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = LIST_UNDER_TEST.isEmpty();
        }
        Test.stopTest();

        // Assert
        Assert.isTrue(result);
    }

    // The firstLanguage method returns the first language that was added to the list
    @IsTest
    public static void firstLanguage() {
        // Arrange
        LIST_UNDER_TEST.addLanguage('Java');
        LIST_UNDER_TEST.addLanguage('Python');
        LIST_UNDER_TEST.addLanguage('Ruby');

        // Act
        String result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = LIST_UNDER_TEST.firstLanguage();
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('Java', result);
    }


    // The count method returns the number of languages in the list
    @IsTest
    public static void countThree() {
        // Arrange
        LIST_UNDER_TEST.addLanguage('Java');
        LIST_UNDER_TEST.addLanguage('Python');
        LIST_UNDER_TEST.addLanguage('Ruby');

        // Act
        Integer result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = LIST_UNDER_TEST.count();
        }
        Test.stopTest();

        // Assert
        Assert.areEqual(3, result);
    }

    // The count method returns the number of languages in the list
    @IsTest
    public static void countEmpty() {
        // Arrange
        // Nothing to do here

        // Act
        Integer result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = LIST_UNDER_TEST.count();
        }
        Test.stopTest();

        // Assert
        Assert.areEqual(0, result);
    }

    // The containsLanguage method returns true when the language is in the list
    @IsTest
    public static void containsLanguage() {
        // Arrange
        LIST_UNDER_TEST.addLanguage('Java');

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = LIST_UNDER_TEST.containsLanguage('Java');
        }
        Test.stopTest();

        // Assert
        Assert.isTrue(result);
    }

    // The containsLanguage method returns false when the language is not in the list
    @IsTest
    public static void doesNotContainLanguage() {
        // Arrange
        LIST_UNDER_TEST.addLanguage('Kotlin');

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = LIST_UNDER_TEST.containsLanguage('Java');
        }
        Test.stopTest();

        // Assert
        Assert.isFalse(result);
    }

    // The isExciting method returns true when the list contains Java
    @IsTest
    public static void excitingLanguageListWithJava() {
        // Arrange
        LIST_UNDER_TEST.addLanguage('Java');

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = LIST_UNDER_TEST.isExciting();
        }
        Test.stopTest();

        // Assert
        Assert.isTrue(result);
    }

    // The isExciting method returns true when the list contains Kotlin
    @IsTest
    public static void excitingLanguageListWithKotlin() {
        // Arrange
        LIST_UNDER_TEST.addLanguage('Python');
        LIST_UNDER_TEST.addLanguage('Kotlin');

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = LIST_UNDER_TEST.isExciting();
        }
        Test.stopTest();

        // Assert
        Assert.isTrue(result);
    }

    // The isExciting method returns false when the list contains neither Java nor Kotlin
    @IsTest
    public static void boringLanguageList() {
        // Arrange
        LIST_UNDER_TEST.addLanguage('Python');
        LIST_UNDER_TEST.addLanguage('Ruby');
        LIST_UNDER_TEST.addLanguage('C++');

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = LIST_UNDER_TEST.isExciting();
        }
        Test.stopTest();

        // Assert
        Assert.isFalse(result);
    }
}