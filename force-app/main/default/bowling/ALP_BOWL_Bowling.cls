public with sharing class ALP_BOWL_Bowling {
    private static final Integer MAXIMUM_PINS = 10;
    private static final Integer MAXIMUM_FRAMES = 10;

    private List<Integer> pinsKnockedDownList = new List<Integer>();
    private List<Integer> bonusPinsKnockedDownList = new List<Integer>();
    private Integer completedFrameCount = 0;
    private Integer untakenBonusRounds = 0;
    private Boolean isNewFrame = true;
    private Boolean hasBonusStarted = false;

    //    Records the number of pins knocked down on a single roll. Returns `any`
    //    unless there is something wrong with the given number of pins, in which
    //    case it returns a helpful message.
    public ALP_BOWL_Bowling roll(Integer pinsKnockedDown) {
        this.validateRoll(pinsKnockedDown);

        ((this.untakenBonusRounds == 0)
                ? this.pinsKnockedDownList
                : this.bonusPinsKnockedDownList
        ).add(pinsKnockedDown);

        return this.updateContext(pinsKnockedDown)
                .addBonusRounds();
    }

    private ALP_BOWL_Bowling validateRoll(Integer pinsKnockedDown) {
        if (pinsKnockedDown < 0) {
            throw new ALP_BOWL_RollException('Negative roll is invalid');
        }
        if (this.getTotalDownPins(pinsKnockedDown) > MAXIMUM_PINS) {
            throw new ALP_BOWL_RollException('Pin count exceeds pins on the lane');
        }
        if (
                this.isLastFrame()
                        && this.untakenBonusRounds == 0
                ) {
            throw new ALP_BOWL_RollException('Cannot roll after game is over');
        }
        return this;
    }

    private ALP_BOWL_Bowling updateContext(Integer pinsKnockedDown) {
        this.isNewFrame = this.isStrike(pinsKnockedDown)
                || !this.isNewFrame;

        if (this.isNewFrame && !this.hasBonusStarted) {
            this.completedFrameCount++;
        }
        if (this.untakenBonusRounds > 0) {
            this.untakenBonusRounds--;
        }
        return this;
    }


    private Integer getTotalDownPins(Integer pinsKnockedDown) {
        return pinsKnockedDown + (
                (this.isNewFrame)
                        ? 0
                        : this.getLastRoll()
        );
    }

    private ALP_BOWL_Bowling addBonusRounds() {
        if (!this.hasBonusStarted && this.isLastFrame()) {
            Integer lastRoll = this.getLastRoll();
            if (this.isStrike(lastRoll)) {
                this.untakenBonusRounds = 2;
            }
            else if (this.isSpare(lastRoll, this.getPenultimateRoll())){
                this.untakenBonusRounds = 1;
            }
            this.hasBonusStarted = this.untakenBonusRounds != 0;
        }
        return this;
    }

    private Boolean isStrike(Integer pinsKnockedDown) {
        return pinsKnockedDown == MAXIMUM_PINS;
    }

    private Boolean isSpare(Integer newPinsKnockedDown, Integer oldPinsKnockedDown) {
        return newPinsKnockedDown + oldPinsKnockedDown == MAXIMUM_PINS;
    }

    private Integer getLastRoll() {
        return this.getRoll(-1);
    }

    private Integer getPenultimateRoll() {
        return this.getRoll(-2);
    }

    private Integer getRoll(Integer negativeIndex) {
        List<Integer> fullRollList = this.pinsKnockedDownList.clone();
        fullRollList.addAll(this.bonusPinsKnockedDownList);
        return fullRollList[fullRollList.size() + negativeIndex];
    }

    private Boolean isLastFrame() {
        return this.completedFrameCount == MAXIMUM_FRAMES;
    }

    //    Returns the running_total of a given game of bowling if the game is complete.
    //    If the game isn't complete, it returns a helpful message.
    public Integer score() {
        return 0;
    }

    /*


  @doc """
  """

  @spec score(any) :: integer | String.t()
  def score(%Bowling{frame_count: frame_count})
      when frame_count < 10,
      do: {:error, "Score cannot be taken until the end of the game"}

  def score(%Bowling{
        bonus_type: :strike,
        bonus_roll_count: bonus_roll_count
      })
      when bonus_roll_count != 2,
      do: {:error, "Score cannot be taken until the end of the game"}

  def score(%Bowling{
        rolls: [last_roll | [penultimate_roll | [10 | _]]] = rolls,
        bonus_type: :strike,
        bonus_roll_count: 2
      }),
      do: score(%Bowling{rolls: rolls, bonus_type: :none}) - last_roll - penultimate_roll

  def score(%Bowling{
        bonus_type: :spare,
        bonus_roll_count: bonus_roll_count
      })
      when bonus_roll_count != 1,
      do: {:error, "Score cannot be taken until the end of the game"}

  def score(%Bowling{rolls: [last_roll | _] = rolls, bonus_type: :spare, bonus_roll_count: 1}),
    do: score(%Bowling{rolls: rolls, bonus_type: :none}) - last_roll

  def score(%Bowling{rolls: rolls, bonus_type: :none}),
    do: score(Enum.reverse(rolls), _accumulator = 0)

  defp score([] = _rolls, accumulator),
    do: accumulator

  defp score([10 = head_roll | [next_throw_1 | [next_throw_2 | _]] = tail_rolls], accumulator),
    do: score(tail_rolls, accumulator + head_roll + next_throw_1 + next_throw_2)

  defp score([head_roll | [next_throw_1 | [next_throw_2 | _] = tail_rolls]], accumulator)
       when head_roll + next_throw_1 == 10,
       do: score(tail_rolls, accumulator + head_roll + next_throw_1 + next_throw_2)

  defp score([head_roll | [next_throw_1 | tail_rolls]], accumulator),
    do: score(tail_rolls, accumulator + head_roll + next_throw_1)

  defp score([head_roll | tail_rolls], accumulator),
    do: score(tail_rolls, accumulator + head_roll)
end

     */
}