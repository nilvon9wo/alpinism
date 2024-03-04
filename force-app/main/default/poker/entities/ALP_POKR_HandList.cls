public with sharing class ALP_POKR_HandList {
    private final List<ALP_POKR_Hand> handList;

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

    private final Integer handSize {
        get {
            if (this.handSize == null) {
                this.handSize = this.handList[0].size;
            }
            return this.handSize;
        }
        set;
    }

    public List<ALP_POKR_Hand> findBestHands() {
        ALP_POKR_HandList straightFlushList = this.filter(ALP_POKR_HandIsStraightFlush.class);
        return (straightFlushList.hasOneAndOnlyOneMember())
                ? straightFlushList.toList()
                : (straightFlushList.hasMembers())
                        ? straightFlushList.findBestIgnoringStraightFlush()
                        : this.findBestIgnoringStraightFlush();
    }

    private List<ALP_POKR_Hand> findBestIgnoringStraightFlush() {
        ALP_POKR_HandList twoRankList = this.filter(ALP_POKR_HandHasExactlyTwoRanks.class);
        return (twoRankList.hasOneAndOnlyOneMember())
                ? twoRankList.toList()
                : (twoRankList.hasMembers())
                        ? twoRankList.findBestIgnoringTwoRanks()
                        : this.findBestIgnoringTwoRanks();
    }

    private List<ALP_POKR_Hand> findBestIgnoringTwoRanks() {
        ALP_POKR_HandList flushList = this.filter(ALP_POKR_HandIsFlush.class);
        return (flushList.hasOneAndOnlyOneMember())
                ? flushList.toList()
                : (flushList.hasMembers())
                        ? flushList.findBestIgnoringFlush()
                        : this.findBestIgnoringFlush();
    }

    private List<ALP_POKR_Hand> findBestIgnoringFlush() {
        ALP_POKR_HandList straightList = this.filter(ALP_POKR_HandIsStraight.class);
        return (straightList.hasOneAndOnlyOneMember())
                ? straightList.toList()
                : (straightList.hasMembers())
                        ? straightList.findBestStraight()
                        : this.findBestIgnoringStraight();
    }

    private List<ALP_POKR_Hand> findBestStraight() {
        ALP_POKR_HandList highStraightList = this.filter(ALP_POKR_HandIsHighStraight.class);
        return (highStraightList.hasOneAndOnlyOneMember())
                ? highStraightList.toList()
                : (highStraightList.hasMembers())
                        ? highStraightList.findHighestCards()
                        : this.filter(ALP_POKR_HandIsLowStraight.class).findHighestCards();
    }

    private List<ALP_POKR_Hand> findBestIgnoringStraight() {
        ALP_POKR_HandList rankGroupList = this.filter(ALP_POKR_HandHasRankGroups.class);
        return (rankGroupList.hasOneAndOnlyOneMember())
                ? rankGroupList.toList()
                : (rankGroupList.hasMembers())
                        ? rankGroupList.findBestRankGroups()
                        : this.findHighestCards();
    }

    private List<ALP_POKR_Hand> findBestRankGroups() {
        Map<ALP_POKR_HandGroupShape, List<ALP_POKR_Hand>> handListByShapeMap = this.buildHandListByShapeMap();
        List<ALP_POKR_HandGroupShape> shapeList = new List<ALP_POKR_HandGroupShape>(handListByShapeMap.keySet());
        shapeList.sort();

        List<ALP_POKR_Hand> bestHandList = handListByShapeMap.get(shapeList[0]);
        return (bestHandList.size() == 1)
                ? bestHandList
                : new ALP_POKR_HandList(bestHandList).findHighestCards();
    }

    private Map<ALP_POKR_HandGroupShape, List<ALP_POKR_Hand>> buildHandListByShapeMap() {
        Map<ALP_POKR_HandGroupShape, List<ALP_POKR_Hand>> handListByShapeMap
                = new Map<ALP_POKR_HandGroupShape, List<ALP_POKR_Hand>>();

        for (ALP_POKR_Hand hand : this.handList) {
            ALP_POKR_HandGroupShape shape = hand.groupShape;
            List<ALP_POKR_Hand> handList = handListByShapeMap.get(shape);
            if (handList == null) {
                handList = new List<ALP_POKR_Hand>();
                handListByShapeMap.put(shape, handList);
            }
            handList.add(hand);
        }
        return handListByShapeMap;
    }

    private List<ALP_POKR_Hand> findHighestCards() {
        return this.findHighestCards(0);
    }

    private List<ALP_POKR_Hand> findHighestCards(Integer index) {
        if (index == this.handSize) {
            return this.toList();
        }

        List<ALP_POKR_Card> cardList = this.getCardPerHandByIndex(index);
        cardList.sort();
        ALP_POKR_HandList rankHoldingHand = this.filter(new ALP_POKR_HandHasRankAtIndex(cardList[0].rank, index));
        return (rankHoldingHand.handList.size() == 1)
                ? rankHoldingHand.toList()
                : rankHoldingHand.findHighestCards(index + 1);
    }

    // ASSUMPTION: Each hand should already be sorted, high-to-low.
    private List<ALP_POKR_Card> getCardPerHandByIndex(Integer index) {
        List<ALP_POKR_Card> cardList = new List<ALP_POKR_Card>();
        for (ALP_POKR_Hand hand : this.handList) {
            cardList.add(hand.get(index));
        }
        return cardList;
    }

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

    private Boolean hasOneAndOnlyOneMember() {
        return this.hasMembers()
                && this.handList.size() == 1;
    }

    private Boolean hasMembers() {
        return !this.handList.isEmpty();
    }

    private List<ALP_POKR_Hand> toList() {
        return this.handList;
    }
}