public with sharing class ALP_POKR_HandList {
    private List<ALP_POKR_Hand> handList;

    private ALP_POKR_HandList(List<ALP_POKR_Hand> handList) {
        this.handList = handList;
    }

    public static ALP_POKR_HandList fromHandCodes(List<String> handCodeList) {
        List<ALP_POKR_Hand> handList = new List<ALP_POKR_Hand>();
        for (String handCode : handCodeList) {
            handList.add(new ALP_POKR_Hand(handCode));
        }
        return new ALP_POKR_HandList(handList);
    }

    private static final Map<Type, ALP_POKR_HandPredicateIntf> PREDICATE_BY_TYPE_MAP
            = new Map<Type, ALP_POKR_HandPredicateIntf>();

    public List<ALP_POKR_Hand> findBestHands() {
        ALP_POKR_HandList straightFlushList = this.filter(ALP_POKR_HandIsStraightFlush.class);
        return (straightFlushList.hasMembers())
                ? this.findBestIgnoringStraightFlush(straightFlushList)
                : this.findBestIgnoringStraightFlush(this);
    }

    private List<ALP_POKR_Hand> findBestIgnoringStraightFlush(ALP_POKR_HandList handList) {
        ALP_POKR_HandList twoRankList = handList.filter(ALP_POKR_HandHasExactlyTwoRanks.class);
        return (twoRankList.hasMembers())
                ? this.findBestIgnoringTwoRanks(twoRankList)
                : this.findBestIgnoringTwoRanks(this);
    }

    private List<ALP_POKR_Hand> findBestIgnoringTwoRanks(ALP_POKR_HandList handList) {
        ALP_POKR_HandList flushList = handList.filter(ALP_POKR_HandIsFlush.class);
        return (flushList.hasMembers())
                ? this.findBestIgnoringFlush(flushList)
                : this.findBestIgnoringFlush(this);
    }

    private List<ALP_POKR_Hand> findBestIgnoringFlush(ALP_POKR_HandList handList) {
        ALP_POKR_HandList straightList = handList.filter(ALP_POKR_HandIsStraight.class);
        return (straightList.hasMembers())
                ? this.findBestStraight(straightList)
                : this.findBestIgnoringStraight(this);
    }

    private List<ALP_POKR_Hand> findBestStraight(ALP_POKR_HandList handList) {

        // TODO
        return null;
    }

    private List<ALP_POKR_Hand> findBestIgnoringStraight(ALP_POKR_HandList handList) {
        ALP_POKR_HandList rankGroupList = handList.filter(ALP_POKR_HandHasRankGroups.class);
        return (rankGroupList.hasMembers())
                ? this.findBestRankGroups(rankGroupList)
                : this.findHighestCards(this);

    }

    private List<ALP_POKR_Hand> findBestRankGroups(ALP_POKR_HandList handList) {
        // TODO
        return null;
    }

    private List<ALP_POKR_Hand> findHighestCards(ALP_POKR_HandList handList) {
        // TODO
        return null;
    }

    /*
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
    private ALP_POKR_HandList filter(Type predicateType) {
        ALP_POKR_HandPredicateIntf predicate = PREDICATE_BY_TYPE_MAP.get(predicateType);
        if (predicate == null) {
            predicate = (ALP_POKR_HandPredicateIntf) predicateType.newInstance();
            PREDICATE_BY_TYPE_MAP.put(predicateType, predicate);
        }
        return this.filter(predicate);
    }

    private ALP_POKR_HandList filter(ALP_POKR_HandPredicateIntf predicate) {
        List<ALP_POKR_Hand> filteredHandList = new List<ALP_POKR_Hand>();
        for (ALP_POKR_Hand hand : this.handList) {
            if (predicate.isTrueFor(hand)) {
                filteredHandList.add(hand);
            }
        }
        return new ALP_POKR_HandList(filteredHandList);
    }

    private Boolean hasMembers() {
        return !this.handList.isEmpty();
    }
}