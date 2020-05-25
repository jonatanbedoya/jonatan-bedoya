function z = SustiProgre(L, b)
  #Con la matriz L nxn y el vector b nx1
  #Se ejecuta para calcular el vector z nx1
  d = length(b);
  xn = 0;
  Uaux = zeros(d);
  z = Uaux(:,1);
  for i=1:d
    for j=1:d
      xn = xn + z(j)*L(i,j);
    endfor
    z(i) = b(i)-xn;
    xn = 0;
  endfor
endfunction