function [Y,X] = znajdzLinie (Obraz,StY,StX)
OG = [1,length(Obraz)];%Ograniczeie obszaru w jakim szukane są styczne punkty

X(1) = StX;
Y(1) = StY;
NX (1) = StX;
NY (1) = StY;
kontynuowac = true;
dopuszczalnaPrzerwaY = 8;
while (kontynuowac)
    kontynuowac = false;
    
    clear NNX NNY;
    NNX(1) = 0;
    NNY(1) = 0;
    
    for h = 1:length (NX)
        StX = NX(h);
        StY = NY(h);
        
        for i=-1:1
            for j=-dopuszczalnaPrzerwaY:dopuszczalnaPrzerwaY
                if ((OG(1)<(StY-j)) && ((StY-j) <OG(2))&& (OG(1)<(StY-j)) && ((StY-j) <OG(2)))
                    if (Obraz(StX-i,StY-j) == 1) 
                        if (czyJuzZnaleziony (X,Y, StX-i,StY-j) == false)
                            X(length(X)+1) = StX-i;
                            Y(length(Y)+1) = StY-j;
                            NNX(length(NNX)+1) = StX-i;
                            NNY(length(NNY)+1) = StY-j; 
                            kontynuowac = true;
                        end
                    end
                end
            end
        end
    end
    NX = NNX(2:length(NNX));
    NY = NNY(2:length(NNY));
end

function obecny = czyJuzZnaleziony (X,Y,NX,NY)
fx = find (X == NX);
fy = find (Y == NY);
obecny = false;
for i = 1:length (fx)
    if (isempty (find (fy == fx(i),1)) == false)
        obecny = true;
        break;
    end
end

