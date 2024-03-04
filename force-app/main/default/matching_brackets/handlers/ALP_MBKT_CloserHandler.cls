public class ALP_MBKT_CloserHandler implements ALP_MBKT_CharacterHandlerIntf {
    private final Map<String, String> closerByOpenerMap;
    public ALP_MBKT_CloserHandler(Map<String, String> closerByOpenerMap) {
        this.closerByOpenerMap = closerByOpenerMap;
    }

    public List<String> handle(String character, List<String> unclosedOpenerList) {
        if (unclosedOpenerList.isEmpty()) {
            throw new ALP_MBKT_UnexpectedCloserException('Found ' + character + ', No closers expected.');
        }

        Integer lastOpenerIndex = unclosedOpenerList.size() - 1;
        String nextExpectedCloser = this.closerByOpenerMap.get(unclosedOpenerList[lastOpenerIndex]);

        if (!character.equals(nextExpectedCloser)) {
            throw new ALP_MBKT_UnexpectedCloserException('Found ' + character + ', Next expected closer: ' + nextExpectedCloser);
        }

        unclosedOpenerList.remove(lastOpenerIndex);
        return unclosedOpenerList;
    }
}