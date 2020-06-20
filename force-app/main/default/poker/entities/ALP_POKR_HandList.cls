public with sharing class ALP_POKR_HandList {
    List<String> handCodeList;

    public ALP_POKR_HandList(List<String> handCodeList) {
        this.handCodeList = handCodeList;
    }

    public List<ALP_POKR_Hand> findBestHands() {
        return null;
    }
    /*


defmodule Hands do
  def find_best_hands(hands) do
    hands_with_straight_flush = Enum.filter(hands, &(&1.has_straight && &1.has_flush))

    if !Enum.empty?(hands_with_straight_flush),
      do: find_best_ignoring_straight_flush(hands_with_straight_flush),
      else: find_best_ignoring_straight_flush(hands)
  end

  defp find_best_ignoring_straight_flush(hands) do
    hands_with_full_house_or_better = Enum.filter(hands, & &1.has_full_house_or_better)

    if !Enum.empty?(hands_with_full_house_or_better) do
      find_best_ignoring_flush(hands_with_full_house_or_better)
    else
      hands_with_flush = Enum.filter(hands, & &1.has_flush)

      if !Enum.empty?(hands_with_flush),
        do: find_best_ignoring_flush(hands_with_flush),
        else: find_best_ignoring_flush(hands)
    end
  end

  defp find_best_ignoring_flush(hands) do
    hands_with_straight = Enum.filter(hands, & &1.has_straight)

    if !Enum.empty?(hands_with_straight) do
      find_best_straight(hands_with_straight)
    else
      hands_with_groupings = Enum.filter(hands, &Hand.has_rank_groups/1)

      if Enum.empty?(hands_with_groupings),
        do: find_highest_cards(hands),
        else: find_best_group(hands_with_groupings)
    end
  end

  defp find_best_straight(hands) do
    {low_scoring_straights, high_scoring_straights} =
      Enum.split_with(hands, &Hand.is_low_scoring_straight/1)

    if Enum.empty?(high_scoring_straights),
      do: find_highest_cards(low_scoring_straights),
      else: find_highest_cards(high_scoring_straights)
  end

  defp find_highest_cards(hands) do
    highest_card =
      hands
      |> Enum.map(& &1.cards)
      |> Enum.map(&hd/1)
      |> Enum.max(&Hand.is_higher_first/2)

    hands_with_highest_card = Enum.filter(hands, &Hand.member?(&1, highest_card.rank))

    if length(hands_with_highest_card) == 1 || length(hd(hands_with_highest_card).cards) == 1,
      do: hands_with_highest_card,
      else:
        hands_with_highest_card
        |> Enum.map(&Hand.drop_first_card/1)
        |> find_highest_cards()
  end

  defp find_best_group(hands) do
    find_best_by_rank(hands)
  end

  defp find_best_by_rank(hands) do
    best_hands =
      {_largest_group_shape, hands_with_max_number_of_groupings} =
      hands
      |> Enum.group_by(&HandGroupingShape.shape_of_rank_groupings(&1))
      |> Enum.max(&HandGroupingShape.has_best_group_shaping/2)

    if length(hands_with_max_number_of_groupings) == 1,
      do: hands_with_max_number_of_groupings,
      else: find_best_rank_groups(best_hands)
  end

  defp find_best_rank_groups({_largest_group_shape, hands_with_max_number_of_groupings}) do
    best_hands =
      {_rank, hands_with_highest_ranked_group} =
      hands_with_max_number_of_groupings
      |> Enum.group_by(&Hand.highest_group_rank/1)
      |> Map.to_list()
      |> Enum.max(&find_higher_rank_group/2)

    if length(hands_with_highest_ranked_group) == 1,
      do: hands_with_highest_ranked_group,
      else: compare_remaining_cards_by_rank(best_hands)
  end

  defp compare_remaining_cards_by_rank({rank, hands_with_highest_ranked_group}) do
    hands_without_best_group =
      Enum.map(hands_with_highest_ranked_group, &Hand.drop_rank_group(&1, rank))

    remaining_group_count =
      hands_without_best_group
      |> hd()
      |> Map.fetch!(:rank_grouping)
      |> Map.values()
      |> length()

    if remaining_group_count > 0,
      do: find_best_by_rank(hands_without_best_group),
      else: find_highest_cards(hands_without_best_group)
  end

  defp find_higher_rank_group({rank_1, _}, {rank_2, _}),
    do: Ranks.is_higher_first(rank_1, rank_2)
end


 */
}