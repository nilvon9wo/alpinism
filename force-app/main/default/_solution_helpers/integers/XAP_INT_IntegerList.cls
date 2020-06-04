public with sharing class XAP_INT_IntegerList {
    private List<Integer> integerList;

    public XAP_INT_IntegerList(List<Integer> integerList) {
        this.integerList = integerList;
    }

    public XAP_INT_IntegerList() {
        this(new List<Integer>());
    }

    public Integer max(){
        return this.evaluate(new XAP_INT_MaxiumCalculator());
    }

    public XAP_INT_IntegerList add(Integer value) {
        this.integerList.add(value);
        return this;
    }

    public Integer product() {
        return this.evaluate(new XAP_INT_ProductCalculator());
    }

    private Integer evaluate(XAP_INT_IntegerToIntegerInterpIntf function) {
        if (this.integerList.isEmpty()) {
            return null;
        }

        Integer result;
        for (Integer value : this.integerList) {
            result = function.interpret(value);
        }
        return result;
    }
}