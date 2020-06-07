public with sharing class ALP_ALG_AllergenHelper {
    XAP_ENUM_EnumConverter converter;
    private ALP_ALG_AllergenHelper(XAP_ENUM_EnumConverter converter) {
        this.converter = converter;
        this.converter.put(ALP_ALG_Allergen.class, new XAP_ENUM_EnumWrapper(ALP_ALG_Allergen.values()));
    }

    private ALP_ALG_AllergenHelper() {
        this(XAP_ENUM_EnumConverter.getInstance());
    }

    private static ALP_ALG_AllergenHelper instance;
    public static ALP_ALG_AllergenHelper getInstance() {
        if (instance == null) {
            instance = new ALP_ALG_AllergenHelper();
        }
        return instance;
    }

    private static final Map<Integer, ALP_ALG_Allergen> ALLERGEN_BY_CODE_MAP = new Map<Integer, ALP_ALG_Allergen>{
            1 => ALP_ALG_Allergen.EGGS,
            2 => ALP_ALG_Allergen.PEANUTS,
            4 => ALP_ALG_Allergen.SHELLFISH,
            8 => ALP_ALG_Allergen.STRAWBERRIES,
            16 => ALP_ALG_Allergen.TOMATOES,
            32 => ALP_ALG_Allergen.CHOCOLATE,
            64 => ALP_ALG_Allergen.POLLEN,
            128 => ALP_ALG_Allergen.CATS
    };

    public ALP_ALG_Allergen get(Integer code) {
        return ALLERGEN_BY_CODE_MAP.get(code);
    }

    private static final XAP_INT_IntegerList CODE_LIST = new XAP_INT_IntegerList(ALLERGEN_BY_CODE_MAP.keySet());

    private static final Integer CODE_TOTAL = CODE_LIST.sum();
    public Integer getCodeTotal() {
        return CODE_TOTAL;
    }

    private static final Integer HIGHEST_ASSIGNED_CODE = CODE_LIST.max();
    public Integer getHighestAssignedCode() {
        return HIGHEST_ASSIGNED_CODE;
    }

    public ALP_ALG_Allergen fromNameToEnum(String colourString) {
        return (ALP_ALG_Allergen) this.converter.getEnumeration(ALP_ALG_Allergen.class, colourString);
    }
}