package AnalisisNumerico;
import java.util.Scanner;
public class RaicesMultiples {
	private static long fx, dfx, ddfx, den, xi, xn, tol, Er;
	private static int niter, tole;
	public static void main(String[] args) {
		R_Multiples();
	}
	private static void R_Multiples() {
		try(Scanner a = new Scanner(System.in)){
			System.out.print("Ingrese el valor inicial: ");
			xi = a.nextLong();
			System.out.print("Ingrese la tolerancia(Solo el exponente, positivo): ");
			tole = a.nextInt();
			tol = (long)Math.pow(10, -tole);
			System.out.print("Ingrese el número de iteracciones: ");
			niter = a.nextInt();
			while(tole<1 || niter<1) {
				if(tole<1) {
					System.out.println("Tolerancia Incorrecta");
					System.out.print("Ingrese la tolerancia(Solo el exponente, positivo): ");
					tole = a.nextInt();
				}else {
					System.out.println("El número de iteracciones es Incorrecto");
					System.out.print("Ingrese el número de iteracciones: ");
					niter = a.nextInt();
				}
			}
			//fx = f(xi) "¿Cómo lo evaluamos?"
			//dfx = df(xi) "¿Cómo lo evaluamos?"
			//ddfx = ddf(xi) "¿Cómo lo evaluamos?"
			den = (dfx^2)-fx*ddfx;
			int count = 1;
			Er = tol + 1;
			while(fx!=0 && den!=0 && Er>tol && count<niter) {
				xn = xi - (fx*dfx)/den;
				//fx = f(xn) "¿Cómo lo evaluamos?"
				//dfx = df(xn) "¿Cómo lo evaluamos?"
				//ddfx = ddf(xn) "¿Cómo lo evaluamos?"
				den = (dfx^2)-fx*ddfx;
				Er = Math.abs((xn-xi)/xn);
				xi = xn;
				count = count + 1;
			}
			if(fx==0) {
				System.out.println("Hay una raíz en: "+xi);
			}else if(den == 0) {
				System.out.println("Hay una raíz multiple en: "+xn);
			}else if(Er<tol) {
				System.out.println("Hay una raíz en: "+xi+" con una Tolerancia = "+tol);
			}else {
				System.out.println("Las iteracciones han finalizado. ");
			}
		}
	}
}
