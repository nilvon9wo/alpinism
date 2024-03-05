@IsTest
public with sharing class ALP_AINF_AnnalynsInfiltrationTest {
    private static final User TEST_USER = TEST_DummyUserFactoryOutlet.TEST_ADMIN_USER;

    // The canFastAttack method returns false when knight is awake
    @IsTest
    public static void cannot_execute_fast_attack_if_knight_is_awake() {
        // Arrange
        Boolean knightIsAwake = true;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canFastAttack(knightIsAwake);
        }
        Test.stopTest();

        // Assert
        Assert.isFalse(result);
    }

    // The canFastAttack method returns false when knight is sleeping
    @IsTest
    public static void can_execute_fast_attack_if_knight_is_sleeping() {
        // Arrange
        Boolean knightIsAwake = false;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canFastAttack(knightIsAwake);
        }
        Test.stopTest();

        // Assert
        Assert.isTrue(result);
    }

    // The canSpy method returns false when everyone is sleeping
    @IsTest
    public static void cannot_spy_if_everyone_is_sleeping() {
        // Arrange
        Boolean knightIsAwake = false;
        Boolean archerIsAwake = false;
        Boolean prisonerIsAwake = false;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canSpy(knightIsAwake, archerIsAwake, prisonerIsAwake);
        }
        Test.stopTest();

        // Assert
        Assert.isFalse(result);
    }

    // The canSpy method returns true when everyone but knight is sleeping
    @IsTest
    public static void can_spy_if_everyone_but_knight_is_sleeping() {
        // Arrange
        Boolean knightIsAwake = true;
        Boolean archerIsAwake = false;
        Boolean prisonerIsAwake = false;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canSpy(knightIsAwake, archerIsAwake, prisonerIsAwake);
        }
        Test.stopTest();

        // Assert
        Assert.isTrue(result);
    }

    // The canSpy method returns true when everyone but archer is sleeping
    @IsTest
    public static void can_spy_if_everyone_but_archer_is_sleeping() {
        // Arrange
        Boolean knightIsAwake = false;
        Boolean archerIsAwake = true;
        Boolean prisonerIsAwake = false;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canSpy(knightIsAwake, archerIsAwake, prisonerIsAwake);
        }
        Test.stopTest();

        // Assert
        Assert.isTrue(result);
    }

    // The canSpy method returns true when everyone but prisoner is sleeping
    @IsTest
    public static void can_spy_if_everyone_but_prisoner_is_sleeping() {
        // Arrange
        Boolean knightIsAwake = false;
        Boolean archerIsAwake = false;
        Boolean prisonerIsAwake = true;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canSpy(knightIsAwake, archerIsAwake, prisonerIsAwake);
        }
        Test.stopTest();

        // Assert
        Assert.isTrue(result);
    }

    // The canSpy method returns true when only knight is sleeping
    @IsTest
    public static void can_spy_if_only_knight_is_sleeping() {
        // Arrange
        Boolean knightIsAwake = false;
        Boolean archerIsAwake = true;
        Boolean prisonerIsAwake = true;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canSpy(knightIsAwake, archerIsAwake, prisonerIsAwake);
        }
        Test.stopTest();

        // Assert
        Assert.isTrue(result);
    }

    // The canSpy method returns true when only archer is sleeping
    @IsTest
    public static void can_spy_if_only_archer_is_sleeping() {
        // Arrange
        Boolean knightIsAwake = true;
        Boolean archerIsAwake = false;
        Boolean prisonerIsAwake = true;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canSpy(knightIsAwake, archerIsAwake, prisonerIsAwake);
        }
        Test.stopTest();

        // Assert
        Assert.isTrue(result);
    }

    // The canSpy method returns true when only prisoner is sleeping
    @IsTest
    public static void can_spy_if_only_prisoner_is_sleeping() {
        // Arrange
        Boolean knightIsAwake = true;
        Boolean archerIsAwake = true;
        Boolean prisonerIsAwake = false;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canSpy(knightIsAwake, archerIsAwake, prisonerIsAwake);
        }
        Test.stopTest();

        // Assert
        Assert.isTrue(result);
    }

    // The canSpy method returns true when everyone is awake
    @IsTest
    public static void can_spy_if_everyone_is_awake() {
        // Arrange
        Boolean knightIsAwake = true;
        Boolean archerIsAwake = true;
        Boolean prisonerIsAwake = true;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canSpy(knightIsAwake, archerIsAwake, prisonerIsAwake);
        }
        Test.stopTest();

        // Assert
        Assert.isTrue(result);
    }

    // The canSignalPrisoner method returns true when prisoner is awake and archer is sleeping
    @IsTest
    public static void can_signal_prisoner_if_archer_is_sleeping_and_prisoner_is_awake() {
        // Arrange
        Boolean archerIsAwake = false;
        Boolean prisonerIsAwake = true;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canSignalPrisoner(archerIsAwake, prisonerIsAwake);
        }
        Test.stopTest();

        // Assert
        Assert.isTrue(result);
    }

    // The canSignalPrisoner method returns false when prisoner is sleeping and archer is awake
    @IsTest
    public static void cannot_signal_prisoner_if_archer_is_awake_and_prisoner_is_sleeping() {
        // Arrange
        Boolean archerIsAwake = true;
        Boolean prisonerIsAwake = false;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canSignalPrisoner(archerIsAwake, prisonerIsAwake);
        }
        Test.stopTest();

        // Assert
        Assert.isFalse(result);
    }

    // The canSignalPrisoner method returns false when both prisoner and archer are sleeping
    @IsTest
    public static void cannot_signal_prisoner_if_archer_and_prisoner_are_both_sleeping() {
        // Arrange
        Boolean archerIsAwake = false;
        Boolean prisonerIsAwake = false;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canSignalPrisoner(archerIsAwake, prisonerIsAwake);
        }
        Test.stopTest();

        // Assert
        Assert.isFalse(result);
    }

    // The canSignalPrisoner method returns false when both prisoner and archer are awake
    @IsTest
    public static void cannot_signal_prisoner_if_archer_and_prisoner_are_both_awake() {
        // Arrange
        Boolean archerIsAwake = true;
        Boolean prisonerIsAwake = true;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canSignalPrisoner(archerIsAwake, prisonerIsAwake);
        }
        Test.stopTest();

        // Assert
        Assert.isFalse(result);
    }

    // The canFreePrisoner method returns false when everyone is awake and pet dog is present
    @IsTest
    public static void cannot_release_prisoner_if_everyone_is_awake_and_pet_dog_is_present() {
        // Arrange
        Boolean knightIsAwake = true;
        Boolean archerIsAwake = true;
        Boolean prisonerIsAwake = true;
        Boolean petDogIsPresent = true;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canFreePrisoner(knightIsAwake, archerIsAwake, prisonerIsAwake, petDogIsPresent);
        }
        Test.stopTest();

        // Assert
        Assert.isFalse(result);
    }

    // The canFreePrisoner method returns false when everyone is awake and pet dog is absent
    @IsTest
    public static void cannot_release_prisoner_if_everyone_is_awake_and_pet_dog_is_absent() {
        // Arrange
        Boolean knightIsAwake = true;
        Boolean archerIsAwake = true;
        Boolean prisonerIsAwake = true;
        Boolean petDogIsPresent = false;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canFreePrisoner(knightIsAwake, archerIsAwake, prisonerIsAwake, petDogIsPresent);
        }
        Test.stopTest();

        // Assert
        Assert.isFalse(result);
    }

    // The canFreePrisoner method returns true when everyone is sleeping and pet dog is present
    @IsTest
    public static void can_release_prisoner_if_everyone_is_asleep_and_pet_dog_is_present() {
        // Arrange
        Boolean knightIsAwake = false;
        Boolean archerIsAwake = false;
        Boolean prisonerIsAwake = false;
        Boolean petDogIsPresent = true;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canFreePrisoner(knightIsAwake, archerIsAwake, prisonerIsAwake, petDogIsPresent);
        }
        Test.stopTest();

        // Assert
        Assert.isTrue(result);
    }

    // The canFreePrisoner method returns false when everyone is sleeping and pet dog is absent
    @IsTest
    public static void cannot_release_prisoner_if_everyone_is_asleep_and_pet_dog_is_absent() {
        // Arrange
        Boolean knightIsAwake = false;
        Boolean archerIsAwake = false;
        Boolean prisonerIsAwake = false;
        Boolean petDogIsPresent = false;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canFreePrisoner(knightIsAwake, archerIsAwake, prisonerIsAwake, petDogIsPresent);
        }
        Test.stopTest();

        // Assert
        Assert.isFalse(result);
    }

    // The canFreePrisoner method returns true when only prisoner is awake and pet dog is present
    @IsTest
    public static void can_release_prisoner_if_only_prisoner_is_awake_and_pet_dog_is_present() {
        // Arrange
        Boolean knightIsAwake = false;
        Boolean archerIsAwake = false;
        Boolean prisonerIsAwake = true;
        Boolean petDogIsPresent = true;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canFreePrisoner(knightIsAwake, archerIsAwake, prisonerIsAwake, petDogIsPresent);
        }
        Test.stopTest();

        // Assert
        Assert.isTrue(result);
    }

    // The canFreePrisoner method returns true when only prisoner is awake and pet dog is absent
    @IsTest
    public static void can_release_prisoner_if_only_prisoner_is_awake_and_pet_dog_is_absent() {
        // Arrange
        Boolean knightIsAwake = false;
        Boolean archerIsAwake = false;
        Boolean prisonerIsAwake = true;
        Boolean petDogIsPresent = false;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canFreePrisoner(knightIsAwake, archerIsAwake, prisonerIsAwake, petDogIsPresent);
        }
        Test.stopTest();

        // Assert
        Assert.isTrue(result);
    }

    // The canFreePrisoner method returns false when only archer is awake and pet dog is present
    @IsTest
    public static void cannot_release_prisoner_if_only_archer_is_awake_and_pet_dog_is_present() {
        // Arrange
        Boolean knightIsAwake = false;
        Boolean archerIsAwake = true;
        Boolean prisonerIsAwake = false;
        Boolean petDogIsPresent = true;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canFreePrisoner(knightIsAwake, archerIsAwake, prisonerIsAwake, petDogIsPresent);
        }
        Test.stopTest();

        // Assert
        Assert.isFalse(result);
    }

    // The canFreePrisoner method returns false when only archer is awake and pet dog is absent
    @IsTest
    public static void cannot_release_prisoner_if_only_archer_is_awake_and_pet_dog_is_absent() {
        // Arrange
        Boolean knightIsAwake = false;
        Boolean archerIsAwake = true;
        Boolean prisonerIsAwake = false;
        Boolean petDogIsPresent = false;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canFreePrisoner(knightIsAwake, archerIsAwake, prisonerIsAwake, petDogIsPresent);
        }
        Test.stopTest();

        // Assert
        Assert.isFalse(result);
    }

    // The canFreePrisoner method returns true when only knight is awake and pet dog is present
    @IsTest
    public static void can_release_prisoner_if_only_knight_is_awake_and_pet_dog_is_present() {
        // Arrange
        Boolean knightIsAwake = true;
        Boolean archerIsAwake = false;
        Boolean prisonerIsAwake = false;
        Boolean petDogIsPresent = true;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canFreePrisoner(knightIsAwake, archerIsAwake, prisonerIsAwake, petDogIsPresent);
        }
        Test.stopTest();

        // Assert
        Assert.isTrue(result);
    }

    // The canFreePrisoner method returns false when only knight is awake and pet dog is absent
    @IsTest
    public static void cannot_release_prisoner_if_only_knight_is_awake_and_pet_dog_is_absent() {
        // Arrange
        Boolean knightIsAwake = true;
        Boolean archerIsAwake = false;
        Boolean prisonerIsAwake = false;
        Boolean petDogIsPresent = false;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canFreePrisoner(knightIsAwake, archerIsAwake, prisonerIsAwake, petDogIsPresent);
        }
        Test.stopTest();

        // Assert
        Assert.isFalse(result);
    }

    // The canFreePrisoner method returns false when only knight is sleeping and pet dog is present
    @IsTest
    public static void cannot_release_prisoner_if_only_knight_is_asleep_and_pet_dog_is_present() {
        // Arrange
        Boolean knightIsAwake = false;
        Boolean archerIsAwake = true;
        Boolean prisonerIsAwake = true;
        Boolean petDogIsPresent = true;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canFreePrisoner(knightIsAwake, archerIsAwake, prisonerIsAwake, petDogIsPresent);
        }
        Test.stopTest();

        // Assert
        Assert.isFalse(result);
    }

    // The canFreePrisoner method returns false when only knight is sleeping and pet dog is absent
    @IsTest
    public static void cannot_release_prisoner_if_only_knight_is_asleep_and_pet_dog_is_absent() {
        // Arrange
        Boolean knightIsAwake = false;
        Boolean archerIsAwake = true;
        Boolean prisonerIsAwake = true;
        Boolean petDogIsPresent = false;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canFreePrisoner(knightIsAwake, archerIsAwake, prisonerIsAwake, petDogIsPresent);
        }
        Test.stopTest();

        // Assert
        Assert.isFalse(result);
    }

    // The canFreePrisoner method returns true when only archer is sleeping and pet dog is present
    @IsTest
    public static void can_release_prisoner_if_only_archer_is_asleep_and_pet_dog_is_present() {
        // Arrange
        Boolean knightIsAwake = true;
        Boolean archerIsAwake = false;
        Boolean prisonerIsAwake = true;
        Boolean petDogIsPresent = true;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canFreePrisoner(knightIsAwake, archerIsAwake, prisonerIsAwake, petDogIsPresent);
        }
        Test.stopTest();

        // Assert
        Assert.isTrue(result);
    }

    // The canFreePrisoner method returns false when only archer is sleeping and pet dog is absent
    @IsTest
    public static void cannot_release_prisoner_if_only_archer_is_asleep_and_pet_dog_is_absent() {
        // Arrange
        Boolean knightIsAwake = true;
        Boolean archerIsAwake = false;
        Boolean prisonerIsAwake = true;
        Boolean petDogIsPresent = false;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canFreePrisoner(knightIsAwake, archerIsAwake, prisonerIsAwake, petDogIsPresent);
        }
        Test.stopTest();

        // Assert
        Assert.isFalse(result);
    }

    // The canFreePrisoner method returns false when only prisoner is sleeping and pet dog is present
    @IsTest
    public static void cannot_release_prisoner_if_only_prisoner_is_asleep_and_pet_dog_is_present() {
        // Arrange
        Boolean knightIsAwake = true;
        Boolean archerIsAwake = true;
        Boolean prisonerIsAwake = false;
        Boolean petDogIsPresent = true;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canFreePrisoner(knightIsAwake, archerIsAwake, prisonerIsAwake, petDogIsPresent);
        }
        Test.stopTest();

        // Assert
        Assert.isFalse(result);
    }

    // The canFreePrisoner method returns false when only prisoner is sleeping and pet dog is absent
    @IsTest
    public static void cannot_release_prisoner_if_only_prisoner_is_asleep_and_pet_dog_is_absent() {
        // Arrange
        Boolean knightIsAwake = true;
        Boolean archerIsAwake = true;
        Boolean prisonerIsAwake = false;
        Boolean petDogIsPresent = false;

        // Act
        Boolean result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = ALP_AINF_AnnalynsInfiltration.canFreePrisoner(knightIsAwake, archerIsAwake, prisonerIsAwake, petDogIsPresent);
        }
        Test.stopTest();

        // Assert
        Assert.isFalse(result);
    }
}