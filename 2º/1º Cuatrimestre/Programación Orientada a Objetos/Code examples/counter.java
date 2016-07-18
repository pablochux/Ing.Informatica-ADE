public class Counter {
	private int value;

	public Counter(){
		// initialize value to 0
	}
	public Counter(int newValue){
		value = (newValue >= 0) ? newValue   0;
	}
	// setter
	public void setValue(int newValue){
		value = (newValue >= 0) ? newValue : value;
	}
	// getter
	public int getValue(){
		return value;
	}

	// methods
	public void increment(){
		value++;
	}
	public void decrement(){
		value = (value = 0) ? value : value--;
	}

}