public with sharing class ALP_BOWL_RollAdder implements ALP_BOWL_RollAdderIntf {
    private ALP_BOWL_RollAdder() {
    }

    private static ALP_BOWL_RollAdder instance;
    public static ALP_BOWL_RollAdder getInstance() {
        if (instance == null) {
            instance = new ALP_BOWL_RollAdder();
        }
        return instance;
    }

    private static Map<ALP_BOWL_BonusType, Type> ROLL_ADDER_TYPE_BY_BONUS_TYPE_MAP
            = new Map<ALP_BOWL_BonusType, Type>{
                    ALP_BOWL_BonusType.NONE => ALP_BOWL_OpenRollAdder.class,
                    ALP_BOWL_BonusType.SPARE => ALP_BOWL_AfterSpareRollAdder.class,
                    ALP_BOWL_BonusType.STRIKE => ALP_BOWL_AfterStrikeRollAdder.class
            };

    private static Map<ALP_BOWL_BonusType, ALP_BOWL_RollAdderIntf> ROLL_ADDER_INSTANCE_BY_BONUS_TYPE_MAP
            = new Map<ALP_BOWL_BonusType, ALP_BOWL_RollAdderIntf>();

    public ALP_BOWL_RollAdderIntf lookup(ALP_BOWL_BonusType bonusType) {
        ALP_BOWL_RollAdderIntf rollAdder = ROLL_ADDER_INSTANCE_BY_BONUS_TYPE_MAP.get(bonusType);
        if (rollAdder == null) {
            rollAdder = (ALP_BOWL_RollAdderIntf) ROLL_ADDER_TYPE_BY_BONUS_TYPE_MAP.get(bonusType)
                    .newInstance();
            ROLL_ADDER_INSTANCE_BY_BONUS_TYPE_MAP.put(bonusType, rollAdder);
        }
        return rollAdder;
    }

    public ALP_BOWL_Game addRolls(ALP_BOWL_Game game, Integer pinsKnockedDown) {
        System.debug('####### ALP_BOWL_RollAdder addRolls: ' + pinsKnockedDown);
        this.validate(pinsKnockedDown);
        return this.lookup(game.getBonusType())
                .addRolls(game, pinsKnockedDown);
    }

    private Boolean validate(Integer pinsKnockedDown) {
        if (pinsKnockedDown < 0) {
            throw new ALP_BOWL_RollException('Negative roll is invalid');
        }
        else if (pinsKnockedDown > ALP_BOWL_Game.MAXIMUM_PIN_COUNT) {
            throw new ALP_BOWL_RollException('Pin count exceeds pins on the lane');
        }
        return true;
    }
}