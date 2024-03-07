public with sharing class ALP_CONX_ColourHelper {
    final XAP_ENUM_EnumConverter converter;
    private ALP_CONX_ColourHelper(XAP_ENUM_EnumConverter converter) {
        this.converter = converter;
        this.converter.put(ALP_CONX_Colour.class, new XAP_ENUM_EnumWrapper(ALP_CONX_Colour.values()));
    }

    private ALP_CONX_ColourHelper() {
        this(XAP_ENUM_EnumConverter.getInstance());
    }

    private static ALP_CONX_ColourHelper instance;
    public static ALP_CONX_ColourHelper getInstance() {
        if (instance == null) {
            instance = new ALP_CONX_ColourHelper();
        }
        return instance;
    }

    private static final Map<String, ALP_CONX_Colour> COLOUR_BY_OCCUPANT_MARKER_MAP = new Map<String, ALP_CONX_Colour>{
            'X' => ALP_CONX_Colour.BLACK,
            'O' => ALP_CONX_Colour.WHITE,
            '.' => ALP_CONX_Colour.NONE
    };

    public ALP_CONX_Colour fromNameToEnum(String colourString) {
        return (ALP_CONX_Colour) this.converter.getEnumeration(ALP_CONX_Colour.class, colourString);
    }

    public ALP_CONX_Colour fromMarkerToEnum(String marker) {
        return COLOUR_BY_OCCUPANT_MARKER_MAP.get(marker);
    }

    public String fromEnumToName(ALP_CONX_Colour colour) {
        return String.valueOf(colour);
    }
}