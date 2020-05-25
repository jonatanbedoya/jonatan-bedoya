function RaicesMultiplesAuto
  disp("Ejemplo de Entrada: ")
  disp("x^2 + 3*x - 1 + 5*x*sin(x)+sqrt(x)-asin(x)")
  pkg load symbolic;
  str_fucn=input("Por favor ingrese su función:  ","s");
  fucn_sym=sym(str_fucn);
  f=function_handle(fucn_sym);
  syms x;
  ff=formula(f(x));
  ffd = diff(ff);
  df = function_handle(ffd);
  ffdd = diff(ffd);
  ddf=function_handle(ffdd);
  xi = input('Ingrese el valor inicial: ');
  tol = input('Ingrese el valor de la tolerancia(solo el exponente, positivo): ');
  niter = input('Ingrese el número de iteraciones: ');
  tole = 10^-(tol);
  while tol<1 || niter<1
    if tol<1
      disp('La tolerancia es incorrecta')
      tol = input('Ingrese el valor de la tolerancia(solo el exponente, positivo): ');
      tole = 10^-(tol);
    else
      disp('El número de iteraciones es incorrecto')
      niter = input('Ingrese el número de iteraciones: ')
    end
  end
  fx = f(xi);
  dfx = df(xi);
  ddfx = ddf(xi);
  den = (dfx^2)-fx*ddfx;
  Error = tole+1;
  count = 1;
  while fx!=0 && den!=0 && Error>tole && count<niter
    xn = xi - (fx*dfx)/den;
    fx = f(xn);
    dfx = df(xn);
    ddfx = ddf(xn);
    den = (dfx^2)-fx*ddfx;
    Error = abs(xn-xi);
    xi = xn;
    count+=1;
    end
  if fx == 0
    disp('Hay una raíz en:')
    disp(xi);
  elseif den == 0
    disp('Hay una raíz multiple en:')
    disp(xn);
  elseif Error<tole
    disp('Hay una raíz en:')
    disp(xi);
    disp('Con una tolerancia:')
    disp(tole);
  else
    disp('Las iteraciones han llegado a su fin')
  end
endfunction