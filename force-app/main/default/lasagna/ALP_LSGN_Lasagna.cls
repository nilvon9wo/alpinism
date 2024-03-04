public with sharing class ALP_LSGN_Lasagna {
    private final static Integer expectedCookingTime = 40;
    private final static Integer preparationMinutesPerLayer = 2;
    public Integer expectedMinutesInOven() {
        return expectedCookingTime;
    }

    public Integer remainingMinutesInOven(Integer elapsedMinutes) {
        return expectedMinutesInOven() - elapsedMinutes;
    }

    public Integer preparationTimeInMinutes(Integer layerCount) {
        return layerCount * preparationMinutesPerLayer;
    }

    public Integer totalTimeInMinutes(Integer layerCount, Integer elapsedMinutes) {
        return elapsedMinutes + preparationTimeInMinutes(layerCount);
    }
}