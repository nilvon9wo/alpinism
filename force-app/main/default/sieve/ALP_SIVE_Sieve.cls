public with sharing class ALP_SIVE_Sieve {
    private static final Integer LOWER_LIMIT = 2;
    private static final Boolean COULD_BE_PRIME = true;
    private static final Boolean NOT_PRIME = false;

    public List<Integer> primesTo(Integer upperLimit) {
        return (upperLimit <= LOWER_LIMIT)
                ? new List<Integer>()
                : this.findPrimes(upperLimit);
    }

    private List<Integer> findPrimes(Integer upperLimit) {
        Map<Integer, Boolean> markedMap = this.createMarkedMap(upperLimit);
        Map<Integer, Boolean> markByNumberMap = this.markPrimes(markedMap, LOWER_LIMIT, upperLimit);
        return this.extractPrimes(markByNumberMap);
    }

    private Map<Integer, Boolean> createMarkedMap(Integer upperLimit) {
        Map<Integer, Boolean> markByNumberMap = new Map<Integer, Boolean>();
        for (Integer i = LOWER_LIMIT; i <= upperLimit; i++) {
            markByNumberMap.put(i, COULD_BE_PRIME);
        }
        return markByNumberMap;
    }

    private Map<Integer, Boolean> markPrimes(
            Map<Integer, Boolean> oldMarkByNumberMap,
            Integer currentValue,
            Integer upperLimit
    ) {
        if (currentValue == null) {
            return oldMarkByNumberMap;
        }

        Map<Integer, Boolean> newMarkByNumberMap = this.createDisqualifiedNumberMap(currentValue, upperLimit);
        Map<Integer, Boolean> mergedMarkByNumberMap = oldMarkByNumberMap.clone();
        mergedMarkByNumberMap.putAll(newMarkByNumberMap);

        Integer nextValue = this.findNextPossiblePrime(mergedMarkByNumberMap, currentValue);
        return this.markPrimes(mergedMarkByNumberMap, nextValue, upperLimit);
    }

    private Map<Integer, Boolean> createDisqualifiedNumberMap(Integer currentValue, Integer upperLimit) {
        Map<Integer, Boolean> markByDisqualifiedNumberMap = new Map<Integer, Boolean>();
        for (Integer i = currentValue * 2; i <= upperLimit; i += currentValue) {
            markByDisqualifiedNumberMap.put(i, NOT_PRIME);
        }
        return markByDisqualifiedNumberMap;
    }

    private Integer findNextPossiblePrime(Map<Integer, Boolean> markByNumberMap, Integer currentValue) {
        Integer nextValue = null;
        for (Integer key : markByNumberMap.keySet()) {
            if (
                    key > currentValue
                            && markByNumberMap.get(key)
                            && nextValue == null || key < nextValue
            ) {
                nextValue = key;
            }
        }
        return nextValue;
    }

    private List<Integer> extractPrimes(Map<Integer, Boolean> markByNumberMap) {
        List<Integer> primeList = new List<Integer>();
        for (Integer value : markByNumberMap.keySet()) {
            if (markByNumberMap.get(value)) {
                primeList.add(value);
            }
        }
        primeList.sort();
        return primeList;
    }
}