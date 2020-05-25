function Doolittle(A,b)
#Se factoriza la matriz A = LU
#Luego se hallan los valores de las variables
  format long
  m=0;#m es el multiplicador
  d = length(A);
  L = eye(d);
  U = zeros(d);
  for k=1:d-1
    for i=k+1:d
      m=A(i,k)/A(k,k);%
      A(i,:)=A(i,:)-m*A(k,:);
      L(i,k)=m;
    endfor
  endfor
  disp("Resultdos: ")
  U=A
  L
  %Se puede comprobar los resultados con: A = L*U
  z=zeros(d,1);
  for k=1:d
    z(k)=((b(k)-L(k,:)*z))/L(k,k);
  endfor
  z
  x=zeros(d,1);
  for k=d:-1:1
    x(k)=((z(k)-U(k,:)*x))/U(k,k);
  endfor
  x
endfunction