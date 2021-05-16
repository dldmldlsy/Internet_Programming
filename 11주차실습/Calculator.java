package myBean;

public class Calculator {
//계산할 거니까 double형으로 하는 게 좋겠다. 

	private double num1; 
	private double num2;
	private char oper;
	
	public Calculator() {
		
	}
	
	public void setNum1(double num1) {
		this.num1=num1;	
	}
	public double getNum1() {
		return num1;
	}

	public void setNum2(double num2) {
		this.num2 = num2;
	}
	public double getNum2() {
		return num2;
	}

	public void setOper(char oper) {
		this.oper=oper;
	}
	public char getOper() {
		return oper;
	}
	
	public double getResult() {
		double result=0.0;
		switch(oper) { 
		case '+' : result=num1+num2;
			    break;
		case '-' : result = num1-num2;
				break;
		case '*' : result=num1*num2;
				break;
		case '/' : result=num1/num2; //0으로 나눌 경우 infinite출력
				break;
		}
		
		return result;
	}
}
//저장함과 동시에 컴파일됨. 
