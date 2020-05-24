@IsTest
private class ConnectTest {
	private static final User TEST_USER = TEST_DummyUserFactoryOutlet.TEST_ADMIN_USER;
	private static final Connect CONNECT_UNDER_TEST = new Connect();

	private static final StoneColour EXPECTED_WINNER_NONE = StoneColour.None;
	private static final StoneColour EXPECTED_WINNER_BLACK = StoneColour.Black;
	private static final StoneColour EXPECTED_WINNER_WHITE = StoneColour.White;

	@IsTest
	public static void testResultForEmptyBoardShouldHaveNoWinner() {
		List<String> board = removeSpaces(new List<String>{
				'. . . . .',
				' . . . . .',
				'  . . . . .',
				'   . . . . .',
				'    . . . . .'
		});
		testResultFor(board, EXPECTED_WINNER_NONE);
	}

	@IsTest
	public static void testResultFor1x1BoardWithBlackStoneShouldHaveBlackWinner() {
		List<String> board = new List<String>{
				'X'
		};
		testResultFor(board, EXPECTED_WINNER_BLACK);
	}

	@IsTest
	public static void testResultFor1x1BoardWithWhiteStoneShouldHaveWhiteWinner() {
		List<String> board = new List<String>{
				'O'
		};
		testResultFor(board, EXPECTED_WINNER_WHITE);
	}

	@IsTest
	public static void testResultForThisConvolutedPathShouldHaveBlackWinner() {
		List<String> board = removeSpaces(new List<String>{
				'. X X . .',
				' X . X . X',
				'  . X . X .',
				'   . X X . .',
				'    O O O O O'
		});
		testResultFor(board, EXPECTED_WINNER_BLACK);
	}

	@IsTest
	public static void testResultForThisRectangleShouldHaveBlackWinner() {
		List<String> board = removeSpaces(new List<String>{
				'. O . .',
				' O X X X',
				'  O X O .',
				'   X X O X',
				'    . O X .'
		});
		testResultFor(board, EXPECTED_WINNER_BLACK);
	}

	@IsTest
	public static void testResultForThisRectangleShouldHaveWhiteWinner() {
		List<String> board = removeSpaces(new List<String>{
				'. O . .',
				' O X X X',
				'  O O O .',
				'   X X O X',
				'    . O X .'
		});
		testResultFor(board, EXPECTED_WINNER_WHITE);
	}

	@IsTest
	public static void testResultForThisSpiralShouldHaveBlackWinner() {
		List<String> board = new List<String>{
				'OXXXXXXXX',
				'OXOOOOOOO',
				'OXOXXXXXO',
				'OXOXOOOXO',
				'OXOXXXOXO',
				'OXOOOXOXO',
				'OXXXXXOXO',
				'OOOOOOOXO',
				'XXXXXXXXO'
		};
		testResultFor(board, EXPECTED_WINNER_BLACK);
	}

	@IsTest
	public static void testResultForThisSpiralShouldHaveNoWinner() {
		List<String> board = new List<String>{
				'OXXXXXXXX',
				'OXOOOOOOO',
				'OXOXXXXXO',
				'OXOXOOOXO',
				'OXOX.XOXO',
				'OXOOOXOXO',
				'OXXXXXOXO',
				'OOOOOOOXO',
				'XXXXXXXXO'
		};
		testResultFor(board, EXPECTED_WINNER_BLACK);
	}

	private static void testResultFor(List<String> board, StoneColour expectedResult) {
		// Act
		StoneColour result;
		Test.startTest();
		System.runAs(TEST_USER) {
			result = CONNECT_UNDER_TEST.resultFor(board);
		}
		Test.stopTest();

		// Assert
		System.assertEquals(result, expectedResult);
	}

	private static List<String> removeSpaces(List<String> rows) {
		List<String> spacelessRows = new List<String>();
		for (String row : rows) {
			spacelessRows.add(row.replace(' ', ''));
		}
		return spacelessRows;
	}
}