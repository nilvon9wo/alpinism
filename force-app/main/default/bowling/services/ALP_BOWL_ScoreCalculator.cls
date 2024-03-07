public with sharing class ALP_BOWL_ScoreCalculator {
    private ALP_BOWL_ScoreCalculator() {
    }

    private static ALP_BOWL_ScoreCalculator instance;
    public static ALP_BOWL_ScoreCalculator getInstance() {
        if (instance == null) {
            instance = new ALP_BOWL_ScoreCalculator();
        }
        return new ALP_BOWL_ScoreCalculator();
    }

    public Integer evaluate(ALP_BOWL_GameContext gameContext) {
        this.validateScorable(gameContext);

        List<Integer> normalKnockDowns = gameContext.getNormalRolls();
        List<Integer> allKnockDowns = gameContext.getAllRolls();

        Integer runningTotal = 0;
        for (Integer i = 0; i < normalKnockDowns.size(); i++) {
            Integer thisRoll = allKnockDowns[i];
            Integer nextRoll = allKnockDowns[i + 1];
            if (gameContext.isStrike(thisRoll)) {
                runningTotal += 10 + nextRoll + allKnockDowns[i + 2];
            } else if (gameContext.isSpare(thisRoll, nextRoll)) {
                runningTotal += 10 + allKnockDowns[i + 2];
                i++;
            } else {
                runningTotal += thisRoll + nextRoll;
                i++;
            }
        }
        return runningTotal;
    }

    public ALP_BOWL_ScoreCalculator validateScorable(ALP_BOWL_GameContext gameContext) {
        if (gameContext.hasMoreRolls()) {
            throw new ALP_BOWL_ScoreException('Score cannot be taken until the end of the game');
        }
        return this;
    }
}