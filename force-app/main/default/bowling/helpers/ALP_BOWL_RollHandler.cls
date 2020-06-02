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

        gameContext.addRoll(pinsKnockedDown);

        return this;
    }

}