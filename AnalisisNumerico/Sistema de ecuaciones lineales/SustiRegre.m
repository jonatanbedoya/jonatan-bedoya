function SustiRegre(U, z)
  #Con la matriz U nxn y el vector z nx1
  #Se ejecuta para encontrar los valores de 
  #X desde el x1 a xn
  x = 0;
  xn = 0;
  d = length(z);
  Uaux = zeros(d);
  e = Uaux(:,1);
  if length(U) == d
    for i=1:d
      for j=1:d
        if j == d
          Uaux(i,j) = 0;
        else
          Uaux(i,j) = U(i,j);
        endif
      endfor
    endfor
    for i=d:-1:1
      xn = 0;
      for j=1:d
        xn = xn + e(j)*U(i,j);
      endfor
      x = z(i) - xn;
      e(i) = x/U(i,i);
    endfor
  else
    for i=d:-1:1
      xn = 0;
      for j=1:d
        xn = xn + e(j)*U(i,j);
      endfor
      x = z(i) - xn;
      e(i) = x/U(i,i);
    endfor
  endif
  for k=1:d
    disp(e(k))
  endfor
endfunction