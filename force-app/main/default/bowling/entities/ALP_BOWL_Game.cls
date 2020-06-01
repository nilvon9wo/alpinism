public with sharing class ALP_BOWL_Game {
    public static final Integer LAST_FRAME = 10;
    public static final Integer MAXIMUM_PIN_COUNT = 10;

    // pinsKnockedDownList --------------------------------------------------------------

    private List<Integer> pinsKnockedDownList = new List<Integer>();

    public ALP_BOWL_Game addRoll(Integer pinsKnockedDown) {
        this.pinsKnockedDownList.add(pinsKnockedDown);
        return this;
    }

    public Integer getLastRoll() {
        return (!this.pinsKnockedDownList.isEmpty())
                ? this.pinsKnockedDownList[this.pinsKnockedDownList.size() - 1]
                : 0;
    }

    public Integer getPenultimateRoll() {
        return (this.pinsKnockedDownList.size() > 1)
                ? this.pinsKnockedDownList[this.pinsKnockedDownList.size() - 2]
                : 0;
    }

    // bonusType --------------------------------------------------------------

    private ALP_BOWL_BonusType bonusType = ALP_BOWL_BonusType.NONE;

    public ALP_BOWL_BonusType getBonusType() {
        return this.bonusType;
    }

    public ALP_BOWL_Game setBonusType(ALP_BOWL_BonusType bonusType) {
        this.bonusType = bonusType;
        return this;
    }

    // isNewFrame --------------------------------------------------------------

    private Boolean isNewFrame = true;

    public Boolean isNewFrame() {
        return this.isNewFrame;
    }

    public ALP_BOWL_Game setIsNewFrame(Boolean value) {
        this.isNewFrame = value;

        if (value) {
            this.incrementFrameCount();
        }

        return this;
    }

    // isNewFrame --------------------------------------------------------------

    private Integer frameCount = 0;

    public Integer getFrameCount() {
        return this.frameCount;
    }

    private ALP_BOWL_Game incrementFrameCount() {
        this.frameCount++;
        return this;
    }

    // isNewFrame --------------------------------------------------------------

    private Integer bonusRollCount = 0;

    public Integer getBonusRollCount() {
        return this.bonusRollCount;
    }

    public ALP_BOWL_Game incrementBonusRollCount() {
        this.bonusRollCount++;
        return this;
    }

    // isNewFrame --------------------------------------------------------------

    public Integer score() {
        // TODO
        return 0;
    }
}