function D = wyliczSrednice (A,B)
rozmiarObrazkaX = 401;
dlugoscSekwencji = length(A);
D(rozmiarObrazkaX,dlugoscSekwencji) = 0;

for i=1:dlugoscSekwencji
    AX = A{1,i};
    AY = A{2,i};
    BX = B{1,i};
    BY = B{2,i};
    for j = 1:rozmiarObrazkaX
        indeksyPunktowA = find(AX==j);
        indeksyPunktowB = find(BX==j);
        if (isempty(indeksyPunktowA)&&isempty(indeksyPunktowB))
            D(j,i) = nan;
        else
            D(j,i) = abs(mean(AY(indeksyPunktowA))-mean(BY(indeksyPunktowB)));
        end
    end
end