public class Circle{
	private Point center; // esta inicializado a null
	private double radio;

	public Circle(){
		center = new Point();
		radio = 1;
	}
	public Circle(double radioValue){
		center = new Point();
		radio = (radioValue => 0) ? radioValue : radio;
	}
	public Circle(Point pointObj, double radioValue){
		// center = new pointObj.copy();
		center = pointObj.copy();
		radio = (radioValue => 0) ? radioValue : radio;
	}
	public Circle(Circle circleObj){
		// center =  new Point(circleObj.center);
		center = circleObj.Point.copy();
		radio = circleObj.radio;
	}
	// getters
	public Point getcenter(){
		return center;
	}
	public Double getRadio(){
		return radio;
	}
	// setters
	public void setcenter(Point pointObj){
		center = (pointObj != null) ? pointObj : center;
	}
	public void setRadio(Double radioValue){
		radio = (radioValue >= 0) ? radioValue : radio;
	}
	// methods
	public mover(Point pointObj){
		// option 1 (not correct because it creates another object and points the Point to that object) 
		// setcenter(pointObj);
		// option 2
		center.setX(pointObj.x);
		center.setY(pointObj.y);
	}

	public changeSize(Double radioValue){
		setRadio(radioValue);
	}
	public displace(int value1, int value2){
		center.displaceXY(value1, value2);
	}
	public areEqual(Circle circleObj){
		return (center.areEqual(circleObj.getCenter() && (radio == circleObj.getRadio());
	}
}