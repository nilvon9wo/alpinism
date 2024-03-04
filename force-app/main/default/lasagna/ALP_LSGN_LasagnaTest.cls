@IsTest
private class ALP_LSGN_LasagnaTest {
    private static final User TEST_USER = TEST_DummyUserFactoryOutlet.TEST_ADMIN_USER;
    private static final ALP_LSGN_Lasagna LASAGNA_UNDER_TEST = new ALP_LSGN_Lasagna();

    // The expectedMinutesInOven method returns the correct value
    @IsTest
    public static void expected_minutes_in_oven() {
        // Arrange
        // Nothing to do here

        // Act
        Integer result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = LASAGNA_UNDER_TEST.expectedMinutesInOven();
        }
        Test.stopTest();

        // Assert
        Assert.areEqual(40, result);
    }

    // The remainingMinutesInOven method calculates and returns the correct value
    @IsTest
    public static void remaining_minutes_in_oven() {
        // Arrange
        Integer elapsedMinutes = 25;

        // Act
        Integer result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = LASAGNA_UNDER_TEST.remainingMinutesInOven(elapsedMinutes);
        }
        Test.stopTest();

        // Assert
        Assert.areEqual(15, result);
    }

    // The preparationTimeInMinutes method calculates the correct value for single layer
    @IsTest
    public static void preparation_time_in_minutes_for_one_layer() {
        // Arrange
        Integer layerCount = 1;

        // Act
        Integer result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = LASAGNA_UNDER_TEST.preparationTimeInMinutes(layerCount);
        }
        Test.stopTest();

        // Assert
        Assert.areEqual(2, result);
    }

    // The preparationTimeInMinutes method calculates the correct value for multiple layers
    @IsTest
    public static void preparation_time_in_minutes_for_multiple_layers() {
        // Arrange
        Integer layerCount = 4;

        // Act
        Integer result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = LASAGNA_UNDER_TEST.preparationTimeInMinutes(layerCount);
        }
        Test.stopTest();

        // Assert
        Assert.areEqual(8, result);
    }


    // The totalTimeInMinutes method calculates the correct value for single layer
    @IsTest
    public static void total_time_in_minutes_for_one_layer() {
        // Arrange
        Integer layerCount = 1;
        Integer elapsedMinutes = 30;

        // Act
        Integer result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = LASAGNA_UNDER_TEST.totalTimeInMinutes(layerCount, elapsedMinutes);
        }
        Test.stopTest();

        // Assert
        Assert.areEqual(32, result);
    }

    // The totalTimeInMinutes method calculates the correct value for single layer
    @IsTest
    public static void total_time_in_minutes_for_multiple_layers() {
        // Arrange
        Integer layerCount = 4;
        Integer elapsedMinutes = 8;

        // Act
        Integer result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = LASAGNA_UNDER_TEST.totalTimeInMinutes(layerCount, elapsedMinutes);
        }
        Test.stopTest();

        // Assert
        Assert.areEqual(16, result);
    }
}