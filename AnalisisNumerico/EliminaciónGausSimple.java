package AnalisisNumerico;
public class EliminaciónGausSimple {
	public static void main(String[] args) {
		double A[][] = {{2,-3,4,1},{-4,2,1,-2},{1,3,-5,3},{-3,-1,1,-1}};
		double B[] = {10,-10,32,-21};
		int d = B.length;
		SustiRegre.sustiRegre(eliminaGausSimple(A,B,d,1),SustiProgre.sustiProgre(eliminaGausSimple(A,B,d,0), B, d),d);
	}
	public static double[][] eliminaGausSimple(double A[][], double B[],int d,int p){
		double m = 0;
		double L[][] = new double[d][d];
		double U[][] = new double[d+1][d+1];
		double c[][] = new double[d+1][d+1];
		for (int i=0;i<=d;i++) {
			for (int j=0;j<d;j++) {
				if(i == d) {
					c[j][i] = B[j];
				}else {
					c[i][j]=A[i][j];
				}
			}
		}
		for (int k=0;k<d;k++) {
			for(int i=k+1;i<d+1;i++) {
				if(c[k][k]==0){
					System.out.println("Hay un cero en la diagonal");
					System.out.println("No se pudo completar el proceso");
					k=d+1;
					break;
				}else {
					m = c[i][k]/c[k][k];
				}
				if(i<d) {
					L[i][k] = m;
				}
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
		}else{
			return c;
		}
	}
}