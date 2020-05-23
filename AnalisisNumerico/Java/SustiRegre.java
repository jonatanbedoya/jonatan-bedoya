package AnalisisNumerico;
public class SustiRegre {
	private static double x = 0;
	private static double xn = 0;
	public static double[] sustiRegre(double U[][],double z[],int d) {
		double e[] = new double[d+1];
		double Um[][] = new double[d+1][d+1];
		if(U.length==d) {
			for(int i=0;i<d;i++) {
				for(int j=0;j<=d;j++) {
					if(j==d){
						Um[i][j] = 0;
						}else{
							Um[i][j] = U[i][j];
						}
					}
				}
			for(int i=d-1;i>=0;i--) {
				xn = 0;
				for(int j=0;j<=d;j++) {
					xn  = xn+e[j]*Um[i][j];
				}
				x = z[i]-xn;
				e[i]=x/Um[i][i];
			}
		}else {
			for(int i=d-1;i>=0;i--) {
				xn = 0;
				for(int j=0;j<=d;j++) {
					xn  = xn+e[j]*U[i][j];
				}
				x = z[i]-xn;
				e[i]=x/U[i][i];
			}
		}
		for(int k =0;k<d;k++) {
			System.out.println("X"+(k+1)+" :"+e[k]);
		}
		return e;
	}
}
