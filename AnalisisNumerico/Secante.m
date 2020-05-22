function Secante
  disp("Ejemplo de Entrada: ")
  disp("x^2 + 3*x - 1 + 5*x*sin(x) - sqrt(x)")
  pkg load symbolic;
  str_fucn=input("Por favor ingrese su función F:  ","s");
  fucn_sym=sym(str_fucn);
  f=function_handle(fucn_sym);
  x0 = input('Ingrese el primer valor: ');
  x1 = input('Ingrese el segundo valor: ');
  tol = input('Ingrese el valor de la tolerancia(solo el exponente, positivo): ');
  niter = input('Ingrese el número de iteraciones: ');
  tole = 10^-(tol);
  while x0==x1 || tol<1  || niter<1 
    if x0==x1
      disp('Los valores no deben ser iguales')
      x0 = input('Ingrese el primer valor: ');
      x1 = input('Ingrese el segundo valor: ');
    elseif tol<1
      disp('La tolerancia es incorrecta')
      tol = input('Ingrese el valor de la tolerancia(solo el exponente, positivo): ');
      tole = 10^-(tol);
    else
      disp('El número de iteraciones es incorrecto')
      niter = input('Ingrese el número de iteraciones: ');
    end
  end
  fx0 = f(x0);
  if fx0 == 0
    disp('Hay una raíz en:'+x0)
  else
    fx1 = f(x1);
    count = 0;
    Error = tole+1;
    den = fx1-fx0;
    while fx1!=0 && den!=0 && Error>tole && count<niter
      x2 = x1-(fx1*(x1-x0)/den);
      Error = abs(x2-x1);
      x0 = x1;
      fx0 = fx1;
      x1 = x2;
      fx1 = f(x1);
      den = fx1-fx0;
      count += 1;
   end
  end
    if fx1 == 0
      disp('Hay una raíz en:')
      disp(x1)
    elseif den == 0
      disp('Puede que hayan raices multiples')
    elseif Error<tole
      disp('Hay una raíz en:')
      disp(x1)
      disp('Con una tolerancia igual a: ')
      disp(tole)
    else
        disp('Las iteraciones han llegado a su fin')
    end
endfunction