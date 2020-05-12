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
			System.out.print("Ingrese el n�mero de iteracciones: ");
			niter = a.nextInt();
			while(tole<1 || niter<1) {
				if(tole<1) {
					System.out.println("Tolerancia Incorrecta");
					System.out.print("Ingrese la tolerancia(Solo el exponente, positivo): ");
					tole = a.nextInt();
				}else {
					System.out.println("El n�mero de iteracciones es Incorrecto");
					System.out.print("Ingrese el n�mero de iteracciones: ");
					niter = a.nextInt();
				}
			}
			//fx = f(xi) "�C�mo lo evaluamos?"
			//dfx = df(xi) "�C�mo lo evaluamos?"
			//ddfx = ddf(xi) "�C�mo lo evaluamos?"
			den = (dfx^2)-fx*ddfx;
			int count = 1;
			Er = tol + 1;
			while(fx!=0 && den!=0 && Er>tol && count<niter) {
				xn = xi - (fx*dfx)/den;
				//fx = f(xn) "�C�mo lo evaluamos?"
				//dfx = df(xn) "�C�mo lo evaluamos?"
				//ddfx = ddf(xn) "�C�mo lo evaluamos?"
				den = (dfx^2)-fx*ddfx;
				Er = Math.abs((xn-xi)/xn);
				xi = xn;
				count = count + 1;
			}
			if(fx==0) {
				System.out.println("Hay una ra�z en: "+xi);
			}else if(den == 0) {
				System.out.println("Hay una ra�z multiple en: "+xn);
			}else if(Er<tol) {
				System.out.println("Hay una ra�z en: "+xi+" con una Tolerancia = "+tol);
			}else {
				System.out.println("Las iteracciones han finalizado. ");
			}
		}
	}
}
