package AnalisisNumerico;
import java.util.Scanner;
public class PuntoFijo {
	private static long xi, tol, tole, xm, fxi, gxi, Er;
	private static int niter;
	public static void main(String[] args) {
		P_fijo();
	}
	public static void P_fijo() {
		try (Scanner a = new Scanner(System.in)) {
			System.out.print("Ingrese el valor inicial: ");
			xi = a.nextLong();
			System.out.print("ingrese la tolerancia (Solo el exponente positivo): ");
			tole = a.nextLong();
			tol = (long) Math.pow(10, -tole);
			System.out.print("ingrese el número de iteracciones: ");
			niter = a.nextInt();	
			while(tole<1 || niter<1) {
				if(tole<0) {
					System.out.println("Tolerancia incorrecta");
					System.out.print("ingrese la tolerancia: ");
					tole = a.nextLong();
					tol = (long) Math.pow(10, -tole);
				}else {
					System.out.println("El número de iteracciones es incorrecto");
					System.out.print("ingrese el número de iteracciones: ");
					niter = a.nextInt();
				}
			}
			//fxi = f(xi) "¿Cómo lo podemos evaluar?"
			int count = 0;
			Er = tol+1;
			while(Er>tol && fxi!=0 && count<niter) {
				//gxi = g(xi) "¿Cómo lo podemos evaluar?"
				xm = gxi;
				//fxi = f(xm) "¿Cómo lo podemos evaluar?"
				Er = Math.abs(xm-xi);
				xi = xm;
				count = count +1;
			}
				if(fxi==0) {
					System.out.println("Hay una raiz en: "+xi);
				}else if(Er<tol) {
					System.out.println("Hay una raiz en: "+xi+" con tolerancia: "+tol);
				}else {
					System.out.println("Las iteraciones han llegado a su fin. ");
				}
		}
	}
}
