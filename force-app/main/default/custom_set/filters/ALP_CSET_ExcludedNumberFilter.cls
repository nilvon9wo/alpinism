public with sharing class ALP_CSET_ExcludedNumberFilter implements ALP_CSET_CustomSetPredicateIntf {
	ALP_CSET_CustomSet customSet;

	public ALP_CSET_ExcludedNumberFilter(ALP_CSET_CustomSet customSet) {
		this.customSet = customSet;
	}

	public Boolean isTrueFor(Integer value) {
		return !this.customSet.numberSet.contains(value);
	}
}