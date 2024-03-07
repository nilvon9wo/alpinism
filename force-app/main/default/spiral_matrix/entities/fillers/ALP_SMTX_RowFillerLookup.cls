public with sharing class ALP_SMTX_RowFillerLookup implements ALP_SMTX_RowFillerIntf {
    private ALP_SMTX_RowFillerLookup() {
    }

    private static ALP_SMTX_RowFillerLookup instance;
    public static ALP_SMTX_RowFillerLookup getInstance() {
        if (instance == null) {
            instance = new ALP_SMTX_RowFillerLookup();
        }
        return instance;
    }

    private static final Map<Type, ALP_SMTX_RowFillerIntf> FILLER_INSTANCE_BY_TYPE_MAP
            = new Map<Type, ALP_SMTX_RowFillerIntf>{
            };

    public ALP_SMTX_SpiralGridIntf fillRow(ALP_SMTX_SpiralGridIntf grid, Integer row) {
        Type fillerNeeded = this.determineFillerNeeded(grid, row);
        ALP_SMTX_RowFillerIntf filler = FILLER_INSTANCE_BY_TYPE_MAP.get(fillerNeeded);
        if (filler == null) {
            filler = (ALP_SMTX_RowFillerIntf) fillerNeeded.newInstance();
            FILLER_INSTANCE_BY_TYPE_MAP.put(fillerNeeded, filler);
        }
        return filler.fillRow(grid, row);
    }

    private Type determineFillerNeeded(ALP_SMTX_SpiralGridIntf grid, Integer row) {
        return (row == 1)
                ? ALP_SMTX_FirstRowFiller.class
                : (row == grid.getDimension())
                        ? ALP_SMTX_LastRowFiller.class
                        : ALP_SMTX_MiddleRowFiller.class;
    }
}