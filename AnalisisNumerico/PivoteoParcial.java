package AnalisisNumerico;
public class PivoteoParcial {
	static double A[][] = {{2,-3,4,1},{-4,2,1,-2},{1,3,-5,3},{-3,-1,1,-1}};
	static double B[] = {10,-10,32,-21};
	static double AuxB[] = {10,-10,32,-21};
	static double cambios[][] = {{0},{1},{2},{3}};
	static int d = B.length;
	private static double[][] cambioL(){
		double L[][] = new double[d][d];
		double AuxL[][] = new double[d][d];
		cambios = Parcial(A,B,d,3);
		L = Parcial(A,B,d,0);
		AuxL = Parcial(A,B,d,0);
		for(int i=1;i<d;i++) {
			for(int j=0;j<d;j++) {
				//L[i][j] = AuxL[(int)cambios[j][i]][i];
				//System.out.println("Estoy en: "+i+" y "+j+" con: "+L[i][j]);
				//L[i][j] = AuxL[(int)cambios[i][j]][j];
				L[i][i]=0;
				//System.out.println("Estoy en: "+i+" y "+j+" con: "+L[i][j]);
			}
		}
		return L;
	}
	private static double[] cambiosB() {
		cambios = Parcial(A,B,d,3);
		for(int i=0;i<d;i++) {
			//B[i] = AuxB[(int)cambios[i][i]];
		}
		return B;
	}
	public static void main(String[] args) {
		//P=0 L, P=1 U, P=2 c, p>2 cambios
		Parcial(A,B,d,1);
		//SustiRegre.sustiRegre(Parcial(A,B,d,1),SustiProgre.sustiProgre(cambioL(), cambiosB(), d),d);
		}
	private static double[][] Parcial(double A[][], double B[], int d,int p) {
		int filam = 0;
		double ma,m = 0;
		double Aux[] = new double[d+1];
		double camfila[] = new double[d+1];
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
			filam = (int) BuscarMayor(c,d,k,0);
			if(filam!=k && k!=d) {
				ma =  BuscarMayor(c,d,k,1);
				if(ma==0) {
					System.out.println("Hay solo ceros en la columna: "+k);
					System.out.println("No se pudo completar el proceso");
				}else {
					c = cambioFila(c,k,filam);
					System.out.println("Soy el mayor: "+ma+" Etapa#: "+k);
					System.out.println("soy la fila donde estoy: "+filam);
				}
			}
			for(int i=k+1;i<d+1;i++) {
				if(c[k][k]==0){
					System.out.println("Hay un cero en la diagonal");
					System.out.println("No se pudo completar el proceso");
					k=d+1;
					break;
				}else {
					m = c[i][k]/c[k][k];
				}
				for(int j=0;j<=d;j++) {
					c[i][j]= c[i][j] - (m*c[k][j]);
				}
			}
		}if(p==0) {
			return L;
			}else if(p==1) {
				return U;
				}else{
					return c;
				}
	}
	private static double[][] cambioFila(double[][] c, int k, int filam) {
		double Mc[][] = new double[c.length][c.length];
		double Cam[] = new double[c.length];
		for(int i=0;i<c.length;i++) {
			Cam[i] = c[k][i];
		}
		for(int i = k;i<c.length;i++) {
			c[k][i] = c[filam][i];
			c[filam][i] = Cam[i];
		}
		for(int i=0;i<c.length;i++) {
			for(int j = 0;j<c.length;j++) {
				Mc[i][j] = c[i][j];
			}
		}
		return Mc;
	}
	private static double BuscarMayor(double A[][],int d, int k, int p) {
		double ma=0;
		int filam = 0;
		for(int j = k;j<d;j++) {
			if(Math.abs(A[j][k])>Math.abs(ma)) {
				ma = A[j][k];
				filam = j;
			}
		}
		if(p==0) {
			return filam;
		}else {
			return ma;
		}
	}
}
