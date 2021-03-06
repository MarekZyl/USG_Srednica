function wskazniki = wyznaczWskaznikizSrednicy (D)
    s = size(D);
    %min i max jako wspolzedne punku, 1 wartość indeks punktu, 2 to wartość
    wskazniki.min (2,s(1)) = 0;
    wskazniki.max (2,s(1)) = 0;
    wskazniki.AmpPP (s(1)) = 0;

    for i=1:s(1)
        [wskazniki.min(2,i),wskazniki.min(1,i)] = min(D(i,:));
        [wskazniki.max(2,i),wskazniki.max(1,i)] = max(D(i,:));
        wskazniki.AmpPP(i) = wskazniki.max(2,i) - wskazniki.min(2,i);
    end
    wskazniki.tau = wyznaczTau (D, wskazniki.min);
    %wartości globalne dla całej rejestracji
    wskazniki.max_all = max(wskazniki.max(2,:));
    wskazniki.min_all = max(wskazniki.min(2,:));
    wskazniki.AmpPP_all = wskazniki.max_all - wskazniki.min_all;
    wskazniki.tau_med = median(wskazniki.tau(wskazniki.tau~=0),'omitnan');
    wskazniki.PWV = wyznaczPWV (D);
end

function tau = wyznaczTau (D, min)
    zIluProbekWyliczane = 200;
    okresProbkowania = 0.0009;
    
    s = size (D);
    tau (s(1)) = 0;

    for i=1:s(1)
        if ((min(1,i)-zIluProbekWyliczane)>1)
            start = (min(1,i)-zIluProbekWyliczane);            
        else
            start = 1;
        end
        tau(i) = sum(D(i,start:min(1,i)).*okresProbkowania) / (D(i,start)-min(2,i));
    end
end

function PWV = wyznaczPWV (D)
    okresProbkowania = 0.0009;
    s = size (D);
    liczbaNaN (s(1)) = 0;
    for i=1:s(1)
        liczbaNaN(i) = sum(isnan(D(i,:)));
    end
    %plot (liczbaNaN);
    V = sort(liczbaNaN(:));
    prog = mean(V(1:ceil(end/10)))+1;
    
    pierwszyPelnyPrzebieg = find(liczbaNaN<prog, 1, 'first');
    ostatniPelnyPrzebieg  = find(liczbaNaN<prog, 1, 'last');
    if (~(isempty(pierwszyPelnyPrzebieg)||isempty(ostatniPelnyPrzebieg)))
        [c,lags] = xcorr(D(pierwszyPelnyPrzebieg,:),D(ostatniPelnyPrzebieg,:));
        %stem(lags,c)
        [~,I] = max (c);
        PWV = abs(((ostatniPelnyPrzebieg-pierwszyPelnyPrzebieg)*10000)/lags(I)*okresProbkowania);
    else
        PWV = NaN;
    end
end