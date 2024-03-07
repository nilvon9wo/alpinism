public with sharing class ALP_MNSP_Minesweeper {
    public List<String> annotate(List<String> board) {
        Integer boardSize = board.size();
        List<String> annotationList = new ALP_MNSP_SquareGrid(board)
                .annotate()
                .toStringList();
        return this.pad(annotationList, boardSize);
    }

    private List<String> pad(List<String> annotationList, Integer boardSize) {
        for (Integer size = annotationList.size(); size < boardSize; size++) {
            annotationList.add('');
        }
        return annotationList;
    }
}