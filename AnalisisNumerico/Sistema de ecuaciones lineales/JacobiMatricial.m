function JacobiMatricial(A,b)
  clc;
  format long;
  x0 = input('Ingrese el valor inicial: ');
  tol = input('Ingrese el valor de la tolerancia(Solo exponente, positivo): ');
  tole = 10^(-tol);
  niter = input('Ingrese el número de iteraciones: ');
  while tol<1 || niter<1
    if tol<1
      disp('El valor de la tolerancia es incorrecto')
      tol = input('Ingrese el valor de la tolerancia(Solo exponente, positivo): : ');
      tole = 10^(-tol);
    else
      disp('El número de iteraciones es incorrecto')
      niter = input('Ingrese el número de iteraciones: ');
    endif
  endwhile
  D = diag(diag(A));
  Din = inv(D);
  T = Din*(D-A);
  C = Din*b;
  r = max(abs(eig(T)));
  count = 0;
  Error = tole+1;
  d = length(b);
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
    disp("se encontró una solución")
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