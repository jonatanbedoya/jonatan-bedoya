//Falta varias cosas
package AnalisisNumerico;
public class Doolitle {
	public static void main(String[] args) {
	}
	private static void MDoolitle(double a[][],double L[][], double U[][],int d) {
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
}
