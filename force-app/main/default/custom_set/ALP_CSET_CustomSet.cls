public with sharing class ALP_CSET_CustomSet {
	public Set<Integer> numberSet { get; private set; }

	public ALP_CSET_CustomSet(Set<Integer> numberSet) {
		this.numberSet = numberSet;
	}

	public ALP_CSET_CustomSet(List<Integer> numberList) {
		this(new Set<Integer>(numberList));
	}

	public ALP_CSET_CustomSet() {
		this(new Set<Integer>());
	}

	public ALP_CSET_CustomSet add(Integer i) {
		this.numberSet.add(i);
		return this;
	}

	public ALP_CSET_CustomSet add(Set<Integer> integerSet) {
		this.numberSet.addAll(integerSet);
		return this;
	}

	public Boolean contains(Integer value) {
		return this.numberSet.contains(value);
	}

	public ALP_CSET_CustomSet differenceOf(ALP_CSET_CustomSet that) {
		return this.filter(new ALP_CSET_ExcludedNumberFilter(that));
	}

	public Boolean equals(Object obj) {
		if (obj instanceof ALP_CSET_CustomSet) {
			return this.equals((ALP_CSET_CustomSet) obj);
		}
		return false;
	}

	public Boolean equals(ALP_CSET_CustomSet that) {
		return this.numberSet.equals(that.numberSet);
	}

	public ALP_CSET_CustomSet filter(ALP_CSET_CustomSetPredicateIntf predicate) {
		Set<Integer> filteredSet = new Set<Integer>();
		for (Integer value : this.numberSet) {
			if (predicate.isTrueFor(value)) {
				filteredSet.add(value);
			}
		}
		return new ALP_CSET_CustomSet(filteredSet);
	}

	public Boolean isDisjointedFrom(ALP_CSET_CustomSet that) {
		return this.numberSet.isEmpty()
				|| that.numberSet.isEmpty()
				|| this.intersectionOf(that)
				.isEmpty();
	}

	public Boolean isEmpty() {
		return this.numberSet.isEmpty();
	}

	public ALP_CSET_CustomSet intersectionOf(ALP_CSET_CustomSet that) {
		return this.filter(new ALP_CSET_IncludedNumberFilter(that));
	}

	public Boolean isSubsetOf(ALP_CSET_CustomSet that) {
		return that.numberSet.containsAll(this.numberSet);
	}

	public ALP_CSET_CustomSet unionOf(ALP_CSET_CustomSet that) {
		return new ALP_CSET_CustomSet(this.add(that.numberSet).numberSet);
	}
}