@IsTest
private class ALP_CONX_ConnectTest {
	private static final User TEST_USER = TEST_DummyUserFactoryOutlet.TEST_ADMIN_USER;
	private static final ALP_CONX_Connect CONNECT_UNDER_TEST = new ALP_CONX_Connect();

	@IsTest
	public static void testResultForEmptyBoardShouldHaveNoWinner() {
		List<String> board = removeSpaces(new List<String>{
				'. . . . .',
				' . . . . .',
				'  . . . . .',
				'   . . . . .',
				'    . . . . .'
		});
		testResultFor(board, ALP_CONX_Colour.None);
	}

	@IsTest
	public static void testResultFor1x1BoardWithBlackStoneShouldHaveBlackWinner() {
		List<String> board = new List<String>{
				'X'
		};
		testResultFor(board, ALP_CONX_Colour.Black);
	}

	@IsTest
	public static void testResultFor1x1BoardWithWhiteStoneShouldHaveWhiteWinner() {
		List<String> board = new List<String>{
				'O'
		};
		testResultFor(board, ALP_CONX_Colour.White);
	}

	@IsTest
	public static void testResultForHorizontalConnectionThroughConvolutedPathShouldHaveBlackWinner() {
		List<String> board = removeSpaces(new List<String>{
				'. X X . .',
				' X . X . X',
				'  . X . X .',
				'   . X X . .',
				'    O O O O O'
		});
		testResultFor(board, ALP_CONX_Colour.Black);
	}

	@IsTest
	public static void testResultForHorizontalConnectionThroughRectangleShouldHaveBlackWinner() {
		List<String> board = removeSpaces(new List<String>{
				'. O . .',
				' O X X X',
				'  O X O .',
				'   X X O X',
				'    . O X .'
		});
		testResultFor(board, ALP_CONX_Colour.Black);
	}

	@IsTest
	public static void testResultForVerticalConnectionThroughRectangleShouldHaveWhiteWinner() {
		List<String> board = removeSpaces(new List<String>{
				'. O . .',
				' O X X X',
				'  O O O .',
				'   X X O X',
				'    . O X .'
		});
		testResultFor(board, ALP_CONX_Colour.White);
	}

	@IsTest
	public static void testResultForHorizontalConnectionThroughSpiralShouldHaveBlackWinner() {
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
		testResultFor(board, ALP_CONX_Colour.Black);
	}

	@IsTest
	public static void testResultForNoConnectionThroughSpiralShouldHaveNoWinner() {
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
		testResultFor(board, ALP_CONX_Colour.Black);
	}

	private static void testResultFor(List<String> board, ALP_CONX_Colour expectedResult) {
		// Act
		ALP_CONX_Colour actualResult;
		Test.startTest();
		System.runAs(TEST_USER) {
			actualResult = CONNECT_UNDER_TEST.resultFor(board);
		}
		Test.stopTest();

		// Assert
		System.assertEquals(expectedResult, actualResult);
	}

	private static List<String> removeSpaces(List<String> rows) {
		List<String> spacelessRows = new List<String>();
		for (String row : rows) {
			spacelessRows.add(row.replace(' ', ''));
		}
		return spacelessRows;
	}
}