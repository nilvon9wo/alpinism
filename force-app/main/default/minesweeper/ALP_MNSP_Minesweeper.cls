public with sharing class ALP_MNSP_Minesweeper {
    public List<String> annotate(List<String> board) {
        return new ALP_MNSP_SquareGrid(board)
            .annotate()
            .toStringList();
    }
}