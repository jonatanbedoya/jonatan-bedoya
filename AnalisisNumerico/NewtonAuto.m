function NewtonAuto
  disp("Ejemplo de Entrada: ")
  disp("x^2 + 3*x - 1 + 5*x*sin(x)")
  pkg load symbolic;
  str_fucn=input("Por favor ingrese su función:  ","s");
  fucn_sym=sym(str_fucn);
  f=function_handle(fucn_sym);
  syms x;
  ff=formula(f(x));
  ffd = diff(ff);
  df = function_handle(ffd);
  x0 = input('Ingrese el valor inicial: ');
  tol = input('Ingrese el valor de la tolerancia(solo el exponente, positivo): ');
  niter = input('Ingrese el número de iteraciones: ');
  tole = 10^-(tol);
  while tol<1  || niter<1 
    if tol<1
      disp('La tolerancia es incorrecta')
      tol = input('Ingrese el valor de la tolerancia(solo el exponente, positivo): ');
      tole = 10^-(tol);
    else
      disp('El número de iteraciones es incorrecto')
      niter = input('Ingrese el número de iteraciones: ');
    end
  end
  fx = f(x0);
  dfx = df(x0);
  count = 0;
  Error = tole+1;
    while fx!=0 && dfx!=0 && Error>tole && count<niter
      x1 = x0-(fx/dfx);
      fx = f(x1);
      dfx = df(x1);
      Error = abs(x1-x0);
      x0 = x1;
      count += 1;
   end
    if fx == 0
      disp('Hay una raíz en:')
      disp(x0)
    elseif dfx == 0
      disp('Hay una raíz multiple en: ')
      disp(x1)
    elseif Error<tole
      disp('Hay una raíz en:')
      disp(x1)
      disp('Con una tolerancia igual a: ')
      disp(tole)
    else
        disp('Las iteraciones han llegado a su fin')
    end
endfunction