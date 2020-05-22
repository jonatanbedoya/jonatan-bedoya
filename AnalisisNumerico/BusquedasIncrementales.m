function [inter] = BusquedasIncrementales
  disp("Ejemplo de Entrada: ")
  disp("x^2 + 3*x - 1 + 5*x*sin(x)")
  pkg load symbolic;
  str_fucn=input("Por favor ingrese su función:  ","s");
  fucn_sym=sym(str_fucn);
  f=function_handle(fucn_sym);
  x0 = input('Ingrese el valor inicial: ');
  delta = input('Ingrese el valor del paso (Delta): ');
  niter = input('Ingrese el número de iteraciones: ');
  while niter<1 || delta==0
    if delta==0
      disp('El valor del paso es incorrecto')
      delta = input('Ingrese el valor del paso (Delta): ')
    else
      disp('El número de iteraciones es incorrecto')
      niter = input('Ingrese el número de iteraciones: ')
    end
  end
  fx0 = f(x0);
  if fx0 == 0
    r = 1;
    inter(r) = {[x0]};
    x0 = x0 + delta;
    fx0 = f(x0);
  end
  x1 = x0 + delta;
  fx1 = f(x1);
  count = 1;
  while count<niter && fx1*fx0>0
    x0 = x1;
    fx0 = fx1;
    x1 = x0 + delta;
    fx1 = f(x1);
    count+=1;
    if fx1*fx0<0
      r = r+1;
      inter(r) = {[x0, x1]};
    end
  end
  if count>=niter
    disp('Las iteraciones han llegado a su fin')
  end
  disp('Hay raices en los intervalos: ')
endfunction