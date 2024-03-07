@IsTest
private class ALP_BWTCH_BirdWatcherTest {
    private static final User TEST_USER = TEST_DummyUserFactoryOutlet.TEST_ADMIN_USER;

    private static final Integer DAY1 = 0;
    private static final Integer DAY2 = 2;
    private static final Integer DAY3 = 5;
    private static final Integer DAY4 = 3;
    private static final Integer DAY5 = 7;
    private static final Integer DAY6 = 8;
    private static final Integer TODAY = 4;

    private static final Integer[] lastWeek = new Integer[]{
            DAY1, DAY2, DAY3, DAY4, DAY5, DAY6, TODAY
    };
    private static final ALP_BWTCH_BirdWatcher WATCHER_UNDER_TEST = new ALP_BWTCH_BirdWatcher(lastWeek);

    // The getLastWeek method correctly returns last week's counts
    @IsTest
    public static void itTestGetLastWeek() {
        // Arrange
        // Nothing to do here

        // Act
        Integer[] results;
        Test.startTest();
        System.runAs(TEST_USER) {
            results = WATCHER_UNDER_TEST.getLastWeek();
        }
        Test.stopTest();

        // Assert
        Assert.areEqual(lastWeek, results);
    }

    // The getToday method correctly returns today's counts
    @IsTest
    public static void itTestGetToday() {
        // Arrange
        // Nothing to do here

        // Act
        Integer result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = WATCHER_UNDER_TEST.getToday();
        }
        Test.stopTest();

        // Assert
        Assert.areEqual(TODAY, result);
    }

    // The incrementTodaysCount method correctly increments today's counts
    @IsTest
    public static void itIncrementTodaysCount() {
        // Arrange
        // Nothing to do here

        // Act
        Test.startTest();
        System.runAs(TEST_USER) {
            WATCHER_UNDER_TEST.incrementTodaysCount();
        }
        Test.stopTest();

        // Assert
        Assert.areEqual(TODAY + 1, WATCHER_UNDER_TEST.getToday());
    }

    // The hasDayWithoutBirds method returns true when day had no visits
    @IsTest
    public static void itHasDayWithoutBirds() {
        // Arrange
        // Nothing to do here

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = WATCHER_UNDER_TEST.hasDayWithoutBirds();
        }
        Test.stopTest();

        // Assert
        Assert.isTrue(result);
    }

    // The hasDayWithoutBirds method returns false when no day had zero visits
    @IsTest
    public static void itShouldNotHaveDaysWithoutBirds() {
        // Arrange
        ALP_BWTCH_BirdWatcher watcherUnderTest = new ALP_BWTCH_BirdWatcher(new Integer[]{
                1, 2, 5, 3, 7, 8, 4
        });

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = watcherUnderTest.hasDayWithoutBirds();
        }
        Test.stopTest();

        // Assert
        Assert.isFalse(result);
    }


    // The getCountForFirstDays method returns correct visits' count for given number of days
    @IsTest
    public static void itTestGetCountForFirstDays() {
        // Arrange
        // Nothing to do here

        // Act
        Integer result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = WATCHER_UNDER_TEST.getCountForFirstDays(4);
        }
        Test.stopTest();

        // Assert
        Assert.areEqual(DAY1 + DAY2 + DAY3 + DAY4, result);
    }

    // The getCountForFirstDays method returns overall count when number of days is higher than array size
    @IsTest
    public static void itTestGetCountForMoreDaysThanTheArraySize() {
        // Arrange
        // Nothing to do here

        // Act
        Integer result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = WATCHER_UNDER_TEST.getCountForFirstDays(10);
        }
        Test.stopTest();

        // Assert
        Assert.areEqual(DAY1 + DAY2 + DAY3 + DAY4 + DAY5 + DAY6 + TODAY, result);
    }

    // The getBusyDays method returns the correct count of busy days
    @IsTest
    public static void itTestGetCountForBusyDays() {
        // Arrange
        // Nothing to do here

        // Act
        Integer result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = WATCHER_UNDER_TEST.getBusyDays();
        }
        Test.stopTest();

        // Assert
        Assert.areEqual(3, result);
    }


    // The getBusyDays method correctly returns zero in case of no busy days
    @IsTest
    public static void itShouldNotHaveBusyDays() {
        // Arrange
        ALP_BWTCH_BirdWatcher watcherUnderTest = new ALP_BWTCH_BirdWatcher(new Integer[]{
                1, 2, 3, 3, 2, 1, 4
        });

        // Act
        Integer result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = watcherUnderTest.getBusyDays();
        }
        Test.stopTest();

        // Assert
        Assert.areEqual(0, result);
    }
}