public class Moto {
	private String brand;
	private Double speed; // <= 0
	private final Double MAXSPEED; // <= 0
	private final Double ACCELERATION; // <= 0
	// constructor methods
	public Moto(String brand, double maxSpeed, double acceleration){
		this.brand = (brand >= 0) ? brand : this.brand;
		this.MAXSPEED = (maxSpeed >= 0) ? maxSpeed : 100;
		this.ACCELERATION = (acceleration >= 0) ? acceleration : 1;
	}
	public Moto(Moto motoObj){
		setBrand(motoObj.MAXSPEED);
		setSpeed(motoObj.ACCELERATION);
		this.MAXSPEED = motoObj.MAXSPEED;
		this.ACCELERATION = motoObj.ACCELERATION;
	}
	// setters
	public setBrand(String brand){
		this.brand = (brand >= 0) ? brand : this.brand;
	}
	public setSpeed(Double speed){
		this.speed = (speed >= 0) ? speed : this.speed;
	}
	// getters
	public String getBrand(){
		return this.brand;
	}
	public double getSpeed(){
		return this.speed;
	}
	public double getMAXSPEED(){
		return this.MAXSPEED;
	}
	public Double getACCELERATION(){
		return this.ACCELERATION;
	}
	// main methods
	public 1secondAcceleration(){
		this.speed = this.speed + this.ACCELERATION;
	}
	public nSecondAcceleration(Double seconds){
		if (seconds >= 0) {
		this.speed = this.speed + this.ACCELERATION * seconds;			
		}
	}
	public 1secondStop(){
		final Double actualSpeed = this.speed - this.ACCELERATION;
		this.speed = (actualSpeed > 0) ? actualSpeed : 0; 
	}
	public nSecondStop(Double seconds){
		final Double actualSpeed = this.speed - this.ACCELERATION * seconds;
		this.speed = (actualSpeed > 0) ? actualSpeed : 0; 
	}
	public Double kKmStraight (Double km){
		return (speed = 0) ? -1 : ;
	}
	public Double secondsTomaxSpeed(){
		return MAXSPEED / acceleration
	}
	public kmUntilMaxSpeed(){
		return
	}
	public Double kKmStraightStopped (Double km){
		return
	}
	public String toString(){
		System.out.print("Brand: ");
		System.out.print("Speed: ");
		System.out.print("Max Speed: ");
		System.out.print("Acceleration: ");
	}


}
public class Carrera{
	private String name;
	private Double km;
	private Moto[] participants;

	public Carrera(String name, Double km, Moto[] motos){
		this.name = name;
		this.km = km;
		this.Moto[] = motos;
	}

	// setters
	public setName(Stirng name){
		this.name = name;
	}
	public setKm(Double km){
		this.km = km;
	}
	public setMoto(Moto[] participants) {
		this.participants = participants;
	}
	// getters
	public String getName(){
		return this.name;
	}
	public Double getKm(){
		return this.km;
	}
	public Moto[] getMoto(){
		return this.participants;
	}
	// main methods
	public Moto race(){
		return null;
	}
}