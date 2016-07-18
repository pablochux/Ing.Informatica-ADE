class Intervalo{
	private double limSup;
	private double limInf;
	public Intervalo(){
		// inicializa a 0 los atributos
	}
	public Intervalo(double value1){
		limSup = (value > 0) ? value : 0;
		limInf = 0;
	}
	public Intervalo(double value1, double value2){
		if (value1 > value2) {
			
		} else {

		}
	}
	public Intervalo(Intervalo objIntervalo){
		limSup = objIntervalo.limSup;
		limInf = objIntervalo.limInf;
	}
}