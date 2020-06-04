public with sharing class XAP_INT_IntegerList {
    private List<Integer> integerList;

    public XAP_INT_IntegerList(List<Integer> integerList) {
        this.integerList = integerList;
    }

    public XAP_INT_IntegerList() {
        this(new List<Integer>());
    }

    public XAP_INT_IntegerList add(Integer value) {
        this.integerList.add(value);
        return this;
    }

    public XAP_INT_IntegerList add(XAP_INT_IntegerList that) {
        this.integerList.addAll(that.integerList);
        return this;
    }

    public Integer max(){
        Integer initialValue = 0;
        return this.evaluate(XAP_INT_MaximumCalculator.getInstance(), initialValue);
    }

    public Integer product() {
        Integer initialValue = 1;
        return this.evaluate(XAP_INT_ProductCalculator.getInstance(), initialValue);
    }

    private Integer evaluate(XAP_INT_IntegerToIntegerInterpIntf function, Integer initialValue) {
        if (this.integerList.isEmpty()) {
            return null;
        }

        Integer result = initialValue;
        for (Integer value : this.integerList) {
            result = function.interpret(value, result);
        }
        return result;
    }
}