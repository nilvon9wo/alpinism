@IsTest
private class ALP_SCLN_SqueakyCleanTest {
    private static final User TEST_USER = TEST_DummyUserFactoryOutlet.TEST_ADMIN_USER;

    // The clean method returns empty string when invoked on empty string
    @IsTest
    public static void empty() {
        // Arrange
        // Nothing to do here

        // Act
        String result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_SCLN_SqueakyClean.clean('');
        }
        Test.stopTest();

        // Assert
        Assert.isTrue(String.isEmpty(result));
    }

    // The clean method returns the same string when invoked on a single letter string
    @IsTest
    public static void single_letter() {
        // Arrange
        // Nothing to do here

        // Act
        String result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_SCLN_SqueakyClean.clean('A');
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('A', result);
    }

    // The clean method returns the same string when invoked on a string of three letters
    @IsTest
    public static void three_letter_string() {
        // Arrange
        // Nothing to do here

        // Act
        String result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_SCLN_SqueakyClean.clean('abc');
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('abc', result);
    }

    // The clean method replaces whitespaces with underscores in the middle of the string
    @IsTest
    public static void spaces() {
        // Arrange
        // Nothing to do here

        // Act
        String result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_SCLN_SqueakyClean.clean('my   Id');
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('my___Id', result);
    }

    // The clean method replaces leading and trailing whitespaces with underscores
    @IsTest
    public static void leading_and_trailing_spaces() {
        // Arrange
        // Nothing to do here

        // Act
        String result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_SCLN_SqueakyClean.clean(' myId ');
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('_myId_', result);
    }

    // The clean method converts kebab to camel case after removing a dash
    @IsTest
    public static void kebab_to_camel_case() {
        // Arrange
        // Nothing to do here

        // Act
        String result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_SCLN_SqueakyClean.clean('a-bc');
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('aBc', result);
    }

    // The clean method returns a string in camel case after removing a dash and replaces a whitespace
    @IsTest
    public static void kebab_to_camel_case_and_number() {
        // Arrange
        // Nothing to do here

        // Act
        String result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_SCLN_SqueakyClean.clean('a-C ');
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('aC_', result);
    }

    // The clean method returns a string in camel case and replaces leading and trailing whitespaces
    @IsTest
    public static void kebab_to_camel_case_and_spaces() {
        // Arrange
        // Nothing to do here

        // Act
        String result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_SCLN_SqueakyClean.clean(' hello-world ');
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('_helloWorld_', result);
    }

    // The clean method converts leetspeak to normal text after replacing numbers with chars
    @IsTest
    public static void leetspeak_to_normal_text() {
        // Arrange
        // Nothing to do here

        // Act
        String result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_SCLN_SqueakyClean.clean('H3ll0 W0rld');
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('Hello_World', result);
    }

    // The clean method converts leetspeak to normal text with spaces and special characters
    @IsTest
    public static void leetspeak_to_normal_text_with_spaces_and_special_characters() {
        // Arrange
        // Nothing to do here

        // Act
        String result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_SCLN_SqueakyClean.clean('¡1337sp34k is fun!');
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('leetspeak_is_fun', result);
    }

    // The clean method removes all characters that are not letters
    @IsTest
    public static void special_characters() {
        // Arrange
        // Nothing to do here

        // Act
        String result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_SCLN_SqueakyClean.clean('a$#.b');
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('ab', result);
    }

    // The clean method removes all characters that are not letters and replaces spaces
    @IsTest
    public static void special_characters_and_spaces() {
        // Arrange
        // Nothing to do here

        // Act
        String result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_SCLN_SqueakyClean.clean('¡hello world!. ');
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('hello_world_', result);
    }
}