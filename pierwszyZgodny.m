function [Y,X] = pierwszyZgodny (maska, punkty)
i = 1;
if (length(punkty)>2)
    Y = punkty (i,1);
    X = punkty (i,2);

    while (maska(Y,X) ~= 1)
        i = i + 1;
        if (i == length(punkty))
            X = -1;
            Y = -1;
            break;
        end
        Y = punkty (i,1);
        X = punkty (i,2);  
    end
   
else
    
    Y = -1;
    X = -1;
end