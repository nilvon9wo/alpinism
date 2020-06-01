public with sharing class ALP_BOWL_AfterStrikeRollAdder implements ALP_BOWL_RollAdderIntf {
    private ALP_BOWL_RollAdder rollAdder;

    private ALP_BOWL_AfterStrikeRollAdder(ALP_BOWL_RollAdder rollAdderLookup) {
        this.rollAdder = rollAdderLookup;
    }

    public ALP_BOWL_AfterStrikeRollAdder() {
        this(ALP_BOWL_RollAdder.getInstance());
    }

    private static final Integer MAXIMUM_PIN_COUNT = ALP_BOWL_Game.MAXIMUM_PIN_COUNT;

    public ALP_BOWL_Game addRolls(ALP_BOWL_Game game, Integer pinsKnockedDown) {
        System.debug('####### ALP_BOWL_AfterStrikeRollAdder addRolls: ' + pinsKnockedDown);
        this.validate(game, pinsKnockedDown);

        return this.isBonusRoll(game)
                ? addBonusRoll(game, pinsKnockedDown)
                : this.rollAdder.lookup(ALP_BOWL_BonusType.NONE)
                        .addRolls(game, pinsKnockedDown);
    }

    private Boolean validate(ALP_BOWL_Game game, Integer pinsKnockedDown) {
        Integer lastRoll = game.getLastRoll();
        if (
                lastRoll != null
                        && ALP_BOWL_Game.LAST_FRAME == game.getFrameCount()
                        && MAXIMUM_PIN_COUNT == game.getPenultimateRoll()
                        && 1 == game.getBonusRollCount()
                        && MAXIMUM_PIN_COUNT == lastRoll
                        && (
                        MAXIMUM_PIN_COUNT == pinsKnockedDown
                                || MAXIMUM_PIN_COUNT < lastRoll + pinsKnockedDown
                )
                ) {
            throw new ALP_BOWL_RollException('Pin count exceeds pins on the lane');
        }
        return true;
    }

    private Boolean isBonusRoll(ALP_BOWL_Game game) {
        return ALP_BOWL_Game.LAST_FRAME == game.getFrameCount()
                && (
                this.isFirstBonusRoll(game)
                        || this.isSecondBonusRoll(game)
        );
    }

    private Boolean isFirstBonusRoll(ALP_BOWL_Game game) {
        return game.getPenultimateRoll() == 10
                && game.getBonusRollCount() == 1;
    }

    private Boolean isSecondBonusRoll(ALP_BOWL_Game game) {
        return game.getLastRoll() == 10
                && game.getBonusRollCount() == 0;
    }

    private ALP_BOWL_Game addBonusRoll(ALP_BOWL_Game game, Integer pinsKnockedDown) {
        return game.addRoll(pinsKnockedDown)
                .setIsNewFrame(false)
                .incrementBonusRollCount();
    }
}