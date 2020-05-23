function [Aux] = PivoteoParcial(A,b,p)
  #Funciona con cualquier matriz A nxn y b nx1
  #Se solicita el valor p donde 0 es L
  #para p=1 es U y para P>1 || p<0 es b modificada. 
  c = [A, b];
  Filam = 0; %Fila donde se encuentra el mayor.
  ma = 0; m = 0;%ma es el mayor, y m es la multiplicidad por etapas.
  d = length(b);
  Auxi = 1:d;
  camfila = Auxi';
  AuxcamFila = Auxi';
  L = zeros(d);
  U = zeros(d);
  for k=1:d
    [ma, Filam] = BuscarMayor(A,d,k);
    if Filam!=k && k!=d
      if ma==0
        disp('No se pudo completar el proceso')
        break;
      else
      camfila(k) = camfila(Filam);
      camfila(Filam) = AuxcamFila(k);
      AuxcamFila(Filam) = AuxcamFila(k);
      c = cambio(c,k,Filam); 
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
    L = cambioL(A,U,camfila);
    Aux = L;
  elseif p==1
    Aux = U;
  else
    Aux = cambioB(b,camfila);
  endif
 function [ma, Filam] = BuscarMayor(A,d,k)
   ma = 0;
   for j=k:d
     if abs(A(j,k))>abs(ma)
       ma = A(j,k);
       Filam = j;
     endif
   endfor
 endfunction
  function AuxC = cambio(c,k,Filam)
   cam = c(:,1);
   AuxC = c;
   for i=1:length(c)-1
     cam(i) = c(k,i);
   endfor
   for i=k:length(c)-1
     c(k,i)=c(Filam,i);
     c(Filam,i) = cam(i);
   endfor
   for i=1:length(c)-1
     for j=1:length(c)-1
       AuxC(i,j) = c(i,j);
     endfor
   endfor
 endfunction
 function L = cambioL(A,U,camfila)
   AuxA = A;
   AuxL = zeros(length(camfila));
   for i=1:length(camfila)
     A(i,:)= AuxA(camfila(i),:);
     AuxA(camfila(i),:) = A(i,:);
   endfor
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