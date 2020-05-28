public class XAP_ENUM_EnumWrapper {
	private Map<String, Object> enumValuesByStringMap = new Map<String, Object>();
	public XAP_ENUM_EnumWrapper(List<Object> enumValues) {
		for (Object enumValue : enumValues) {
			this.enumValuesByStringMap.put(String.valueOf(enumValue).toUpperCase(), enumValue);
		}
	}

	public Object getEnumValue(String enumeration) {
		return String.isBlank(enumeration)
				? null
				: this.enumValuesByStringMap.get(enumeration.toUpperCase());
	}
}