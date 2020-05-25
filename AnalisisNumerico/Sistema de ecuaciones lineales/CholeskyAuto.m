function CholeskyAuto()
  #Se factoriza la matriz A = LU
  #Luego se hallan los valores de las variables
  clc;
  format long
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