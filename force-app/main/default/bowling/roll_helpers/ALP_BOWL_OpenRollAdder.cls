public with sharing class ALP_BOWL_OpenRollAdder implements ALP_BOWL_RollAdderIntf {
    private static final Integer MAXIMUM_PIN_COUNT = ALP_BOWL_Game.MAXIMUM_PIN_COUNT;

    public ALP_BOWL_Game addRolls(ALP_BOWL_Game game, Integer pinsKnockedDown) {
        System.debug('####### ALP_BOWL_OpenRollAdder addRolls: ' + pinsKnockedDown);
        this.validate(game, pinsKnockedDown);

        ALP_BOWL_BonusType bonusType = this.calculateBonusType(game, pinsKnockedDown);
        return game.addRoll(pinsKnockedDown)
                .setBonusType(bonusType)
                .setIsNewFrame(!ALP_BOWL_BonusType.NONE.equals(bonusType) || !game.isNewFrame());
    }

    private Boolean validate(ALP_BOWL_Game game, Integer pinsKnockedDown) {
        Integer lastRoll = game.getLastRoll();
        if (
                lastRoll != null
                        && game.isNewFrame()
                        && lastRoll + pinsKnockedDown > MAXIMUM_PIN_COUNT
                ) {
            throw new ALP_BOWL_RollException('Pin count exceeds pins on the lane');
        }
        else if (MAXIMUM_PIN_COUNT == game.getLastRoll()) {
            throw new ALP_BOWL_RollException('Cannot roll after game is over');
        }
        return true;
    }

    private ALP_BOWL_BonusType calculateBonusType (ALP_BOWL_Game game, Integer pinsKnockedDown) {
        return (MAXIMUM_PIN_COUNT == pinsKnockedDown)
            ? ALP_BOWL_BonusType.STRIKE
            : (MAXIMUM_PIN_COUNT == pinsKnockedDown + game.getLastRoll())
                ? ALP_BOWL_BonusType.SPARE
                : ALP_BOWL_BonusType.NONE;
    }
}