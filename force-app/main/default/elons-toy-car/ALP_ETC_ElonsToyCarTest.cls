@IsTest
private class ALP_ETC_ElonsToyCarTest {
    private static final User TEST_USER = TEST_DummyUserFactoryOutlet.TEST_ADMIN_USER;

    // The static buy method returns a new remote controlled car instance
    @IsTest
    public static void buy_new_car_returns_instance() {
        // Arrange
        // Nothing to do here

        // Act
        ALP_ETC_ElonsToyCar result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_ETC_ElonsToyCar.buy();
        }
        Test.stopTest();

        // Assert
        Assert.isNotNull(result);
    }

    // The static buy method returns each time a new remote controlled car instance
    @IsTest
    public static void buy_new_car_returns_new_car_each_time() {
        // Arrange
        ALP_ETC_ElonsToyCar car1 = ALP_ETC_ElonsToyCar.buy();

        // Act
        ALP_ETC_ElonsToyCar car2;
        Test.startTest();
        System.runAs(TEST_USER) {
            car2 = ALP_ETC_ElonsToyCar.buy();
        }
        Test.stopTest();

        // Assert
        Assert.areNotEqual(car1, car2);
    }

    // The distanceDisplay method shows 0 meters message on a new car
    @IsTest
    public static void new_car_distance_display() {
        // Arrange
        ALP_ETC_ElonsToyCar carUnderTest = ALP_ETC_ElonsToyCar.buy();

        // Act
        String result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = carUnderTest.distanceDisplay();
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('Driven 0 meters', result);
    }

    // The batteryDisplay method shows full battery message on a new car
    @IsTest
    public static void new_car_battery_display() {
        // Arrange
        ALP_ETC_ElonsToyCar carUnderTest = ALP_ETC_ElonsToyCar.buy();

        // Act
        String result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = carUnderTest.batteryDisplay();
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('Battery at 100%', result);
    }

    // The distanceDisplay method shows the correct message after driving once
    @IsTest
    public static void distance_display_after_driving_once() {
        // Arrange
        ALP_ETC_ElonsToyCar carUnderTest = ALP_ETC_ElonsToyCar.buy();

        // Act
        Test.startTest();
        System.runAs(TEST_USER) {
            carUnderTest.drive();
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('Driven 20 meters', carUnderTest.distanceDisplay());
    }

    // The distanceDisplay method shows the correct message after driving multiple times
    @IsTest
    public static void distance_display_after_driving_multiple_times() {
        // Arrange
        ALP_ETC_ElonsToyCar carUnderTest = ALP_ETC_ElonsToyCar.buy();

        // Act
        Test.startTest();
        System.runAs(TEST_USER) {
            for (Integer i = 0; i < 17; i++) {
                carUnderTest.drive();
            }
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('Driven 340 meters', carUnderTest.distanceDisplay());
    }

    // The batteryDisplay method shows the correct message after driving once
    @IsTest
    public static void battery_display_after_driving_once() {
        // Arrange
        ALP_ETC_ElonsToyCar carUnderTest = ALP_ETC_ElonsToyCar.buy();

        // Act
        Test.startTest();
        System.runAs(TEST_USER) {
            carUnderTest.drive();
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('Battery at 99%', carUnderTest.batteryDisplay());
    }

    // The batteryDisplay method shows the correct battery percentage after driving multiple times
    @IsTest
    public static void battery_display_after_driving_multiple_times() {
        // Arrange
        ALP_ETC_ElonsToyCar carUnderTest = ALP_ETC_ElonsToyCar.buy();

        // Act
        Test.startTest();
        System.runAs(TEST_USER) {
            for (Integer i = 0; i < 23; i++) {
                carUnderTest.drive();
            }
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('Battery at 77%', carUnderTest.batteryDisplay());
    }

    // The batteryDisplay method shows battery empty after draining all battery
    @IsTest
    public static void battery_display_when_battery_empty() {
        // Arrange
        ALP_ETC_ElonsToyCar carUnderTest = ALP_ETC_ElonsToyCar.buy();

        // Act
        Test.startTest();
        System.runAs(TEST_USER) {
            for (Integer i = 0; i < 100; i++) {
                carUnderTest.drive();
            }
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('Battery empty', carUnderTest.batteryDisplay());
    }

    // The distanceDisplay method shows the correct message after driving and draining all battery
    @IsTest
    public static void distance_display_when_battery_empty() {
        // Arrange
        ALP_ETC_ElonsToyCar carUnderTest = ALP_ETC_ElonsToyCar.buy();

        // Act
        Test.startTest();
        System.runAs(TEST_USER) {
            for (Integer i = 0; i < 100; i++) {
                carUnderTest.drive();
            }
        }
        Test.stopTest();

        // Assert
        Assert.areEqual('Driven 2000 meters', carUnderTest.distanceDisplay());
    }
}