function [a1,b1,a2,b2] = wskazSrednice (I)
I = I./max(max(I));
BW1 = wykryjKrawedzie(I,true);
punkty = wskazPunkty('Tekst', 'Wska¿ œciany naczynia, przytrzymaj Shift aby zaznaczyæ wiele punktów, k aby zakoñczyæ');

hold on
[a1,b1] = znajdzLinie (BW1,punkty(1,1),punkty(1,2));
plot (a1,b1,'sb');
[a2,b2] = znajdzLinie (BW1,punkty(2,1),punkty(2,2));
plot (a2,b2,'sb');
hold off

