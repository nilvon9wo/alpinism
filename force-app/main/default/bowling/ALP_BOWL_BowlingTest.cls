@IsTest
public with sharing class ALP_BOWL_BowlingTest {
    private static final User TEST_USER = TEST_DummyUserFactoryOutlet.TEST_ADMIN_USER;

    // Roll Exception Tests ---------------------------------------------------------------------

    @IsTest
    public static void testRollShouldThrowExceptionForNegativePoints() {
        // Arrange
        ALP_BOWL_Bowling bowlingUnderTest = new ALP_BOWL_Bowling();
        Integer invalidPinsKnockedDown = -1;

        // Act
        testRollException(bowlingUnderTest, invalidPinsKnockedDown, 'Negative roll is invalid');
    }

    @IsTest
    public static void testRollShouldThrowExceptionForRollScoreMoreThan10Points() {
        // Arrange
        ALP_BOWL_Bowling bowlingUnderTest = new ALP_BOWL_Bowling();
        Integer invalidPinsKnockedDown = 11;

        // Act
        testRollException(bowlingUnderTest, invalidPinsKnockedDown, 'Pin count exceeds pins on the lane');
    }

    @IsTest
    public static void testRollShouldThrowExceptionForTwoRollsInSameFrameMoreThan10Points() {
        // Arrange
        ALP_BOWL_Bowling bowlingUnderTest = new ALP_BOWL_Bowling();
        bowlingUnderTest.roll(5);
        Integer invalidPinsKnockedDown = 6;

        // Act
        testRollException(bowlingUnderTest, invalidPinsKnockedDown, 'Pin count exceeds pins on the lane');
    }

    @IsTest
    public static void testRollShouldThrowExceptionForBonusRollAfterStrikeMoreThanTenPoints() {
        // Arrange
        List<Integer> rollList = new List<Integer>{
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10
        };
        ALP_BOWL_Bowling bowlingUnderTest = rollReduce(new ALP_BOWL_Bowling(), rollList);
        Integer invalidPinsKnockedDown = 11;

        // Act
        testRollException(bowlingUnderTest, invalidPinsKnockedDown, 'Pin count exceeds pins on the lane');
    }

    @IsTest
    public static void testRollShouldThrowExceptionForSecondBonusRollStrikeWithoutFirstBonusRollStrike() {
        // Arrange
        List<Integer> rollList = new List<Integer>{
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 6
        };
        ALP_BOWL_Bowling bowlingUnderTest = rollReduce(new ALP_BOWL_Bowling(), rollList);
        Integer invalidPinsKnockedDown = 10;

        // Act
        testRollException(bowlingUnderTest, invalidPinsKnockedDown, 'Pin count exceeds pins on the lane');
    }

    @IsTest
    public static void testRollShouldThrowExceptionForSecondBonusRollCannotScoreMoreThan10Points() {
        // Arrange
        List<Integer> rollList = new List<Integer>{
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10
        };
        ALP_BOWL_Bowling bowlingUnderTest = rollReduce(new ALP_BOWL_Bowling(), rollList);
        Integer invalidPinsKnockedDown = 11;

        // Act
        testRollException(bowlingUnderTest, invalidPinsKnockedDown, 'Pin count exceeds pins on the lane');
    }

    @IsTest
    public static void testRollShouldThrowExceptionGameAlreadyHasTenFrames() {
        // Arrange
        List<Integer> rollList = new List<Integer>{
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        };
        ALP_BOWL_Bowling bowlingUnderTest = rollReduce(new ALP_BOWL_Bowling(), rollList);
        Integer invalidPinsKnockedDown = 0;

        // Act
        testRollException(bowlingUnderTest, invalidPinsKnockedDown, 'Cannot roll after game is over');
    }

    @IsTest
    public static void testRollShouldThrowExceptionSpareAlreadyHasBonus() {
        // Arrange
        List<Integer> rollList = new List<Integer>{
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 2
        };
        ALP_BOWL_Bowling bowlingUnderTest = rollReduce(new ALP_BOWL_Bowling(), rollList);
        Integer invalidPinsKnockedDown = 2;

        // Act
        testRollException(bowlingUnderTest, invalidPinsKnockedDown, 'Cannot roll after game is over');
    }

    @IsTest
    public static void testRollShouldThrowExceptionStrikeAlreadyHasBonus() {
        // Arrange
        List<Integer> rollList = new List<Integer>{
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 3, 2
        };
        ALP_BOWL_Bowling bowlingUnderTest = rollReduce(new ALP_BOWL_Bowling(), rollList);
        Integer invalidPinsKnockedDown = 2;

        // Act
        testRollException(bowlingUnderTest, invalidPinsKnockedDown, 'Cannot roll after game is over');
    }

    private static void testRollException(
            ALP_BOWL_Bowling bowlingUnderTest,
            Integer nextPinsKnockedDown,
            String expectedMessage
    ) {
        // Act
        ALP_BOWL_RollException resultException;
        Test.startTest();
        System.runAs(TEST_USER) {
            try {
                bowlingUnderTest.roll(nextPinsKnockedDown);
            }
            catch (ALP_BOWL_RollException ex) {
                resultException = ex;
            }
        }
        Test.stopTest();

        // Assert
        System.assertNotEquals(null, resultException);
        System.assertEquals(expectedMessage, resultException.getMessage());
    }

    // Score Tests ---------------------------------------------------------------------

    @IsTest
    public static void testScoreShouldBeAbleToScoreAGameWithAllZeros() {
        List<Integer> rollList = new List<Integer>{
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        };
        Integer expectedResult = 0;
        testScore(rollList, expectedResult);
    }

    @IsTest
    public static void testScoreShouldBeAbleToScoreAGameWithNoStrikesOrSpares() {
        List<Integer> rollList = new List<Integer>{
                3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6, 3, 6
        };
        Integer expectedResult = 90;
        testScore(rollList, expectedResult);
    }

    @IsTest
    public static void testScoreShouldAssign10PointsToASpareFollowedByZeros() {
        List<Integer> rollList = new List<Integer>{
                6, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        };
        Integer expectedResult = 10;
        testScore(rollList, expectedResult);
    }

    @IsTest
    public static void testScoreShouldCountPointsInTheRollAfterASpareTwice() {
        List<Integer> rollList = new List<Integer>{
                6, 4, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        };
        Integer expectedResult = 16;
        testScore(rollList, expectedResult);
    }

    @IsTest
    public static void testScoreShouldCountABonusRollForEachConsecutiveSpare() {
        List<Integer> rollList = new List<Integer>{
                5, 5, 3, 7, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        };
        Integer expectedResult = 31;
        testScore(rollList, expectedResult);
    }

    @IsTest
    public static void testScoreShouldCountABonusRollOnceForASpareInTheLastFrame() {
        List<Integer> rollList = new List<Integer>{
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 7
        };
        Integer expectedResult = 17;
        testScore(rollList, expectedResult);
    }

    @IsTest
    public static void testScoreShouldCountTenPointsForAStrike() {
        List<Integer> rollList = new List<Integer>{
                10, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        };
        Integer expectedResult = 10;
        testScore(rollList, expectedResult);
    }

    @IsTest
    public static void testScoreShouldCountTheTwoRollsAfterAStrikeTwiceAsABonus() {
        List<Integer> rollList = new List<Integer>{
                10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        };
        Integer expectedResult = 26;
        testScore(rollList, expectedResult);
    }

    @IsTest
    public static void testScoreShouldCountTwoBonusRollsForEachConsecutiveStrike() {
        List<Integer> rollList = new List<Integer>{
                10, 10, 10, 5, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        };
        Integer expectedResult = 81;
        testScore(rollList, expectedResult);
    }

    @IsTest
    public static void testScoreShouldCountATwoBonusRollsEachOnceForAStrikeInTheLastFrame() {
        List<Integer> rollList = new List<Integer>{
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 1
        };
        Integer expectedResult = 18;
        testScore(rollList, expectedResult);
    }

    @IsTest
    public static void testScoreShouldNotCountAdditionalBonusRollsForASpareInTwoRollBonus() {
        List<Integer> rollList = new List<Integer>{
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 7, 3
        };
        Integer expectedResult = 20;
        testScore(rollList, expectedResult);
    }

    @IsTest
    public static void testScoreShouldNotCountAdditionalBonusRollsForASpikesInSpikeTwoRollBonus() {
        List<Integer> rollList = new List<Integer>{
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10
        };
        Integer expectedResult = 30;
        testScore(rollList, expectedResult);
    }

    @IsTest
    public static void testScoreShouldNotCountAdditionalBonusRollsForASpikesInSpareOneRollBonus() {
        List<Integer> rollList = new List<Integer>{
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3, 10
        };
        Integer expectedResult = 20;
        testScore(rollList, expectedResult);
    }

    @IsTest
    public static void testScoreShouldReturn300ForAPerfectGame() {
        List<Integer> rollList = new List<Integer>{
                10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10, 10
        };
        Integer expectedResult = 300;
        testScore(rollList, expectedResult);
    }

    @IsTest
    public static void testScoreShouldCountMoreThan10PointsBetweenStrikeBonusRollsIfOneIsAStrike() {
        List<Integer> rollList = new List<Integer>{
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 6
        };
        Integer expectedResult = 26;
        testScore(rollList, expectedResult);
    }

    private static void testScore(List<Integer> rollList, Integer expectedResult) {
        // Arrange
        ALP_BOWL_Bowling bowlingUnderTest = rollReduce(new ALP_BOWL_Bowling(), rollList);

        // Act
        Integer result;
        Test.startTest();
        System.runAs(TEST_USER) {
            result = bowlingUnderTest.score();
        }
        Test.stopTest();

        // Assert
        System.assertEquals(expectedResult, result);
    }

    // Score Exception Tests ---------------------------------------------------------------------

    @IsTest
    public static void testScoreThrowsExceptionWhenGameHasNotStarted() {
        // Arrange
        ALP_BOWL_Bowling bowlingUnderTest = new ALP_BOWL_Bowling();

        // Act
        testScoreException(bowlingUnderTest, 'Score cannot be taken until the end of the game');
    }

    @IsTest
    public static void testScoreThrowsExceptionWhenGameHasNotCompleted() {
        // Arrange
        List<Integer> rollList = new List<Integer>{
                0, 0
        };
        ALP_BOWL_Bowling bowlingUnderTest = rollReduce(new ALP_BOWL_Bowling(), rollList);

        // Act
        testScoreException(bowlingUnderTest, 'Score cannot be taken until the end of the game');
    }

    @IsTest
    public static void testScoreThrowsExceptionWhenBonusRollsForStrikeHaveNotBeenRolled() {
        // Arrange
        List<Integer> rollList = new List<Integer>{
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10
        };
        ALP_BOWL_Bowling bowlingUnderTest = rollReduce(new ALP_BOWL_Bowling(), rollList);

        // Act
        testScoreException(bowlingUnderTest, 'Score cannot be taken until the end of the game');
    }

    @IsTest
    public static void testScoreThrowsExceptionWhenBothBonusRollsForStrikeHaveNotBeenRolled() {
        // Arrange
        List<Integer> rollList = new List<Integer>{
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10
        };
        ALP_BOWL_Bowling bowlingUnderTest = rollReduce(new ALP_BOWL_Bowling(), rollList);

        // Act
        testScoreException(bowlingUnderTest, 'Score cannot be taken until the end of the game');
    }

    @IsTest
    public static void testScoreThrowsExceptionWhenBonusRollForSpareHasNotBeenRolled() {
        // Arrange
        List<Integer> rollList = new List<Integer>{
                0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 7, 3
        };
        ALP_BOWL_Bowling bowlingUnderTest = rollReduce(new ALP_BOWL_Bowling(), rollList);

        // Act
        testScoreException(bowlingUnderTest, 'Score cannot be taken until the end of the game');
    }

    private static void testScoreException(ALP_BOWL_Bowling bowlingUnderTest, String expectedMessage) {
        // Act
        ALP_BOWL_ScoreException resultException;
        Test.startTest();
        System.runAs(TEST_USER) {
            try {
                bowlingUnderTest.score();
            }
            catch (ALP_BOWL_ScoreException ex) {
                System.debug('######### testScoreException ex: ' + ex);
                resultException = ex;
            }
        }
        Test.stopTest();

        // Assert
        System.debug('######### testScoreException resultException: ' + resultException);
        System.assertNotEquals(null, resultException);
        System.assertEquals(expectedMessage, resultException.getMessage());
    }

    // Helpers ---------------------------------------------------------------------------------

    private static ALP_BOWL_Bowling rollReduce(ALP_BOWL_Bowling game, List<Integer> rollList) {
        for (Integer roll : rollList) {
            game.roll(roll);
        }
        return game;
    }
}