@IsTest
public class XFTY_DummyDefaultValueExact implements XFTY_DummyDefaultValueIntf {
    private final Object value;

    public XFTY_DummyDefaultValueExact(Object value) {
        this.value = value;
    }

    public Object get() {
        return this.value;
    }
}