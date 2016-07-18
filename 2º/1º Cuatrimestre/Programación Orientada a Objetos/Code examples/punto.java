public class Punto{
	private int x;
	private int y;

	// constructors
	public Punto(){
		
	}
	public Punto(int valorX){
		x = (valueX >= 0) ? valueX : 0;
	}
	public Punto(int valorX, int valorY){
		x = (valueX >= 0) ? valueX : 0;
		y = (valueY >= 0) ? valueY : 0;
	}
	public Punto(Punto objPunto){
		x = objPunto.x;
		y = objPunto.y;
	}
	// setters
	public void setX(int valueX){
		x = (valueX >= 0) ? valueX : x;
	}
	public void setY(int valueY){
		y = (valueY >= 0) ? valueY : y;
	}
	// getters
	public int getX(){
		return x;
	}
	public int getY(){
		return y;
	}
	// methods
	public void desplazarXY(int value1, int value2){
		setX(x + value1);
		setY(y + value2);
	}
	public void desplazarX(int value){
		setX(x + value);
	}
	public void desplazarY(int value){
		setY(y + value);
	}
	public string toString(){
		return '';
	}
	public boolean sonIguales(Punto objPunto){
		return ((x == objPunto.x) && (y == objPunto.y));
	}
	public Punto copia(){
		return new Punto(x, y);
	}
}