package AnalisisNumerico;
import java.util.Scanner;
public class Secante {
	private static long x0, x1, x2, tol, tole, fx0, fx1, den, Er;
	private static int niter;
	public static void main(String[] args) {
		M_secante();
	}
	private static void M_secante() {
		try(Scanner a = new Scanner(System.in)){
			System.out.print("Ingrese el primer valor: ");
			x0 = a.nextLong();
			System.out.print("Ingrese el segundo valor: ");
			x1 = a.nextLong();
			System.out.print("Ingrese la tolerancia(Solo el exponente, positivo): ");
			tole = a.nextLong();
			tol = (long)Math.pow(10, -tole);
			System.out.print("Ingrese el número de iteracciones: ");
			niter = a.nextInt();
			while(x0==x1 || tole<1 || niter<1) {
				if(x0==x1) {
					System.out.println("El primer y segundo valor son iguales");
					System.out.print("Ingrese el primer valor: ");
					x0 = a.nextLong();
					System.out.print("Ingrese el segundo valor: ");
					x1 = a.nextLong();
				}else if(tole<1) {
					System.out.println("Tolerancia Incorrecta");
					System.out.print("Ingrese la tolerancia(Solo el exponente, positivo): ");
					tole = a.nextLong();
					tol = (long)Math.pow(10, -tole);
				}else {
					System.out.println("Número de Iteracciones Incorrecta");
					System.out.print("Ingrese el número de iteracciones: ");
					niter = a.nextInt();
				}
			}
			//fx0 = f(x0) "¿Cómo lo evaluamos?"
			if(fx0 == 0) {
				System.out.println("Hay una raíz en: "+x0);
			}else {
				//fx1 = f(x1) "¿Cómo lo evaluamos?"
				int count = 0;
				Er = tol +1;
				den = fx1-fx0;
				while(fx1!=0 && den!=0 && Er>tol && count<niter) {
					x2 = x1-(fx1*(x1-x0)/den);
					Er = Math.abs((x2-x1)/x2);
					x0 = x1;
					fx0 = fx1;
					x1 = x2;
					//fx1 = f(x1) "¿Cómo lo evaluamos?"
					den = fx1-fx0;
					count = count + 1;
				}
				if(fx1 == 0) {
					System.out.println("Hay una raíz en: "+x1);
				}else if(den == 0) {
					System.out.println("Puede hayan raices multiples");
				}else if(Er<tol) {
					System.out.println("Hay una raíz en: "+x1+" Con una Tolerancia: "+tol);
				}else {
					System.out.println("Las iteraciones han llegado a su fin. ");
				}
			}
		}
	}
}
