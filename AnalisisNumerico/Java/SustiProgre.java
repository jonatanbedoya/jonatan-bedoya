package AnalisisNumerico;

public class SustiProgre {
	private static double xn = 0;
	public static double[] sustiProgre(double L[][],double b[], int d) {
		double z[] = new double[d];
		for(int i=0;i<d;i++) {
			for(int j=0;j<d;j++) {
				xn =xn + z[j]*L[i][j];
			}
			z[i] = b[i]-xn;
			xn=0;
		}
		for(int k =0;k<d;k++) {
			System.out.println("z"+(k+1)+" :"+z[k]);
		}
		return z;
	}
}
