function JacobiRelajado(A,b)
  clc;
  format long;
  x0 = input('Ingrese el valor inicial: ');
  tol = input('Ingrese el valor de la tolerancia(Solo exponente, positivo): ');
  tole = 10^(-tol);
  niter = input('Ingrese el número de iteraciones: ');
  w = input("Ingrese un valor entre 0 y 2 para la relajación: ");
  while tol<1 || niter<1 || w<0 || w>2
    if tol<1
      disp('El valor de la tolerancia es incorrecto')
      tol = input('Ingrese el valor de la tolerancia(Solo exponente, positivo): : ');
      tole = 10^(-tol);
    elseif niter<1
      disp('El número de iteraciones es incorrecto')
      niter = input('Ingrese el número de iteraciones: ');
    else
      disp("El valor para la relajación es incorrecto")
      w = input("Ingrese un valor entre 0 y 2 para la relajación: ");
    endif
  endwhile
  count = 0;
  Error = tole+1;
  d = length(b);
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
      x1(i,1) = (1-w)xs(i,1) + w*((b(i)-xn)/A(i,i));
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