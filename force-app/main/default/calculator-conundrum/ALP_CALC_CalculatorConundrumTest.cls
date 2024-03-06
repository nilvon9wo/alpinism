@IsTest
private class ALP_CALC_CalculatorConundrumTest {
    private static final User TEST_USER = TEST_DummyUserFactoryOutlet.TEST_ADMIN_USER;
    private static final ALP_CALC_CalculatorConundrum CALCULATOR_UNDER_TEST = new ALP_CALC_CalculatorConundrum();

    // The calculate method returns the correct result when adding small operands
    @IsTest
    public static void additionWithSmallOperands() {
        // Arrange
        // Nothing to do here

        // Act
        String result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = CALCULATOR_UNDER_TEST.calculate(22, 25, '+');
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('22 + 25 = 47', result);
    }

    // The calculate method returns the correct result when adding large operands
    @IsTest
    public static void additionWithLargeOperands() {
        // Arrange
        // Nothing to do here

        // Act
        String result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = CALCULATOR_UNDER_TEST.calculate(378961, 399635, '+');
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('378961 + 399635 = 778596', result);
    }

    // The calculate method returns the correct result when multiplying small operands
    @IsTest
    public static void multiplicationWithSmallOperands() {
        // Arrange
        // Nothing to do here

        // Act
        String result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = CALCULATOR_UNDER_TEST.calculate(3, 21, '*');
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('3 * 21 = 63', result);
    }

    // The calculate method returns the correct result when multiplying large operands
    @IsTest
    public static void multiplicationWithLargeOperands() {
        // Arrange
        // Nothing to do here

        // Act
        String result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = CALCULATOR_UNDER_TEST.calculate(72441, 2048, '*');
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('72441 * 2048 = 148359168', result);
    }

    // The calculate method returns the correct result when dividing small operands
    @IsTest
    public static void divisionWithSmallOperands() {
        // Arrange
        // Nothing to do here

        // Act
        String result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = CALCULATOR_UNDER_TEST.calculate(72, 9, '/');
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('72 / 9 = 8', result);
    }

    // The calculate method returns the correct result when dividing large operands
    @IsTest
    public static void divisionWithLargeOperands() {
        // Arrange
        // Nothing to do here

        // Act
        String result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = CALCULATOR_UNDER_TEST.calculate(1338800, 83675, '/');
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('1338800 / 83675 = 16', result);
    }

    // The calculate method throws IllegalOperationException when passing invalid operation
    @IsTest
    public static void throwExceptionForUnknownOperation() {
        // Arrange
        String invalidOperation = '**';

        // Act
        IllegalArgumentException caughtException;
        Test.startTest();
        System.runAs(TEST_USER) {
            try {
                CALCULATOR_UNDER_TEST.calculate(3, 78, invalidOperation);
            }
            catch (IllegalArgumentException ex) {
                caughtException = ex;
            }
        }
        Test.stopTest();

        // Assert
        Assert.isNotNull(caughtException);
        String expectedMessage = 'Operation \'' + invalidOperation + '\' does not exist.';
        Assert.areEqual(expectedMessage, caughtException.getMessage());
    }

    // The calculate method throws IllegalArgumentException when passing null operation
    @IsTest
    public static void throwExceptionForNullAsOperation() {
        // Arrange
        String invalidOperation = null;

        // Act
        IllegalArgumentException caughtException;
        Test.startTest();
        System.runAs(TEST_USER) {
            try {
                CALCULATOR_UNDER_TEST.calculate(66, 65, invalidOperation);
            }
            catch (IllegalArgumentException ex) {
                caughtException = ex;
            }
        }
        Test.stopTest();

        // Assert
        Assert.isNotNull(caughtException);
        String expectedMessage = 'Operation cannot be null.';
        Assert.areEqual(expectedMessage, caughtException.getMessage());
    }

    // The calculate method throws IllegalArgumentException when passing empty operation
    @IsTest
    public static void throwExceptionForAnEmptyStringOperation() {
        // Arrange
        String invalidOperation = '';

        // Act
        IllegalArgumentException caughtException;
        Test.startTest();
        System.runAs(TEST_USER) {
            try {
                CALCULATOR_UNDER_TEST.calculate(34, 324, invalidOperation);
            }
            catch (IllegalArgumentException ex) {
                caughtException = ex;
            }
        }
        Test.stopTest();

        // Assert
        Assert.isNotNull(caughtException);
        String expectedMessage = 'Operation cannot be blank.';
        Assert.areEqual(expectedMessage, caughtException.getMessage());
    }


    // The calculate method throws IllegalOperationException when dividing by zero
    @IsTest
    public static void throwExceptionForDivisionByZero() {
        // Arrange
        String invalidOperation = '/';

        // Act
        ALP_CALC_IllegalOperationException caughtException;
        Test.startTest();
        System.runAs(TEST_USER) {
            try {
                CALCULATOR_UNDER_TEST.calculate(33, 0, invalidOperation);
            }
            catch (ALP_CALC_IllegalOperationException ex) {
                caughtException = ex;
            }
        }
        Test.stopTest();

        // Assert
        Assert.isNotNull(caughtException);
        String expectedMessage = 'Division by zero is not allowed.';
        Assert.areEqual(expectedMessage, caughtException.getMessage());

        Exception actualCause = caughtException.getCause();
        Assert.isTrue(actualCause instanceof ALP_CALC_ArithmeticException);
    }
}