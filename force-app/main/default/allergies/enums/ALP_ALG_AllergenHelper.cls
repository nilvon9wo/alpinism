public with sharing class ALP_ALG_AllergenHelper {
    private static final Map<ALP_ALG_Allergen, Integer> CODE_BY_ALLERGEN_MAP = new Map<ALP_ALG_Allergen, Integer>{
            ALP_ALG_Allergen.EGGS =>  1,
            ALP_ALG_Allergen.PEANUTS =>  2,
            ALP_ALG_Allergen.SHELLFISH =>  4,
            ALP_ALG_Allergen.STRAWBERRIES =>  8,
            ALP_ALG_Allergen.TOMATOES =>  16,
            ALP_ALG_Allergen.CHOCOLATE =>  32,
            ALP_ALG_Allergen.POLLEN =>  64,
            ALP_ALG_Allergen.CATS =>  128
    };

    private static final XAP_INT_IntegerList CODE_LIST = new XAP_INT_IntegerList(CODE_BY_ALLERGEN_MAP.values());
    public static final Integer CODE_TOTAL = CODE_LIST.sum();
    public static final Integer HIGHEST_ASSIGNED_CODE = CODE_LIST.max();
}