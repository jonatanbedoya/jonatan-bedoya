function DoolittleAuto()
#Se factoriza la matriz A = LU
#Luego se hallan los valores de las variables
  format long;
  disp("Ejemplo de entrada: ");
  disp("sí es x1,  x2 , x3 , x4...hasta x10")
  disp("Entonces el número de variables es: 10")
  d = input("Ingrese el numero de variables: ");
  while d<1
    disp("No hay ingresado el número correctamente");
    d = input("Ingrese un número, por favor: ");
  endwhile
  disp("Va a ingresar los valores de su matriz A");
  A = zeros(d);
  for i=1:d
    disp("Ingrese los valores de la fila ");
    disp(i);
    for j=1:d
      s = input("ingrese un número: ");
      A(i,j) = s;
    endfor
  endfor
  b = ones(d,1);
  disp("Ingrese los valores de su vector b");
  for i=1:d
    s = input("ingrese un número: ");
    b(i) = s;
  endfor
  disp("Su matriz A ingresada es: ");
  disp(A);
  disp("Su vector b ingresado es: ");
  disp(b);
  m=0;#m es el multiplicador
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