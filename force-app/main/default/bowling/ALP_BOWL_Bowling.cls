public with sharing class ALP_BOWL_Bowling {
    ALP_BOWL_GameContext gameContext;
    ALP_BOWL_RollHandler rollHandler;

    private ALP_BOWL_Bowling(ALP_BOWL_GameContext gameContext, ALP_BOWL_RollHandler rollHandler) {
        this.gameContext = gameContext;
        this.rollHandler = rollHandler;
    }

    public ALP_BOWL_Bowling() {
        this(new ALP_BOWL_GameContext(), ALP_BOWL_RollHandler.getInstance());
    }

    //    Records the number of pins knocked down on a single roll. Returns `any`
    //    unless there is something wrong with the given number of pins, in which
    //    case it returns a helpful message.
    public ALP_BOWL_Bowling roll(Integer pinsKnockedDown) {
        this.rollHandler.roll(gameContext, pinsKnockedDown);
        return this;
    }

    //    Returns the running_total of a given game of bowling if the game is complete.
    //    If the game isn't complete, it returns a helpful message.
    public Integer score() {
        this.validateScorable();
        return 0;
    }

    public ALP_BOWL_Bowling validateScorable(){
        if (
                !this.gameContext.isLastFrame()
                        || this.gameContext.hasBonusRolls()
                ) {
            new ALP_BOWL_ScoreException('Score cannot be taken until the end of the game');
        }
        return this;
    }

    /*


  @doc """
  """

  @spec score(any) :: integer | String.t()
  def score(%Bowling{frame_count: frame_count})
      when frame_count < 10,
      do: {:error, ""}

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