public with sharing class XAP_INT_ProductCalculator implements XAP_INT_IntegerToIntegerInterpIntf {
    private XAP_INT_ProductCalculator(){
    }

    private static XAP_INT_ProductCalculator instance;
    public static XAP_INT_ProductCalculator getInstance() {
        if (instance == null) {
            instance = new XAP_INT_ProductCalculator();
        }
        return instance;
    }

    public Integer interpret(Integer value1, Integer value2) {
        return value1 * value2;
    }
}