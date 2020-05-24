public with sharing class ALP_CONX_Connect {
	//	Calculates the winner (if any) of a board
	//	using "O" as the white player
	//	and "X" as the black player
	public ALP_CONX_Colour resultFor(List<String> board) {
		ALP_CONX_HexGrid hexGrid = new ALP_CONX_HexGrid(board);
		System.debug('########### hexGrid: ' + hexGrid);



		return (hexGrid.isConnected(ALP_CONX_Colour.White, ALP_CONX_Orientation.VERTICAL))
				? ALP_CONX_Colour.White
				: (hexGrid.isConnected(ALP_CONX_Colour.Black, ALP_CONX_Orientation.HORIZONTAL))
					? ALP_CONX_Colour.Black
					: ALP_CONX_Colour.None;
	}
}