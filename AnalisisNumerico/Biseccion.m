function Biseccion
  disp("Ejemplo de Entrada: ")
  disp("x^2 + 3*x - 1 + 5*x*sin(x)")
  pkg load symbolic;
  str_fucn=input("Por favor ingrese su función:  ","s");
  fucn_sym=sym(str_fucn);
  f=function_handle(fucn_sym);
  xi = input('Ingrese el primer valor del intervalo: ');
  xs = input('Ingrese el segundo valor del intervalo: ');
  tol = input('Ingrese el valor de la tolerancia(solo el exponente, positivo): ');
  niter = input('Ingrese el número de iteraciones: ');
  tole = 10^-(tol);
  while xi==xs || tol<1  || niter<1 
    if xi==xs
      disp('El intervalo es incorrecto')
      xi = input('Ingrese el primer valor del intervalo: ');
      xs = input('Ingrese el segundo valor del intervalo: ');
    elseif tol<1
      disp('La tolerancia es incorrecta')
      tol = input('Ingrese el valor de la tolerancia(solo el exponente, positivo): ');
      tole = 10^-(tol);
    else
      disp('El número de iteraciones es incorrecto')
      niter = input('Ingrese el número de iteraciones: ');
    end
  end
  fxi = f(xi);
  fxs = f(xs);
  if fxi == 0
    disp('Hay una raíz en: '+xi)
  elseif fxs == 0
    disp('Hay una raíz en: '+xs)
  elseif fxi*fxs<0
    xm = (xi+xs)/2; 
    fxm = f(xm);
    count = 1;
    Error = tole+1;
    while Error>tole && fxm!=0 && count<niter
      if fxi*fxm<0
        xs = xm;
        fxs = f(xs);
        xm = (xi+xs)/2;
        fxm = f(xm);
        Error = abs(xm-xs);
      else
        xi = xm;
        fxi = f(xi);
        xm = (xi+xs)/2;
        fxm = f(xm);
        Error = abs(xm-xi);
      end
    count+=1;
   end
    if fxm == 0
      disp('Hay una raíz en:')
      disp(xm)
    elseif Error<tole
      disp('Hay una raíz en:')
      disp(xm)
      disp('Con una tolerancia igual a: ')
      disp(tole)
    else
        disp('Las iteraciones han llegado a su fin')
    end
  else
    disp('El intervalo es inadecuado.')
  end
endfunction
