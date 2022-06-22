function [Filt_D] = filtrUsredniajacy(D,krok_x,krok_t)
s = size (D);

Filt_D (s(1),s(2)) = 0;
%usrednianie przestrzenne po osi Y
for i=1:s(2)
   for j=1:s(1)
       if ((j-krok_x)<1)
           start = 1;
       else
           start = j-krok_x;
       end
       if ((krok_x+j)>s(1))
           stop = s(1);
       else
           stop = krok_x+j;
       end
       dane = D(start:stop,i);
       maska = ~isnan(dane);
       
       Filt_D (j,i) = mean (dane(maska));
      
   end
end
%usrednianie czasowe po osi t

for i=1:s(1)
   for j=1:s(2)
       if ((j-krok_t)<1)
           start = 1;
       else
           start = j-krok_t;
       end
       if ((krok_t+j)>s(2))
           stop = s(2);
       else
           stop = krok_t+j;
       end
       dane = D(i,start:stop);
       maska = ~isnan(dane);
       
       Filt_D (i,j) = mean (dane(maska));
   end
end
end

