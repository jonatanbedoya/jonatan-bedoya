function Cholesky(A,b)
  #Se factoriza la matriz A = LU
  #Luego se hallan los valores de las variables
  format long
  d = length(b);
  for k = 1:d;
    suma1=0;
    for p = 1:k-1;
      suma1 = suma1 + L(k,p)*U(p,k);
    endfor
    L(k,k) = sqrt(A(k,k) - suma1);
    U(k,k) = L(k,k);
    for i = k+1:d;
      suma2 = 0;
      for p = 1:k-1;
        suma2 = suma2 + L(i,p)*U(p,k);
      endfor
      L(i,k)=(A(i,k)-suma2)/U(k,k);
    endfor
    for j = k+1:d;
      suma3 = 0;
      for p = 1:k-1;
        suma3 = suma3 + L(k,p)*U(p,j);
      endfor
      U(k,j)=(A(k,j)-suma3)/L(k,k);
    endfor
  endfor
  disp("L = ")
  AuxL = real(L)+imag(L);
  disp(AuxL)
  disp("U = ")
  AuxU = real(U)+imag(U);
  disp(AuxU)
  %Para comprobar, resuelva Am = L*U
  z=zeros(d,1);
  for k=1:d
    z(k)=((b(k)-L(k,:)*z))/L(k,k);
  endfor
  Auxz = real(z)+imag(z);
  disp("z = ")
  disp(Auxz)
  x=zeros(d,1);
  for k=d:-1:1
    x(k)=((z(k)-U(k,:)*x))/U(k,k);
  endfor
  x
endfunction