public with sharing class ALP_BWTCH_BirdWatcher {
    private final Integer[] birdsPerDay;

    public ALP_BWTCH_BirdWatcher(Integer[] birdsPerDay) {
        this.birdsPerDay = birdsPerDay.clone();
    }

    private static final Integer[] lastWeekCounts = new Integer[]{
            0, 2, 5, 3, 7, 8, 4
    };

    public Integer[] getLastWeek() {
        return lastWeekCounts;
    }

    public Integer getToday() {
        return this.birdsPerDay[this.birdsPerDay.size() - 1];
    }

    public void incrementTodaysCount() {
        Integer lastIndex = birdsPerDay.size() - 1;
        birdsPerDay[lastIndex]++;
    }

    public Boolean hasDayWithoutBirds() {
        for (Integer birds : birdsPerDay) {
            if (birds == 0) {
                return true;
            }
        }

        return false;
    }

    public Integer getCountForFirstDays(Integer numberOfDays) {
        Integer sum = 0;
        for (Integer i = 0; i < numberOfDays && i < birdsPerDay.size(); i++) {
            sum += birdsPerDay[i];
        }

        return sum;
    }

    public Integer getBusyDays() {
        Integer count = 0;
        for (Integer birds : birdsPerDay) {
            if (birds >= 5) {
                count++;
            }
        }

        return count;
    }

}