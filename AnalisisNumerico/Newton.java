package AnalisisNumerico;
import java.util.Scanner;
public class Newton {
	private static long x0, x1, tol, tole, fx, dfx, Er;
	private static int niter;
	public static void main(String[] args) {
		M_Newton();
	}
	public static void M_Newton() {
		try(Scanner a = new Scanner(System.in)){
			System.out.print("Ingrese el valor inicial: ");
			x0 = a.nextLong();
			System.out.print("Ingrese la tolerancia(Solo el exponente positivo): ");
			tole = a.nextLong();
			tol = (long)(Math.pow(10, -tole));
			System.out.print("Ingrese el n�mero de iteracciones: ");
			niter = a.nextInt();
			while(tole<1 || niter<1) {
				if(tole<1) {
					System.out.println("Tolerancia Incorrecta ");
					System.out.print("Ingrese la tolerancia(Solo el exponente positivo): ");
					tole = a.nextLong();
					tol = (long)(Math.pow(10, -tole));
					}else {
						System.out.println("N�mero de iteracciones incorrecto ");
						System.out.print("Ingrese el n�mero de iteracciones: ");
						niter = a.nextInt();
						}
			}
			//fx = f(x0) "�C�mo lo evaluamos?"
			//dfx = df(x0) "�C�mo lo evaluamos?"
			int count = 0;
			Er = tol +1;
			while(fx!=0 && dfx!=0 && Er>tol && count<niter) {
				x1 = x0 - (fx/dfx);
				//fx = f(x1) "�C�mo lo evaluamos?"
				//dfx = f(x1) "�C�mo lo evaluamos?"
				Er = Math.abs((x1-x0)/x1);
				x0 = x1;
				count = count +1;
			}
			if(fx == 0) {
				System.out.println("Hay una ra�z en: "+x0);
			}else if(dfx == 0) {
				System.out.println("Hay una ra�z multiple en: "+x1);
				}else if(Er<tol){
					System.out.println("Hay una ra�z en: "+x1+ " con una Tolerancia"+tol);
					}else {
						System.out.println("Las iteraciones han llegado a su fin. ");
					}
		}
	}
}
