@IsTest
public with sharing class ALP_POKR_PokerTest {
    private static final User TEST_USER = TEST_DummyUserFactoryOutlet.TEST_ADMIN_USER;
    private static final ALP_POKR_Poker POKER_UNDER_TEST = ALP_POKR_Poker.getInstance();

    @IsTest
    public static void testBestHandSingleHandAlwaysWins() {
        List<String> testHandCodeList = new List<String>{
                '4S 5S 7H 8D JC'
        };
        List<String> expectedHandCodeList = testHandCodeList;
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandHighestCardOutOfAllHandsWins() {
        String highOf8 = '4D 5S 6S 8D 3C';
        String highOf10 = '2S 4C 7S 9H 10H';
        String highOfJack = '3S 4S 5D 6H JH';
        List<String> testHandCodeList = new List<String>{
                highOf8, highOf10, highOfJack
        };
        List<String> expectedHandCodeList = new List<String>{
                highOfJack
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandATieHasMultipleWinners() {
        String highOf8 = '4D 5S 6S 8D 3C';
        String highOf10 = '2S 4C 7S 9H 10H';
        String highOfJack = '3S 4S 5D 6H JH';
        String anotherHighOfJack = '3H 4H 5C 6C JD';
        List<String> testHandCodeList = new List<String>{
                highOf8, highOf10, highOfJack, anotherHighOfJack
        };
        List<String> expectedHandCodeList = new List<String>{
                highOfJack, anotherHighOfJack
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandMultipleHandsWithTheSameHighCardsTieComparesNextHighestRankedDownToLastCard() {
        String highOf8LowOf3 = '3S 5H 6S 8D 7H';
        String highOf8LowOf2 = '2S 5D 6D 8C 7S';
        List<String> testHandCodeList = new List<String>{
                highOf8LowOf3, highOf8LowOf2
        };
        List<String> expectedHandCodeList = new List<String>{
                highOf8LowOf3
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandOnePairBeatsHighCard() {
        String highOfking = '4S 5H 6C 8D KH';
        String pairOf4 = '2S 4H 6S 4D JH';
        List<String> testHandCodeList = new List<String>{
                highOfking, pairOf4
        };
        List<String> expectedHandCodeList = new List<String>{
                pairOf4
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandHighestPairWins() {
        String pairOf2 = '4S 2H 6S 2D JH';
        String pairOf4 = '2S 4H 6C 4D JD';
        List<String> testHandCodeList = new List<String>{
                pairOf2, pairOf4
        };
        List<String> expectedHandCodeList = new List<String>{
                pairOf4
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandTwoPairsBeatsOnePair() {
        String pairOf8 = '2S 8H 6S 8D JH';
        String pairsOfFivesAndFours = '4S 5H 4C 8C 5C';
        List<String> testHandCodeList = new List<String>{
                pairOf8, pairsOfFivesAndFours
        };
        List<String> expectedHandCodeList = new List<String>{
                pairsOfFivesAndFours
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandBothHandsHaveTwoPairsHighestRankedPairWins() {
        String pairsOfEightsAndTwos = '2S 8H 2D 8D 3H';
        String pairsOfFivesAndFours = '4S 5H 4C 8S 5D';
        List<String> testHandCodeList = new List<String>{
                pairsOfEightsAndTwos, pairsOfFivesAndFours
        };
        List<String> expectedHandCodeList = new List<String>{
                pairsOfEightsAndTwos
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandBothHandsHaveTwoPairsWithTheSameHighestRankedPairTieGoesToLowPair() {
        String pairsOfQueensAndTwos = '2S QS 2C QD JH';
        String pairsOfQueensAndJacks = 'JD QH JS 8D QC';
        List<String> testHandCodeList = new List<String>{
                pairsOfQueensAndTwos, pairsOfQueensAndJacks
        };
        List<String> expectedHandCodeList = new List<String>{
                pairsOfQueensAndJacks
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandBothHandsHaveTwoIdenticallyRankedPairsTieGoesToRemainingCardKicker() {
        String pairsOfQueensAndJacksAnd8 = 'JD QH JS 8D QC';
        String pairsOfQueensAndJacksAnd2 = 'JS QS JC 2D QD';
        List<String> testHandCodeList = new List<String>{
                pairsOfQueensAndJacksAnd8, pairsOfQueensAndJacksAnd2
        };
        List<String> expectedHandCodeList = new List<String>{
                pairsOfQueensAndJacksAnd8
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandThreeOfAKindBeatsTwoPair() {
        String pairsOfEightsAndTwos = '2S 8H 2H 8D JH';
        String threeFours = '4S 5H 4C 8S 4H';
        List<String> testHandCodeList = new List<String>{
                pairsOfEightsAndTwos, threeFours
        };
        List<String> expectedHandCodeList = new List<String>{
                threeFours
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandBothHandsHaveThreeOfAKindTieGoesToHighestRankedTriplet() {
        String threeTwos = '2S 2H 2C 8D JH';
        String threeAces = '4S AH AS 8C AD';
        List<String> testHandCodeList = new List<String>{
                threeTwos, threeAces
        };
        List<String> expectedHandCodeList = new List<String>{
                threeAces
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandWithMultipleDecksTwoPlayersCanHaveSameThreeOfAKindTiesGoToHighestRemainingCards() {
        String threeAces7High = '4S AH AS 7C AD';
        String threeAces8High = '4S AH AS 8C AD';
        List<String> testHandCodeList = new List<String>{
                threeAces7High, threeAces8High
        };
        List<String> expectedHandCodeList = new List<String>{
                threeAces8High
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandAStraightBeatsThreeOfAKind() {
        String threeFours = '4S 5H 4C 8D 4H';
        String straight = '3S 4D 2S 6D 5C';
        List<String> testHandCodeList = new List<String>{
                threeFours, straight
        };
        List<String> expectedHandCodeList = new List<String>{
                straight
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandAcesCanBeEndOfAStraight10JQKA() {
        String threeFours = '4S 5H 4C 8D 4H';
        String straightToAce = '10D JH QS KD AC';
        List<String> testHandCodeList = new List<String>{
                threeFours, straightToAce
        };
        List<String> expectedHandCodeList = new List<String>{
                straightToAce
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandAcesCanBeStartOfAStraightA2345() {
        String threeFours = '4S 5H 4C 8D 4H';
        String straightTo5 = '4D AH 3S 2D 5C';
        List<String> testHandCodeList = new List<String>{
                threeFours, straightTo5
        };
        List<String> expectedHandCodeList = new List<String>{
                straightTo5
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandBothHandsWithAStraightTieGoesToHighestRankedCard() {
        String straightTo8 = '4S 6C 7S 8D 5H';
        String straightTo9 = '5S 7H 8S 9D 6H';
        List<String> testHandCodeList = new List<String>{
                straightTo8, straightTo9
        };
        List<String> expectedHandCodeList = new List<String>{
                straightTo9
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandEvenThoughAnAceIsUsuallyHighA5HighStraightIsTheLowestScoringStraight() {
        String straightTo6 = '2H 3C 4D 5D 6H';
        String straightTo5 = '4S AH 3S 2D 5H';
        List<String> testHandCodeList = new List<String>{
                straightTo6, straightTo5
        };
        List<String> expectedHandCodeList = new List<String>{
                straightTo6
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandFlushBeatsAStraight() {
        String straightTo8 = '4C 6H 7D 8D 5H';
        String flushTo7 = '2S 4S 5S 6S 7S';
        List<String> testHandCodeList = new List<String>{
                straightTo8, flushTo7
        };
        List<String> expectedHandCodeList = new List<String>{
                flushTo7
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandBothHandsHaveAFlushTieGoesToHighCardDownToTheLastOneIfNecessary() {
        String flushTo9 = '4H 7H 8H 9H 6H';
        String flushTo7 = '2S 4S 5S 6S 7S';
        List<String> testHandCodeList = new List<String>{
                flushTo9, flushTo7
        };
        List<String> expectedHandCodeList = new List<String>{
                flushTo9
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandFullHouseBeatsAFlush() {
        String flushTo8 = '3H 6H 7H 8H 5H';
        String fullHouse = '4S 5H 4C 5D 4H';
        List<String> testHandCodeList = new List<String>{
                flushTo8, fullHouse
        };
        List<String> expectedHandCodeList = new List<String>{
                fullHouse
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandBothHandsHaveAFullHouseTieGoesToHighestRankedTriplet() {
        String fullHouseOf4By9 = '4H 4S 4D 9S 9D';
        String fullHouseOf5By8 = '5H 5S 5D 8S 8D';
        List<String> testHandCodeList = new List<String>{
                fullHouseOf4By9, fullHouseOf5By8
        };
        List<String> expectedHandCodeList = new List<String>{
                fullHouseOf5By8
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandWithMultipleDecksBothHandsHaveAFullHouseWithThesameTripletTieGoesToThePair() {
        String fullHouseOf5By9 = '5H 5S 5D 9S 9D';
        String fullHouseOf5By8 = '5H 5S 5D 8S 8D';
        List<String> testHandCodeList = new List<String>{
                fullHouseOf5By9, fullHouseOf5By8
        };
        List<String> expectedHandCodeList = new List<String>{
                fullHouseOf5By9
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandFourOfAKindBeatsAFullHouse() {
        String fullHouse = '4S 5H 4D 5D 4H';
        String four3s = '3S 3H 2S 3D 3C';
        List<String> testHandCodeList = new List<String>{
                fullHouse, four3s
        };
        List<String> expectedHandCodeList = new List<String>{
                four3s
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandBothHandsHaveFourOfAKindTieGoesToHighQuad() {
        String four2s = '2S 2H 2C 8D 2D';
        String four5s = '4S 5H 5S 5D 5C';
        List<String> testHandCodeList = new List<String>{
                four2s, four5s
        };
        List<String> expectedHandCodeList = new List<String>{
                four5s
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandWithMultipleDecksBothHandsWithIdenticalFourOfAKindTieDeterminedByKicker() {
        String four3sAnd2 = '3S 3H 2S 3D 3C';
        String four3sAnd4 = '3S 3H 4S 3D 3C';
        List<String> testHandCodeList = new List<String>{
                four3sAnd2, four3sAnd4
        };
        List<String> expectedHandCodeList = new List<String>{
                four3sAnd4
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    @IsTest
    public static void testBestHandStraightFlushBeatsFourOfAKind() {
        String four5s = '4S 5H 5S 5D 5C';
        String straightFlushTo10 = '7S 8S 9S 6S 10S';
        List<String> testHandCodeList = new List<String>{
                four5s, straightFlushTo10
        };
        List<String> expectedHandCodeList = new List<String>{
                straightFlushTo10
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }


    @IsTest
    public static void testBestHandBothHandsHaveStraightFlushTieGoesToHighestRankedCard() {
        String straightFlushTo8 = '4H 6H 7H 8H 5H';
        String straightFlushTo9 = '5S 7S 8S 9S 6S';
        List<String> testHandCodeList = new List<String>{
                straightFlushTo8, straightFlushTo9
        };
        List<String> expectedHandCodeList = new List<String>{
                straightFlushTo9
        };
        testBestHand(testHandCodeList, expectedHandCodeList);
    }

    private static void testBestHand(List<String> testHandCodeList, List<String> expectedHandCodeList) {
        // Act
        List<String> resultHandCodeList;
        Test.startTest();
        System.runAs(TEST_USER) {
            resultHandCodeList = POKER_UNDER_TEST.bestHand(testHandCodeList);
        }
        Test.stopTest();

        // Assert
        System.assertEquals(expectedHandCodeList, resultHandCodeList);
    }
}