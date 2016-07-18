class NumComplejo{
	private double real;
	private double imaginaria;
	// constructores
	public NumComplejo() {
		real = 1;
		imaginaria = 1;
	}
	public NumComplejo(double parteReal) {
		real = parteReal;
		imaginaria = 0;
	}
	public NumComplejo(double parteReal, double parteImaginaria) {
		real = parteReal;
		imaginaria = parteImaginaria;
	}
	public NumComplejo(NumComplejo objComplejo) {
		real = objComplejo.real;
		imaginaria = objComplejo.imaginaria;
	}
	// getters
	public double getReal() {
		return real;
	}
	public double getImaginaria() {
		return imaginaria;
	}
	// setters
	public void setReal(double parteReal) {
		real = parteReal;
	}
	public void setImaginaria(double parteImaginaria) {
		imaginaria = parteImaginaria;
	}
	// operaciones
	public NumComplejo suma(NumComplejo objComplejo2) {
		return new NumComplejo(real + objComplejo2.real, imaginaria + objComplejo2.imaginaria);
	}
	public NumComplejo resta(NumComplejo objComplejo2) {
		return new NumComplejo(real - objComplejo2.real, imaginaria - objComplejo2.imaginaria);
	}
	public NumComplejo mult(NumComplejo objComplejo2) {
		return new NumComplejo(real * objComplejo2.real + imaginaria * objComplejo2.imaginaria, real * objComplejo2.imaginaria - imaginaria * objComplejo2.real);
	}
	public NumComplejo div(NumComplejo objComplejo2) {
		return new NumComplejo((real * objComplejo2.real + imaginaria * objComplejo2.imaginaria, real * objComplejo2.imaginaria - imaginaria * objComplejo2.real) / (math.sqr(objComplejo2.real) + math.sqr(objComplejo2.imaginaria)));
	}
	public String toString() {
		return (real + " + b" + imaginaria);
	}
	public double valorAbsoluto(){
		return math.sqrt(math.sqr(real) + math.sqr(imaginaria));
	}
	public void multEscalar(double escalar) {
		real *= escalar;
		imaginaria *= escalar;
	}
	public NumComplejo conjugado(){
		return new NumComplejo(real, -imaginaria);
	}
	public Bool comparar(NumComplejo objComplejo2){
		return (real = objComplejo2.real) && (imaginaria = objComplejo2.imaginaria);
	}
}