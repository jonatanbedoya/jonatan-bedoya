function [Aux] = EliminacionGaussSimpleAuto()
  #Funciona con cualquier matriz A nxn y b nx1
  #Se solicita el valor p donde 0 es L
  #y para p!=0 es U
  d = input("Ingrese el numero de variables: ");
  while !isnumeric(d) && d<1
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
      while !isnumeric(s)
        disp("No hay ingresado el número correctamente");
        s = input("ingrese un número: ");
      endwhile
      A(i,j) = s;
    endfor
  endfor
  b = ones(d,1);
  disp("Ingrese los valores de su vector b");
  for i=1:d
    s = input("ingrese un número: ");
    while !isnumeric(s)
      disp("No hay ingresado el número correctamente");
      s = input("ingrese un número: ");
    endwhile
    b(i) = s;
  endfor
  disp("0) para la matriz L")
  disp("1) para la Matriz U") 
  p = input("Elija una opción, por favor: ");
  while(!isnumeric(p) || p<0 || p>1)
    disp("No hay ingresado un número correctamente");
    p = input("Ingrese un número, por favor: ");
  endwhile
  c = [A, b];
  disp("Su matriz A ingresada es: ");
  disp(A);
  disp("Su vector b ingresado es: ");
  disp(b);
  m = 0;
  L = zeros(d);
  U = zeros(d);
  for k=1:d
    for i=k+1:d
      if(c(k,k) == 0)
        disp('Hay un cero en la diagonal:')
        disp('No se pudo completar el proceso')
      else
        m = c(i,k)/c(k,k);
      endif
      if i<=d+1
        L(i,k)= m;
      endif
      for j=1:d+1
        c(i,j) = c(i,j) - m*c(k,j);
      endfor
      U(k,i) = c(k,i);
    endfor
    U(k,k) = c(k,k);
  endfor
  if p==0
    disp("Su matriz L es: ")
    Aux = L;
  else
    disp("Su matriz U es: ")
    Aux = U;
  endif
endfunction