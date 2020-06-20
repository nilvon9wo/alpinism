public with sharing class ALP_POKR_HandGroupShape {
    private ALP_POKR_Hand hand;

    public ALP_POKR_HandGroupShape(ALP_POKR_Hand hand) {
        this.hand = hand;
    }

    public Integer largestGroupSize {get; private set;}
    public ALP_POKR_Rank highestGroupRank {get; private set;}
    public Integer numberOfGroups {get; private set;}

    /**
* defmodule HandGroupingShape do
  defstruct [:largest_group_size, :largest_group_rank, :number_of_groups]

  def shape_of_rank_groupings(%Hand{rank_grouping: rank_grouping}) do
    rank_grouping_list = Map.to_list(rank_grouping)
    {largest_group_rank, largest_group} = Enum.max(rank_grouping_list, &has_largest_list_size/2)

    %HandGroupingShape{
      largest_group_size: length(largest_group),
      largest_group_rank: largest_group_rank,
      number_of_groups: length(rank_grouping_list)
    }
  end

  defp has_largest_list_size({_, rank_grouping_list_1}, {_, rank_grouping_list_2}),
    do: length(rank_grouping_list_1) > length(rank_grouping_list_2)

  def has_best_group_shaping(
        {%HandGroupingShape{
           largest_group_size: largest_group_size_1,
           largest_group_rank: largest_group_rank_1,
           number_of_groups: number_of_groups_1
         }, _hand_1},
        {%HandGroupingShape{
           largest_group_size: largest_group_size_2,
           largest_group_rank: largest_group_rank_2,
           number_of_groups: number_of_groups_2
         }, _hand_2}
      ),
      do:
        largest_group_size_1 > largest_group_size_2 ||
          (largest_group_size_1 == largest_group_size_2 && number_of_groups_1 > number_of_groups_2) ||
          (largest_group_size_1 == largest_group_size_2 &&
             number_of_groups_1 == number_of_groups_2 &&
             Ranks.is_higher_first(largest_group_rank_1, largest_group_rank_2))
end
*/
}