@IsTest
public with sharing class ALP_MNSP_MinesweeperTest {
    private static final User TEST_USER = TEST_DummyUserFactoryOutlet.TEST_ADMIN_USER;
    private static final ALP_MNSP_Minesweeper SWEEPER_UNDER_TEST = new ALP_MNSP_Minesweeper();

    @IsTest
    public static void testAnnotatingNoRowsResultsInEmptyList() {
        // Arrange
        List<String> testMineList = new List<String>();
        List<String> expectedResultList = new List<String>();
        testAnnotate(testMineList, expectedResultList);
    }

    @IsTest
    public static void testAnnotatingShouldReturnEmptyStringForNoColumns() {
        // Arrange
        List<String> testMineList = new List<String>{''};
        List<String> expectedResultList = new List<String>{''};
        testAnnotate(testMineList, expectedResultList);
    }

    @IsTest
    public static void testAnnotatingShouldReturnEmptyStringsForNoMines() {
        // Arrange
        List<String> testMineList = new List<String>{
                '   ',
                '   ',
                '   '
        };
        List<String> expectedResultList = new List<String>{
                '   ',
                '   ',
                '   '
        };
        testAnnotate(testMineList, expectedResultList);
    }

    @IsTest
    public static void testAnnotatingShouldReturnAllAsterisksStringsForAllMines() {
        // Arrange
        List<String> testMineList = new List<String>{
                '***',
                '***',
                '***'
        };
        List<String> expectedResultList = new List<String>{
                '***',
                '***',
                '***'
        };
        testAnnotate(testMineList, expectedResultList);
    }

    @IsTest
    public static void testAnnotatingShouldReturnAsteriskSurroundedByOnesWhenCenterIsOnlyMine() {
        // Arrange
        List<String> testMineList = new List<String>{
                '   ',
                ' * ',
                '   '
        };
        List<String> expectedResultList = new List<String>{
                '111',
                '1*1',
                '111'
        };
        testAnnotate(testMineList, expectedResultList);
    }

    @IsTest
    public static void testAnnotatingShouldReturnEightSurroundedByAsterisksWhenCenterIsOnlyNoneMine() {
        // Arrange
        List<String> testMineList = new List<String>{
                '***',
                '* *',
                '***'
        };
        List<String> expectedResultList = new List<String>{
                '***',
                '*8*',
                '***'
        };
        testAnnotate(testMineList, expectedResultList);
    }

    @IsTest
    public static void testAnnotatingShouldCorrectlyEvaluateHorizontalLine() {
        // Arrange
        List<String> testMineList = new List<String>{' * * '};
        List<String> expectedResultList = new List<String>{'1*2*1'};
        testAnnotate(testMineList, expectedResultList);
    }

    @IsTest
    public static void testAnnotatingShouldCorrectlyEvaluateVerticalLineWithMiddleMines() {
        // Arrange
        List<String> testMineList = new List<String>{
                ' ',
                '*',
                ' ',
                '*',
                ' '
        };
        List<String> expectedResultList = new List<String>{
                '1',
                '*',
                '2',
                '*',
                '1'
        };
        testAnnotate(testMineList, expectedResultList);
    }

    @IsTest
    public static void testAnnotatingShouldCorrectlyEvaluateVerticalLineWithEndpointMines() {
        // Arrange
        List<String> testMineList = new List<String>{
                '*',
                ' ',
                ' ',
                ' ',
                '*'
        };
        List<String> expectedResultList = new List<String>{
                '*',
                '1',
                ' ',
                '1',
                '*'
        };
        testAnnotate(testMineList, expectedResultList);
    }

    @IsTest
    public static void testAnnotatingShouldCorrectlyEvaluateACross() {
        // Arrange
        List<String> testMineList = new List<String>{
                '  *  ',
                '  *  ',
                '*****',
                '  *  ',
                '  *  '
        };
        List<String> expectedResultList = new List<String>{
                ' 2*2 ',
                '25*52',
                '*****',
                '25*52',
                ' 2*2 '
        };
        testAnnotate(testMineList, expectedResultList);
    }

    @IsTest
    public static void testAnnotatingShouldCorrectlyEvaluateALargeAsymmetricalMinefield() {
        // Arrange
        List<String> testMineList = new List<String>{
                ' *  * ',
                '  *   ',
                '    * ',
                '   * *',
                ' *  * ',
                '      '
        };
        List<String> expectedResultList = new List<String>{
                '1*22*1',
                '12*322',
                ' 123*2',
                '112*4*',
                '1*22*2',
                '111111'
        };
        testAnnotate(testMineList, expectedResultList);
    }

    private static void testAnnotate(List<String> testMineList, List<String> expectedResultList) {
        // Act
        List<String> actualResultList;
        Test.startTest();
        System.runAs(TEST_USER) {
            actualResultList = SWEEPER_UNDER_TEST.annotate(testMineList);
        }
        Test.stopTest();

        // Assert
        System.assertEquals(expectedResultList, actualResultList);
    }
}

