@IsTest
public class ALP_HW_GreeterTest {
    private static final User TEST_USER = TEST_DummyUserFactoryOutlet.TEST_ADMIN_USER;

    @IsTest
    public static void testThatGreeterReturnsTheCorrectGreeting() {
        // Arrange
        ALP_HW_Greeter greeterUnderTest = new ALP_HW_Greeter();

        // Act
        String result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = greeterUnderTest.getGreeting();
        }
        Test.stopTest();

        // Assert
        System.assertEquals(result, 'Hello, World!');
    }
}