function [Aux] = EliminacionGaussSimple(A,b,p)
  #Funciona con cualquier matriz A nxn y b nx1
  #Se solicita el valor p donde 0 es L
  #y para p!=0 es U
  c = [A, b];
  m = 0;
  d = length(b);
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
    Aux = L;
  else
    Aux = U;
  endif
endfunction