public with sharing class XAP_INT_MaxiumCalculator implements XAP_INT_IntegerToIntegerInterpIntf {
    private Integer accumulator = 0;

    public Integer interpret(Integer currentValue) {
        this.accumulator = (currentValue > this.accumulator)
                ? currentValue
                : this.accumulator;
        return this.accumulator;
    }
}