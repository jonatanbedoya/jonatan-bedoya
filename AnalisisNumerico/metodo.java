package AnalisisNumerico;
import java.util.Scanner;
public class metodo {
	static Scanner k = new Scanner(System.in);
	private static double x = 0;
	private static double xn = 0;
	public static void main(String[] args) {
			System.out.print("Ingrese el número de variables: ");
			int d = k.nextInt();
			while(d<=0) {
				System.out.print("Por favor ingrese un valor correcto: ");
				d = k.nextInt();
			}
			double a[][] = {{2,-3,4,1},{-4,2,1,-2},{1,3,-5,3},{-3,-1,1,-1}};
			double b[] = {10,-10,32,-21};
			System.out.println("(0) Eliminación Gauss Simple ");
			System.out.println("(1) Pivoteo Parcial ");
			System.out.println("(2) Pivoteo Total ");
			System.out.println("(3) Factorización de Matrices ");
			System.out.print("Por favor eliga un método: ");
			int j = k.nextInt();
			while(j<0 || j>3) {
				System.out.print("Por favor ingrese un valor correcto: ");
				j = k.nextInt();
			}
			if(j==0) {
				sustiRegre(elimina_gaus_simple(a,b,d,1),sustiProgre(elimina_gaus_simple(a,b,d,0),b,d),d);
			}else if(j==1) {
			}else if(j==2){
			}else if(j==3){
				factorMatriz(a,b, d);
			}
	}
	public static double[][] elimina_gaus_simple(double a[][], double b[],int d,int p){
		double m = 0;
		double L[][] = new double[d+1][d+1];
		double U[][] = new double[d+1][d+1];
		double c[][] = new double[d+1][d+1];
		for (int i=0;i<=d;i++) {
			for (int j=0;j<d;j++) {
				if(i == d) {
					c[j][i] = b[j];
				}else {
					c[i][j]=a[i][j];
				}
			}
		}
		for (int k=0;k<d;k++) {
			for(int i=k+1;i<d+1;i++) {
				if(c[k][k]==0){
					System.out.println("Hay un cero en la diagonal");
					System.out.println("No se pudo completar en proceso");
					k=d+1;
					break;
				}else {
					m = c[i][k]/c[k][k];
				}
				L[i][k] = m;
				for(int j=0;j<=d;j++) {
					c[i][j]= c[i][j] - (m*c[k][j]);
				}
				U[k][i-1] = c[k][i-1];
			}
		}
		if(p==0) {
			return L;
			}else if(p==1) {
				return U;
				}else {
					return c;
					}
	}
	private static double[] sustiProgre(double L[][],double b[], int d) {
		double z[] = new double[d+1];
		for(int i=0;i<d;i++) {
			for(int j=0;j<=d;j++) {
				xn =xn + z[j]*L[i][j];
			}
			z[i] = b[i]-xn;
			xn=0;
		}
		/*for(int k =0;k<d;k++) {
			System.out.println("z"+(k+1)+" :"+z[k]);
		}*/
		return z;
	}
	public static double[] sustiRegre(double U[][],double z[],int d) {
		double e[] = new double[d+1];
		for(int i=d-1;i>=0;i--) {
			for(int j=0;j<=d;j++) {
				xn = xn+e[j]*U[i][j];
			}
			x = z[i]-xn;
			e[i]=x/U[i][i];
			xn=0;
		}
		for(int k =0;k<d;k++) {
			System.out.println("X"+(k+1)+" :"+e[k]);
		}
		return e;
	}
	public static void factorMatriz(double A[][],double b[], int d) {
		System.out.println("(0) Factorización de Croult ");
		System.out.println("(1) Factorización de Dolytle ");
		System.out.println("(2) Factorización de Cholesky ");
		System.out.println("(3) Factorización LU ");
		System.out.print("Por favor eliga un método: ");
		int j = k.nextInt();
		while (j<0 || j>3) {
			System.out.print("Por favor ingrese un valor correcto: ");
			j = k.nextInt();
		}
		if(j==0) {
			croult();
		}else if(j==1) {
			doolitle(A,elimina_gaus_simple(A,b,d,0),elimina_gaus_simple(A,b,d,1),d);
		}else if(j==2){
			cholesky();
		}else{
			factorLU(A,b);
		}
	}
	private static void croult() {
	}
	private static void doolitle(double a[][],double L[][], double U[][],int d) {
		for(int k=0;k<d;k++) {
			for(int j=k;j<d;j++) {
				double ac1=0;
				for(int p=1;p<k-1;k++) {
					ac1 = ac1 + L[k][p]*U[p][k];
				}
				U[k][j]=a[k][j]-ac1;
			}
			for(int i=k+1;i<d;i++) {
				double ac2=0;
				for(int r=1;r<d;r++) {
					ac2 = ac2+L[i][r]*U[r][k];
				}
				L[i][k]=a[i][k]-ac2;
			}
		}
	}
	private static void cholesky() {		
	}
	private static void factorLU(double[][] a, double[] b) {		
	}
}