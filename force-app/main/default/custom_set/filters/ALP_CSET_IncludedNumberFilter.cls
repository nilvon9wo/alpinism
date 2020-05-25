public with sharing class ALP_CSET_IncludedNumberFilter implements ALP_CSET_CustomSetPredicateIntf {
	ALP_CSET_CustomSet customSet;

	public ALP_CSET_IncludedNumberFilter(ALP_CSET_CustomSet customSet) {
		this.customSet = customSet;
	}

	public Boolean isTrueFor(Integer value) {
		return this.customSet.numberSet.contains(value);
	}
}