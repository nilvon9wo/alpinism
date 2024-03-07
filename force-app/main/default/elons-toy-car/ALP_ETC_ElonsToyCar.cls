public with sharing class ALP_ETC_ElonsToyCar {
    private Integer distance = 0;
    private static final Integer DRIVE_INCREMENT = 20;
    private Integer battery = 100;
    private static final Integer BATTERY_DECREMENT = 1;

    public static ALP_ETC_ElonsToyCar buy() {
        return new ALP_ETC_ElonsToyCar();
    }

    public String distanceDisplay() {
        return 'Driven ' + distance + ' meters';
    }

    public String batteryDisplay() {
        return hasBatteryEnergy()
        ? 'Battery at ' + battery + '%'
        : 'Battery empty';
    }

    public void drive() {
        if (hasBatteryEnergy()) {
            distance += DRIVE_INCREMENT;
            battery -= BATTERY_DECREMENT;
        }
    }

    private Boolean hasBatteryEnergy() {
        return battery > 0;
    }
}