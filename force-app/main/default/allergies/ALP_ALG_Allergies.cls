public with sharing class ALP_ALG_Allergies {
    ALP_ALG_AllergenHelper allergenHelper;
    Integer highestAssignedPowerOf2;

        private ALP_ALG_Allergies(ALP_ALG_AllergenHelper allergenHelper) {
        this.allergenHelper = allergenHelper;
        this.highestAssignedPowerOf2 = allergenHelper.getHighestAssignedCode();
    }

    private ALP_ALG_Allergies() {
        this(ALP_ALG_AllergenHelper.getInstance());
    }

    private static ALP_ALG_Allergies instance;
    public static ALP_ALG_Allergies getInstance() {
        if (instance == null) {
            instance = new ALP_ALG_Allergies();
        }
        return instance;
    }

    public List<ALP_ALG_Allergen> toList(Integer inputCode) {
        List<ALP_ALG_Allergen> allergenList = new List<ALP_ALG_Allergen>();

        Integer powerOfTwo = this.highestAssignedPowerOf2;
        Integer code = this.ignoreUnassignedValues(inputCode);
        while (powerOfTwo > 0) {
            ALP_ALG_Allergen allergen = this.allergenHelper.get(code);
            if (allergen != null) {
                allergenList.add(allergen);
                code = code - powerOfTwo;
            }
            powerOfTwo /= 2;
        }
        return allergenList;
    }

    private Integer ignoreUnassignedValues(Integer code) {
        while (code > this.allergenHelper.getCodeTotal()) {
            code = code - this.findHighestSmallEnoughPowerOf2(code);
        }
        return code;
    }

    private Integer findHighestSmallEnoughPowerOf2(Integer code) {
        Integer powerOfTwo = this.highestAssignedPowerOf2;
        while (powerOfTwo <= code) {
            powerOfTwo *= 2;
        }
        return powerOfTwo /= 2;
    }

    public Boolean isAllergicTo(Integer code, String allergen) {
        return this.isAllergicTo(code, this.allergenHelper.fromNameToEnum(allergen));
    }

    private Boolean isAllergicTo(Integer code, ALP_ALG_Allergen allergen) {
        return this.toList(code)
                .contains(allergen);
    }

}