public with sharing class ALP_AINF_AnnalynsInfiltration {
    public static Boolean canFastAttack(Boolean isKnightAwake) {
        return !isKnightAwake;
    }

    public static Boolean canSpy(Boolean isKnightAwake, Boolean isArcherAwake, Boolean isPrisonerAwake) {
        return isKnightAwake
                || isArcherAwake
                || isPrisonerAwake;
    }

    public static Boolean canSignalPrisoner(Boolean isArcherAwake, Boolean isPrisonerAwake) {
        return !isArcherAwake
                && isPrisonerAwake;
    }

    public static Boolean canFreePrisoner(Boolean isKnightAwake, Boolean isArcherAwake, Boolean isPrisonerAwake, Boolean isPetDogPresent) {
        return !isArcherAwake
                && (
                isPetDogPresent
                        || (isPrisonerAwake && !isKnightAwake)
        );
    }
}