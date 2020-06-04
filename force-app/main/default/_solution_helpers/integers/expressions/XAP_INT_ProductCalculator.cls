public with sharing class XAP_INT_ProductCalculator implements XAP_INT_IntegerToIntegerInterpIntf {
    private Integer accumulator = 1;

    public Integer interpret(Integer currentValue) {
        this.accumulator *= currentValue;
        return this.accumulator;
    }
}