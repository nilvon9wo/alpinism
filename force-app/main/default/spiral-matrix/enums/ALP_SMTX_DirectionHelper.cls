public with sharing class ALP_SMTX_DirectionHelper {
	public static final Map<ALP_SMTX_Direction, ALP_SMTX_NextCellSupplierIntf> NEXT_CELL_SUPPLIER_BY_DIRECTION_MAP
			= new Map<ALP_SMTX_Direction, ALP_SMTX_NextCellSupplierIntf>{
					ALP_SMTX_Direction.UP => new ALP_SMTX_NextCellUpSupplier(),
					ALP_SMTX_Direction.RIGHT => new ALP_SMTX_NextCellRightSupplier(),
					ALP_SMTX_Direction.DOWN => new ALP_SMTX_NextCellDownSupplier(),
					ALP_SMTX_Direction.LEFT => new ALP_SMTX_NextCellLeftSupplier()
			};

	public static final Map<ALP_SMTX_Direction, ALP_SMTX_Direction> NEXT_DIRECTION_BY_LAST_DIRECTION_MAP
			= new Map<ALP_SMTX_Direction, ALP_SMTX_Direction>{
					ALP_SMTX_Direction.UP => ALP_SMTX_Direction.RIGHT,
					ALP_SMTX_Direction.RIGHT => ALP_SMTX_Direction.DOWN,
					ALP_SMTX_Direction.DOWN => ALP_SMTX_Direction.LEFT,
					ALP_SMTX_Direction.LEFT => ALP_SMTX_Direction.UP
			};
}