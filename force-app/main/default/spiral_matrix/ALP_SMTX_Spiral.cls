public with sharing class ALP_SMTX_Spiral {
    public List<List<Integer>> matrix(Integer dimension) {
        return (dimension == 0)
                ? new List<List<Integer>>()
                : new ALP_SMTX_SpiralGrid(dimension)
                        .populate()
                        .toRowValueListList();
    }
}