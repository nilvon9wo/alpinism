public with sharing class ALP_CONX_HexCellFactory {
	private ALP_CONX_HexCellFactory() {
	}

	private static ALP_CONX_HexCellFactory instance;
	public static ALP_CONX_HexCellFactory getInstance() {
		if (instance == null) {
			instance = new ALP_CONX_HexCellFactory();
		}
		return instance;
	}

	public List<ALP_CONX_HexCell> fromStringList(List<String> board) {
		//List<String> reverseBoard = this.listHelper.reverse(board);

		List<ALP_CONX_HexCell> cellList = new List<ALP_CONX_HexCell>();
		for (Integer rowIndex = 0; rowIndex < board.size(); rowIndex++) {
			List<String> occupantList = board[rowIndex].split('');
			for (Integer columnIndex = 0; columnIndex < occupantList.size(); columnIndex++) {
				cellList.add(new ALP_CONX_HexCell(rowIndex, columnIndex, occupantList[columnIndex]));
			}
		}
		return cellList;
	}

	public List<ALP_CONX_HexCell> generateStartCellList(ALP_CONX_Orientation orientation, Integer maximum) {
		return this.generateCellList(orientation, maximum, 0);
	}

	public List<ALP_CONX_HexCell> generateEndCellList(ALP_CONX_Orientation orientation, Integer maximum) {
		return this.generateCellList(orientation, maximum, maximum);
	}

	private List<ALP_CONX_HexCell> generateCellList(ALP_CONX_Orientation orient, Integer maximum, Integer stableValue) {
		List<ALP_CONX_HexCell> cellList = new List<ALP_CONX_HexCell>();
		for (Integer i = 0; i <= maximum; i++) {
			cellList.add(
					(ALP_CONX_Orientation.HORIZONTAL.equals(orient))
							? new ALP_CONX_HexCell(i, stableValue)
							: new ALP_CONX_HexCell(stableValue, i)
			);
		}
		return cellList;
	}

}