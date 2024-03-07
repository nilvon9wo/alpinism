public with sharing class ALP_SMTX_DirectionHelper {
    public static final Map<ALP_SMTX_Direction, ALP_SMTX_Direction> NEXT_DIRECTION_BY_LAST_DIRECTION_MAP
            = new Map<ALP_SMTX_Direction, ALP_SMTX_Direction>{
                    ALP_SMTX_Direction.UP => ALP_SMTX_Direction.RIGHT,
                    ALP_SMTX_Direction.RIGHT => ALP_SMTX_Direction.DOWN,
                    ALP_SMTX_Direction.DOWN => ALP_SMTX_Direction.LEFT,
                    ALP_SMTX_Direction.LEFT => ALP_SMTX_Direction.UP
            };
}