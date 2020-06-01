public with sharing class ALP_BOWL_AfterSpareRollAdder implements ALP_BOWL_RollAdderIntf {
    private ALP_BOWL_RollAdder rollAdder;

    private ALP_BOWL_AfterSpareRollAdder(ALP_BOWL_RollAdder rollAdderLookup) {
        this.rollAdder = rollAdderLookup;
    }

    public ALP_BOWL_AfterSpareRollAdder() {
        this(ALP_BOWL_RollAdder.getInstance());
    }

    public ALP_BOWL_Game addRolls(ALP_BOWL_Game game, Integer pinsKnockedDown) {
        System.debug('####### ALP_BOWL_AfterSpareRollAdder addRolls: ' + pinsKnockedDown);
        return this.isBonusBall(game)
                ? addBonusBall(game, pinsKnockedDown)
                : this.rollAdder.lookup(ALP_BOWL_BonusType.NONE)
                        .addRolls(game, pinsKnockedDown);
    }

    private Boolean isBonusBall(ALP_BOWL_Game game) {
        return ALP_BOWL_Game.MAXIMUM_PIN_COUNT == game.getFrameCount()
                && game.getLastRoll() + game.getPenultimateRoll() == 10;
    }

    private ALP_BOWL_Game addBonusBall(ALP_BOWL_Game game, Integer pinsKnockedDown) {
        return game.addRoll(pinsKnockedDown)
                .setIsNewFrame(false)
                .setBonusType(ALP_BOWL_BonusType.SPARE)
                .incrementBonusRollCount();
    }
}