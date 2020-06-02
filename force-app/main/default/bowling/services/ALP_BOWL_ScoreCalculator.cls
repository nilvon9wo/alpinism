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
        List<Integer> bonusKnockDowns = gameContext.getBonusRolls();
        return 0;
    }

    public ALP_BOWL_ScoreCalculator validateScorable(ALP_BOWL_GameContext gameContext){
        System.debug('######### validateScorable gameContext: ' + gameContext);
        System.debug('######### validateScorable gameContext.hasMoreRolls(): ' + gameContext.hasMoreRolls());
        if (gameContext.hasMoreRolls()) {
            System.debug('######### THROWING!');
            throw new ALP_BOWL_ScoreException('Score cannot be taken until the end of the game');
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