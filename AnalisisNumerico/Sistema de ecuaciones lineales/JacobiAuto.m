function JacobiAuto()
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
  count = 0;
  Error = tole+1;
  for i=1:d
    x1(i,1) = x0;
    xs = x1;
  endfor
  while Error>tole && count<niter
    for i=1:d
      xn = 0;
      for j=1:d
        if i!=j
          xn = xn + A(i,j)*xs(j,1);
        endif
      endfor
      x1(i,1) = (b(i)-xn)/A(i,i);
    endfor
    xn = 0;
    xn1 = 0;
    for i=1:d
      xn1 = xn1 + (x1(i,1)-xs(i,1))^2;
      xn = xn + x1(i,1)^2;
    endfor
    Error = sqrt(xn1)/sqrt(xn);
    xs = x1;
    count +=1;
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