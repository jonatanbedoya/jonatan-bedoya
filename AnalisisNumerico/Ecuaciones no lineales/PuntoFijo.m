function PuntoFijo
  disp("Ejemplo de Entrada: ")
  disp("x^2 + 3*x - 1 + 5*x*sin(x)+sqrt(x)-asin(x)")
  pkg load symbolic;
  str_fucn=input("Por favor ingrese su función F:  ","s");
  fucn_sym=sym(str_fucn);
  f=function_handle(fucn_sym);
  str_fucn2=input("Por favor ingrese su función G:  ","s");
  fucn_sym=sym(str_fucn2);
  g=function_handle(fucn_sym);
  xi = input('Ingrese el valor inicial: ');
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
  fx = f(xi);
  count = 0;
  Error = tole+1;
    while Error>tole && fx!=0 && count<niter
      gx = g(xi);
      xm = gx;
      fx = f(xm);
      Error = abs(xm-xi);
      xi = xm;
      count += 1;
   end
    if fx == 0
      disp('Hay una raíz en:')
      disp(xi)
    elseif Error<tole
      disp('Hay una raíz en:')
      disp(xi)
      disp('Con una tolerancia igual a: ')
      disp(tole)
    else
        disp('Las iteraciones han llegado a su fin')
    end
endfunction