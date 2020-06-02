public with sharing class ALP_BOWL_RollHandler {
    private ALP_BOWL_RollHandler() {
    }

    private static ALP_BOWL_RollHandler instance;
    public static ALP_BOWL_RollHandler getInstance() {
        if (instance == null) {
            instance = new ALP_BOWL_RollHandler();
        }
        return instance;
    }

    public ALP_BOWL_RollHandler roll(ALP_BOWL_GameContext gameContext, Integer pinsKnockedDown) {
        this.validateRoll(gameContext, pinsKnockedDown);

        gameContext.addRoll(pinsKnockedDown)
                .setToNewFrame(pinsKnockedDown)
                .updateBonusRounds();

        return this;
    }

    private ALP_BOWL_RollHandler validateRoll(ALP_BOWL_GameContext gameContext, Integer pinsKnockedDown) {
        if (pinsKnockedDown < 0) {
            throw new ALP_BOWL_RollException('Negative roll is invalid');
        }
        if (pinsKnockedDown + gameContext.getPreviousPinsDown() > ALP_BOWL_GameContext.MAXIMUM_PINS) {
            throw new ALP_BOWL_RollException('Pin count exceeds pins on the lane');
        }
        if (!gameContext.hasMoreRolls()) {
            throw new ALP_BOWL_RollException('Cannot roll after game is over');
        }
        return this;
    }
}