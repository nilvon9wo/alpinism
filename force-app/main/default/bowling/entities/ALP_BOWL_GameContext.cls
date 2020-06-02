public with sharing class ALP_BOWL_GameContext {
    public static final Integer MAXIMUM_PINS = 10;
    public static final Integer MAXIMUM_FRAMES = 10;

    // Rolls -----------------------------------------------------------

    private List<Integer> pinsKnockedDownList = new List<Integer>();
    private List<Integer> bonusPinsKnockedDownList = new List<Integer>();
    public ALP_BOWL_GameContext addRoll(Integer pinsKnockedDown) {
        (
                (this.untakenBonusRounds == 0)
                        ? this.pinsKnockedDownList
                        : this.bonusPinsKnockedDownList
        ).add(pinsKnockedDown);
        return this;
    }

    public Integer getPreviousPinsDown() {
        return this.isNewFrame
                ? 0
                : this.getLastRoll();
    }

    public Integer getLastRoll() {
        return this.getRoll(-1);
    }

    public Integer getPenultimateRoll() {
        return this.getRoll(-2);
    }

    public Integer getRoll(Integer negativeIndex) {
        List<Integer> fullRollList = this.pinsKnockedDownList.clone();
        fullRollList.addAll(this.bonusPinsKnockedDownList);
        return fullRollList[fullRollList.size() + negativeIndex];
    }

    public Boolean hasMoreRolls() {
        return !this.isLastFrame()
                || this.hasBonusRolls();
    }

    // Frames -----------------------------------------------------------

    private Boolean isNewFrame = true;

    private Integer completedFrameCount = 0;
    public ALP_BOWL_GameContext setToNewFrame(Integer pinsKnockedDown) {
        this.isNewFrame = pinsKnockedDown == MAXIMUM_PINS || !this.isNewFrame;
        return this.incrementFrame();
    }

    private ALP_BOWL_GameContext incrementFrame() {
        if (this.isNewFrame && !this.hasBonusStarted) {
            this.completedFrameCount++;
        }
        return this;
    }

    public Boolean isLastFrame() {
        return this.completedFrameCount == MAXIMUM_FRAMES;
    }

    // Bonuses -----------------------------------------------------------

    private Boolean hasBonusStarted = false;

    private Boolean isStrike(Integer pinsKnockedDown) {
        return pinsKnockedDown == ALP_BOWL_GameContext.MAXIMUM_PINS;
    }

    private Boolean isSpare(Integer newPinsKnockedDown, Integer oldPinsKnockedDown) {
        return newPinsKnockedDown + oldPinsKnockedDown == ALP_BOWL_GameContext.MAXIMUM_PINS;
    }

    private Integer untakenBonusRounds = 0;

    public ALP_BOWL_GameContext updateBonusRounds() {
        return this.consumeBonusRounds()
                .addBonusRounds();
    }
    private ALP_BOWL_GameContext consumeBonusRounds() {
        if (this.untakenBonusRounds > 0) {
            this.untakenBonusRounds--;
        }
        return this;
    }

    private ALP_BOWL_GameContext addBonusRounds() {
        if (!this.hasBonusStarted && this.isLastFrame()) {
            Integer lastRoll = this.getLastRoll();
            if (this.isStrike(lastRoll)) {
                this.untakenBonusRounds = 2;
            }
            else if (this.isSpare(lastRoll, this.getPenultimateRoll())) {
                this.untakenBonusRounds = 1;
            }
            this.hasBonusStarted = this.untakenBonusRounds != 0;
        }
        return this;
    }

    public Boolean hasBonusRolls() {
        return this.untakenBonusRounds != 0;
    }
}