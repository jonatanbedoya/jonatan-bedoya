package AnalisisNumerico;
import java.util.Scanner;
public class Bisección {//sin terminar
	private static long xi, xs, tol, tole, xm, fxi, fxs, fxm, Er;
	private static int niter;
	public static void main(String[] args) {
		bise();
	}
	public static void bise() {
		try (Scanner a = new Scanner(System.in)) {
			System.out.print("Ingrese el primer valor del intervalo: ");
			xi = a.nextLong();
			System.out.print("Ingrese el segundo valor del intervalo: ");
			xs = a.nextLong();
			System.out.print("ingrese la tolerancia (Solo el exponente positivo): ");
			tole = a.nextLong();
			tol = (long) Math.pow(10, -tole);
			System.out.print("ingrese el número de iteracciones: ");
			niter = a.nextInt();	
			while(xi==xs || tole<0 || niter<1) {
				if(xi==xs) {
					System.out.println("Intervalo incorrecto");
					System.out.print("Ingrese el primer valor del intervalo: ");
					xi = a.nextLong();
					System.out.print("Ingrese el segundo valor del intervalo: ");
					xs = a.nextLong();
				}else if(tole<0) {
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
			//fxs = f(xs) "¿Cómo lo podemos evaluar?"
			if(fxi==0) {
				System.out.print("Hay una raiz en: "+xi);
			}else if(fxs==0) {
				System.out.print("Hay una raiz en: "+xs);
			}else if(fxi*fxs<0) {
				xm = (xi+xs)/2;
				//fxm = f(xm) "¿Cómo lo podemos evaluar?"
				int count = 1;
				Er = tol+1;
				while(Er>tol && fxm!=0 && count<niter) {
					if(fxi*fxm<0) {
						xs = xm;
						//fxs = f(xs) "¿Cómo lo podemos evaluar?"
						xm = (xi+xs)/2;
						//fxm = f(xm) "¿Cómo lo podemos evaluar?"
						Er = Math.abs(xm-xs);
					}else {
						xi=xm;
						//fxi = f(xi) "¿Cómo lo podemos evaluar?"
						xm = (xi+xs)/2;
						//fxm = f(xm) "¿Cómo lo podemos evaluar?"
						Er = Math.abs(xm-xi);
					}
					count = count +1;
				}
				if(fxm==0) {
					System.out.println("Hay una raiz en: "+xm);
				}else if(Er<tol) {
					System.out.println("Hay una raiz en: "+xm+" con tolerancia: "+tol);
				}else {
					System.out.println("Las iteraciones han llegado a su fin. ");
				}
			}else {
				System.out.println("El intervalo es inadecuado");
			}
		}
	}
}
