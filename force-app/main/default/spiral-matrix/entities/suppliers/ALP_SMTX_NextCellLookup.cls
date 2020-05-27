public with sharing class ALP_SMTX_NextCellLookup implements ALP_SMTX_NextCellSupplierIntf {
	private ALP_SMTX_NextCellLookup(){
	}

	private static ALP_SMTX_NextCellLookup instance;
	public static ALP_SMTX_NextCellLookup getIntance() {
		if (instance == null) {
			instance = new ALP_SMTX_NextCellLookup();
		}
		return instance;
	}

	private static final Map<ALP_SMTX_Direction, Type> NEXT_CELL_SUPPLIER_TYPE_BY_DIRECTION_MAP
			= new Map<ALP_SMTX_Direction, Type>{
					ALP_SMTX_Direction.UP => ALP_SMTX_NextCellUpSupplier.class,
					ALP_SMTX_Direction.RIGHT => ALP_SMTX_NextCellRightSupplier.class,
					ALP_SMTX_Direction.DOWN => ALP_SMTX_NextCellDownSupplier.class,
					ALP_SMTX_Direction.LEFT => ALP_SMTX_NextCellLeftSupplier.class
			};

	public static final Map<ALP_SMTX_Direction, ALP_SMTX_NextCellSupplierIntf> NEXT_CELL_SUPPLIER_INSTANCE_BY_DIRECTION_MAP
			= new Map<ALP_SMTX_Direction, ALP_SMTX_NextCellSupplierIntf>();

	public ALP_SMTX_SquareCell getNextCell(ALP_SMTX_SquareGridIntf grid) {
		ALP_SMTX_Direction nextDirection = grid.getNextDirection();

		ALP_SMTX_NextCellSupplierIntf cellSupplier = NEXT_CELL_SUPPLIER_INSTANCE_BY_DIRECTION_MAP.get(nextDirection);
		if (cellSupplier == null) {
			cellSupplier = (ALP_SMTX_NextCellSupplierIntf) NEXT_CELL_SUPPLIER_TYPE_BY_DIRECTION_MAP.get(nextDirection)
					.newInstance();
			NEXT_CELL_SUPPLIER_INSTANCE_BY_DIRECTION_MAP.put(nextDirection, cellSupplier);
		}

		return cellSupplier.getNextCell(grid);
	}
}