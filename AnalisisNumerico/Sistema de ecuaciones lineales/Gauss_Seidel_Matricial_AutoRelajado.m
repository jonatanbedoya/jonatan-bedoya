function Gauss_Seidel_Matricial_AutoRelajado()
  clc;
  format long;
  x0 = input('Ingrese el valor inicial: ');
  tol = input('Ingrese el valor de la tolerancia(Solo exponente, positivo): ');
  tole = 10^(-tol);
  niter = input('Ingrese el n�mero de iteraciones: ');
  w = input("Ingrese un valor entre 0 y 2 para la relajaci�n: ");
  while tol<1 || niter<1 || w<0 || w>2
    if tol<1
      disp('El valor de la tolerancia es incorrecto')
      tol = input('Ingrese el valor de la tolerancia(Solo exponente, positivo): : ');
      tole = 10^(-tol);
    elseif niter<1
      disp('El n�mero de iteraciones es incorrecto')
      niter = input('Ingrese el n�mero de iteraciones: ');
    else
      disp("El valor para la relajaci�n es incorrecto")
      w = input("Ingrese un valor entre 0 y 2 para la relajaci�n: ");
    endif
  endwhile
  disp("Ejemplo de entrada: ");
  disp("s� es x1,  x2 , x3 , x4...hasta x10")
  disp("Entonces el n�mero de variables es: 10")
  d = input("Ingrese el numero de variables: ");
  while d<1
    disp("No hay ingresado el n�mero correctamente");
    d = input("Ingrese un n�mero, por favor: ");
  endwhile
  disp("Va a ingresar los valores de su matriz A");
  A = zeros(d);
  for i=1:d
    disp("Ingrese los valores de la fila ");
    disp(i);
    for j=1:d
      s = input("ingrese un n�mero: ");
      A(i,j) = s;
    endfor
  endfor
  b = ones(d,1);
  disp("Ingrese los valores de su vector b");
  for i=1:d
    s = input("ingrese un n�mero: ");
    b(i) = s;
  endfor
  D = diag(diag(A));
  L = -1*(tril(A)-D);
  Dlin = inv(D-w*L);
  U = (D-L) - A;
  T = Dlin*[(1-w)*D + w*U];
  C = w*Dlin*b;
  r = max(abs(eig(T)));
  count = 0;
  Error = tole+1;
  for i=1:d
    x1(i,1) = x0;
    xs = x1;
  endfor
  while Error>tole && count<niter
    x1 = T*xs + C;
    Error = norm(x1-xs,2);
    xs = x1;
    count+=1;
  endwhile
  x = x1;
  if Error<tole
    disp("se encontr� una soluci�n")
    x
    disp("Con una tolerancia = ")
    disp(tole);
  else
    disp('Las iteraciones han llegado a su fin')
    x
    disp("Con una tolerancia = ")
    disp(Error);
  endif
endfunction