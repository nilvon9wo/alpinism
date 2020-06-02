public with sharing class ALP_BOWL_Bowling {
    ALP_BOWL_GameContext gameContext;
    ALP_BOWL_ScoreCalculator scoreCalculator;

    private ALP_BOWL_Bowling(ALP_BOWL_GameContext gameContext, ALP_BOWL_ScoreCalculator scoreCalculator) {
        this.gameContext = gameContext;
        this.scoreCalculator = scoreCalculator;
    }

    public ALP_BOWL_Bowling() {
        this(new ALP_BOWL_GameContext(), ALP_BOWL_ScoreCalculator.getInstance());
    }

    //    Records the number of pins knocked down on a single roll. Returns `any`
    //    unless there is something wrong with the given number of pins, in which
    //    case it returns a helpful message.
    public ALP_BOWL_Bowling roll(Integer pinsKnockedDown) {
        this.gameContext.addRoll(pinsKnockedDown);
        return this;
    }

    //    Returns the running_total of a given game of bowling if the game is complete.
    //    If the game isn't complete, it returns a helpful message.
    public Integer score() {
        return this.scoreCalculator.evaluate(this.gameContext);
    }
}