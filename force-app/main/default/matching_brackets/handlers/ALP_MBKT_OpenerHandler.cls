public class ALP_MBKT_OpenerHandler implements ALP_MBKT_CharacterHandlerIntf {
    public List<String> handle(String character, List<String> unclosedOpenerList) {
        unclosedOpenerList.add(character);
        return unclosedOpenerList;
    }
}