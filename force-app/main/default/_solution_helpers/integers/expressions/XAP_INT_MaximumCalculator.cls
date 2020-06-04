public with sharing class XAP_INT_MaximumCalculator implements XAP_INT_IntegerToIntegerInterpIntf {
    private XAP_INT_MaximumCalculator(){
    }

    private static XAP_INT_MaximumCalculator instance;
    public static XAP_INT_MaximumCalculator getInstance() {
        if (instance == null) {
            instance = new XAP_INT_MaximumCalculator();
        }
        return instance;
    }

    public Integer interpret(Integer value1, Integer value2) {
        return (value1 > value2)
                ? value1
                : value2;
    }
}