function [Aux] = PivoteoTotalAuto()
  #Funciona con cualquier matriz A nxn y b nx1
  #Se solicita el valor p donde 0 es L
  #para p=1 es U y para P>1 || p<0 es b modificada. 
  d = input("Ingrese el numero de variables: ");
  while d<1
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
      A(i,j) = s;
    endfor
  endfor
  b = ones(d,1);
  disp("Ingrese los valores de su vector b");
  for i=1:d
    s = input("ingrese un número: ");
    b(i) = s;
  endfor
  disp("0) para la matriz L")
  disp("1) para la Matriz U")
  disp("2) para el vector b luego del ejecutar el método") 
  p = input("Elija una opción, por favor: ");
  while(p<0 || p>2)
    disp("No hay ingresado un número correctamente");
    p = input("Ingrese un número, por favor: ");
  endwhile
  disp("Su matriz A ingresada es: ");
  disp(A);
  disp("Su vector b ingresado es: ");
  disp(b);
  c = [A, b];
  Filam = 0;Colm = 0; %Fila donde se encuentra el mayor.
  ma = 0; m = 0;%ma es el mayor, y m es la multiplicidad por etapas.
  Auxi = 1:d;
  camfila = Auxi';
  AuxcamFila = Auxi';
  camCol = Auxi';
  AuxcamCol = Auxi';
  L = zeros(d);
  U = zeros(d);
  AuxA = A;
  for k=1:d
    A = c;
    [ma, Filam, Colm] = BuscarMayor(A,d,k);
    if Filam!=k && k!=d && Colm!=k
      if ma==0
        disp('No se pudo completar el proceso')
        break;
      else
      camfila(k) = camfila(Filam);
      camfila(Filam) = AuxcamFila(k);
      AuxcamFila(Filam) = AuxcamFila(k);
      camCol(k) = camCol(Colm);
      camCol(Colm) = AuxcamCol(k);
      AuxcamCol(Colm) = AuxcamCol(k);
      c = cambioCol(c,k,Colm);
      c = cambioFil(c,k,Filam); 
      endif
    elseif Filam!=k && k!=d && Colm==k
      if ma==0
        disp('No se pudo completar el proceso')
        break;
      else
      camfila(k) = camfila(Filam);
      camfila(Filam) = AuxcamFila(k);
      AuxcamFila(Filam) = AuxcamFila(k);
      c = cambioFil(c,k,Filam); 
      endif
    elseif Filam==k && k!=d && Colm!=k
      if ma==0
        disp('No se pudo completar el proceso')
        break;
      else
      camCol(k) = camCol(Colm);
      camCol(Colm) = AuxcamCol(k);
      AuxcamCol(Colm) = AuxcamCol(k);
      c = cambioCol(c,k,Colm);
      endif
    endif
      for i=k+1:d
        if c(k,k) == 0
          disp('No se pudo completar el proceso')  
          break;
        else
          m = c(i,k)/c(k,k);%multiplicadores
        endif
        if i<d+1
          L(i,k) = m;%Matrix dxd con los multiplicadores
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
    L = cambioL(AuxA,U,camfila,camCol);
    Aux = L;
  elseif p==1
    disp("Su matriz U es: ")
    Aux = U;
  else
    disp("Su vector b modificado es: ")
    Aux = cambioB(b,camfila);
  endif
 function [ma, Filam, Colm] = BuscarMayor(A,d,k)
   ma = 0;
   for j=k:d
     for i=k:d
       if abs(A(j,i))>abs(ma)
         ma = A(j,i);
         Filam = j;
         Colm = i;
     endif
     endfor
   endfor
 endfunction
  function AuxC = cambioCol(c,k,Colm)
    AuxC = c;
    AuxC(:,k) = AuxC(:,Colm);
    AuxC(:,Colm) = c(:,k);
 endfunction
  function AuxC = cambioFil(c,k,Filam)
    AuxC = c;
    AuxC(k,:) = AuxC(Filam,:);
    AuxC(Filam,:) = c(k,:);
 endfunction
 function L = cambioL(A,U,camfila, camCol)
   ColA = zeros(length(camCol));
   FilaA = zeros(length(camCol));
   AuxL = zeros(length(camfila));
   for j=1:length(camCol)
     ColA(:,j)= A(:,camCol(j));
     for i=1:length(camCol)
       FilaA(i,:)= ColA(camfila(i),:);
     endfor
   endfor
   A = FilaA;
   xn = 0;
   for k=1:length(camfila)
     for i=1:length(camfila)
       xn = 0;
       for j=1:length(camfila)
         xn = xn + AuxL(i,j)*U(j,k);
       endfor
       L(i,k) = (A(i,k)-xn)/U(k,k);
       AuxL(i,k) = L(i,k);
       L(k,k) = 0;
     endfor
   endfor
 endfunction
 function Auxb = cambioB(b,camfila)
   Auxb = b;
   for i=1:length(camfila)
     Auxb(i) = b(camfila(i));
     b(camfila(i)) = Auxb(i);
   endfor
 endfunction
endfunction