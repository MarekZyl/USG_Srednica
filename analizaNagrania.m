function [A, B] = analizaNagrania (Dane)
iloscKlatek = length(Dane);

[YA,XA,YB,XB] = wskazSrednice(Dane(:,:,1));
        A{1,1} = YA;
        A{2,1} = XA;
        B{1,1} = YB;
        B{2,1} = XB;

for i=2:iloscKlatek
   I = Dane(:,:,i);
   I = I./max(max(I));
   BW1 = wykryjKrawedzie(I,false);

%    if (i == 1)%współrzędne staartowe dla imgML
%       YA = 366;
%       XA = 182;
%       YB = 364;
%       XB = 132;
%    else
       [YA,XA] = pierwszyZgodny (BW1, [A{1,i-1}',A{2,i-1}']);
       [YB,XB] = pierwszyZgodny (BW1, [B{1,i-1}',B{2,i-1}']);
% end
   if ((XB ~= -1) && (XA ~= -1))
       %znajdz krawedzie automatycznie
        [A{1,i},A{2,i}] = znajdzLinie (BW1,YA, XA);
        [B{1,i},B{2,i}] = znajdzLinie (BW1,YB, XB);
       
%            if (i >16) 
%      
%   
%         figure ()
%         imshow(BW1);
%         hold on
%  
%         plot (A{1,i},A{2,i},'sb');
%         plot (B{1,i},B{2,i},'sr');
%         hold off
%          end
   else
       %wskaż punkty ręcznie
       i
       [YA,XA,YB,XB] = wskazSrednice(Dane(:,:,i));
        A{1,i} = YA;
        A{2,i} = XA;
        B{1,i} = YB;
        B{2,i} = XB;
   end
end