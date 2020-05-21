package AnalisisNumerico;
import java.util.*;
public class BusquedasIncrementales {

	private static double delta, x0, x1, fx0, fx1;
	private static int niter;
	public static void main(String[] args) {
		Busquedas();
	}
	public static void Busquedas() {
		try (Scanner a = new Scanner(System.in)) {
			System.out.print("Ingrese el valor inicial: ");
			x0 = a.nextDouble();
			System.out.print("Ingrese el valor del paso (Delta): ");
			delta = a.nextDouble();
			System.out.print("Ingrese el número de iteraciones: ");
			niter = a.nextInt();
			while(niter<1 || delta==0) {
				if(delta==0) {
					System.out.println("El valor del paso es incorrecto: ");
					System.out.print("Ingrese el valor del paso (Delta): ");
					delta = a.nextDouble();
				}else{
						System.out.println("el número de iteraciones es incorrecto: ");
						System.out.print("Ingrese el número de iteraciones: ");
						niter = a.nextInt();
						}
			}
			//fx0 = f(x0) "¿Cómo lo podemos evaluar?"
			x1 = x0 + delta;
			//fx1 = f(x1) "¿Cómo lo podemos evaluar?"
			int count = 1;
			while(count<niter && fx1*fx0>0) {
				x0 = x1;
				/** fx0=fx1 */
				x1 = x0 + delta;
				//fx1 = f(x1) "¿Cómo lo podemos evaluar?"
				count = count +1;
				if(fx1*fx0<0) {
					System.out.println("Hay una raiz en intervalo: "+x0+ ","+x1);
				}
			}
			if(count>=niter) {
				System.out.println("Las iteraciones han llegado a su fin. ");
			}
		}
	}
}
