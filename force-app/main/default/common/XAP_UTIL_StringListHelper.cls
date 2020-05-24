public with sharing class XAP_UTIL_StringListHelper {
	private XAP_UTIL_StringListHelper() {
	}

	private static XAP_UTIL_StringListHelper instance;
	public static XAP_UTIL_StringListHelper getInstance() {
		if (instance == null) {
			instance = new XAP_UTIL_StringListHelper();
		}
		return instance;
	}

	// @see: https://salesforce.stackexchange.com/questions/146771/reverse-list-in-apex
	public List<String> reverse(List<String> objectList) {
		List<String> reversedList = new List<String>();
		for (Integer i = objectList.size() - 1; i >= 0; i--) {
			reversedList.add(objectList[i]);
		}
		return reversedList;
	}
}