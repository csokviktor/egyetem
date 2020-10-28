function checkForTrafficJam()
global car;
global carnum;

global lampaciklusnext;
global lampaciklusaktualis;

global nlane1;
global nlane2;
global wlane1;
global wlane2;
global slane1;
global slane2;
global elane1;
global elane2;

global jamBoolN;
global jamBoolW;
global jamBoolS;
global jamBoolE;

N1 = sym('N1');
N2 = sym('N2');
N3 = sym('N3');
N4 = sym('N4');
W1 = sym('W1');
W2 = sym('W2');
W3 = sym('W3');
W4 = sym('W4');
S1 = sym('S1');
S2 = sym('S2');
S3 = sym('S3');
S4 = sym('S4');
E1 = sym('E1');
E2 = sym('E2');
E3 = sym('E3');
E4 = sym('E4');

jamN = zeros(1,7);
jamW = zeros(1,7);
jamS = zeros(1,7);
jamE = zeros(1,7);


nStraightCntr = 0;
nLeftCntr = 0;
nOtherCntr = 0;

wStraightCntr = 0;
wLeftCntr = 0;
wOtherCntr = 0;

sStraightCntr = 0;
sLeftCntr = 0;
sOtherCntr = 0;

eStraightCntr = 0;
eLeftCntr = 0;
eOtherCntr = 0;

%% torlodas letezesenek vizsgalata
for o = 1:carnum 
        %�szaki oldal
    if(isequal(car{o}{2}.XData, nlane1{3}(1)) && isequal(car{o}{2}.YData,nlane1{3}(2)))
        jamN(2) = 1;
    elseif(isequal(car{o}{2}.XData, nlane1{4}(1)) && isequal(car{o}{2}.YData,nlane1{4}(2)) && isequal(car{o}{7},0))
        jamN(3) = 1;
    elseif(isequal(car{o}{2}.XData, nlane2{4}(1)) && isequal(car{o}{2}.YData,nlane2{4}(2)) && isequal(car{o}{7},0))
        jamN(4) = 1;
    elseif(isequal(car{o}{2}.XData, nlane2{3}(1)) && isequal(car{o}{2}.YData,nlane2{3}(2)))
        jamN(5) = 1;
    elseif(isequal(car{o}{2}.XData, nlane2{4}(1)) && isequal(car{o}{2}.YData,nlane2{4}(2)) && isequal(car{o}{7},0))
        jamN(6) = 1;
    elseif(isequal(car{o}{2}.XData, nlane1{4}(1)) && isequal(car{o}{2}.YData,nlane1{4}(2)) && isequal(car{o}{7},0))
        jamN(7) = 1;
    
        %nyugati oldal
    elseif(isequal(car{o}{2}.XData, wlane1{3}(1)) && isequal(car{o}{2}.YData,wlane1{3}(2)))
        jamW(2) = 1;
    elseif(isequal(car{o}{2}.XData, wlane1{4}(1)) && isequal(car{o}{2}.YData,wlane1{4}(2)) && isequal(car{o}{7},0))
        jamW(3) = 1;
    elseif(isequal(car{o}{2}.XData, wlane2{4}(1)) && isequal(car{o}{2}.YData,wlane2{4}(2)) && isequal(car{o}{7},0))
        jamW(4) = 1;
    elseif(isequal(car{o}{2}.XData, wlane2{3}(1)) && isequal(car{o}{2}.YData,wlane2{3}(2)))
        jamW(5) = 1;
    elseif(isequal(car{o}{2}.XData, wlane2{4}(1)) && isequal(car{o}{2}.YData,wlane2{4}(2)) && isequal(car{o}{7},0))
        jamW(6) = 1;
    elseif(isequal(car{o}{2}.XData, wlane1{4}(1)) && isequal(car{o}{2}.YData,wlane1{4}(2)) && isequal(car{o}{7},0))
        jamW(7) = 1;
    
        %d�li oldal
    elseif(isequal(car{o}{2}.XData, slane1{3}(1)) && isequal(car{o}{2}.YData,slane1{3}(2)))
        jamS(2) = 1;
    elseif(isequal(car{o}{2}.XData, slane1{4}(1)) && isequal(car{o}{2}.YData,slane1{4}(2)) && isequal(car{o}{7},0))
        jamS(3) = 1;
    elseif(isequal(car{o}{2}.XData, slane2{4}(1)) && isequal(car{o}{2}.YData,slane2{4}(2)) && isequal(car{o}{7},0))
        jamS(4) = 1;
    elseif(isequal(car{o}{2}.XData, slane2{3}(1)) && isequal(car{o}{2}.YData,slane2{3}(2)))
        jamS(5) = 1;
    elseif(isequal(car{o}{2}.XData, slane2{4}(1)) && isequal(car{o}{2}.YData,slane2{4}(2)) && isequal(car{o}{7},0))
        jamS(6) = 1;
    elseif(isequal(car{o}{2}.XData, slane1{4}(1)) && isequal(car{o}{2}.YData,slane1{4}(2)) && isequal(car{o}{7},0))
        jamS(7) = 1;
        
        %keleti oldal
    elseif(isequal(car{o}{2}.XData, elane1{3}(1)) && isequal(car{o}{2}.YData,elane1{3}(2)))
        jamE(2) = 1;
    elseif(isequal(car{o}{2}.XData, elane1{4}(1)) && isequal(car{o}{2}.YData,elane1{4}(2)) && isequal(car{o}{7},0))
        jamE(3) = 1;
    elseif(isequal(car{o}{2}.XData, elane2{4}(1)) && isequal(car{o}{2}.YData,elane2{4}(2)) && isequal(car{o}{7},0))
        jamE(4) = 1;
    elseif(isequal(car{o}{2}.XData, elane2{3}(1)) && isequal(car{o}{2}.YData,elane2{3}(2)))
        jamE(5) = 1;
    elseif(isequal(car{o}{2}.XData, elane2{4}(1)) && isequal(car{o}{2}.YData,elane2{4}(2)) && isequal(car{o}{7},0))
        jamE(6) = 1;
    elseif(isequal(car{o}{2}.XData, elane1{4}(1)) && isequal(car{o}{2}.YData,elane1{4}(2)) && isequal(car{o}{7},0))
        jamE(7) = 1;
    end
end



%% torlodas okanak vizsgalata, megszamoljuk h ki merre akar menni

%Eszaki oldal
if((jamN(2) == 1 && jamN(3) == 1 && jamN(4) == 1)...
        || (jamN(5) == 1 && jamN(6) == 1 && jamN(7) == 1)...
        || (jamN(2) == 1 && jamN(3) == 1 && jamN(4) == 1 && jamN(5) == 1 && jamN(6) == 1 && jamN(7) == 1))
    for t = 1:carnum
        for r = 1:11
            if(isequal(car{t}{2}.XData, nlane1{r}(1)) && isequal(car{t}{2}.YData, nlane1{r}(2)) || isequal(car{t}{2}.XData, nlane2{r}(1)) && isequal(car{t}{2}.YData, nlane2{r}(2)))
                if(isequal(car{t}{5}, S2) || isequal(car{t}{5}, S3) || isequal(car{t}{5}, S4))
                    nStraightCntr = nStraightCntr + 1;
                elseif(isequal(car{t}{5}, E2) || isequal(car{t}{5}, E3) || isequal(car{t}{5}, E4))
                    nLeftCntr = nLeftCntr + 1;
                else
                    nOtherCntr = nOtherCntr + 1;
                end
            end
        end
    end
    jamBoolN = 1;
else
    jamBoolN = 0;
end

%Nyugati oldal
if((jamW(2) == 1 && jamW(3) == 1 && jamW(4) == 1)...
        || (jamW(5) == 1 && jamW(6) == 1 && jamW(7) == 1)...
        || (jamW(2) == 1 && jamW(3) == 1 && jamW(4) == 1 && jamW(5) == 1 && jamW(6) == 1 && jamW(7) == 1))
    for t = 1:carnum
        for r = 1:11
            if(isequal(car{t}{2}.XData, wlane1{r}(1)) && isequal(car{t}{2}.YData, wlane1{r}(2)) || isequal(car{t}{2}.XData, wlane2{r}(1)) && isequal(car{t}{2}.YData, wlane2{r}(2)))
                if(isequal(car{t}{5}, E2) || isequal(car{t}{5}, E3) || isequal(car{t}{5}, E4))
                    wStraightCntr = wStraightCntr + 1;
                elseif(isequal(car{t}{5}, N2) || isequal(car{t}{5}, N3) || isequal(car{t}{5}, N4))
                    wLeftCntr = wLeftCntr + 1;
                else
                    wOtherCntr = wOtherCntr + 1;
                end
            end
        end
    end
    jamBoolW = 1;
else
    jamBoolW = 0;
end

%Deli oldal
if((jamS(2) == 1 && jamS(3) == 1 && jamS(4) == 1)...
    || (jamS(5) == 1 && jamS(6) == 1 && jamS(7) == 1)...
    || (jamS(2) == 1 && jamS(3) == 1 && jamS(4) == 1 && jamS(5) == 1 && jamS(6) == 1 && jamS(7) == 1))
    for t = 1:carnum
        for r = 1:11
            if(isequal(car{t}{2}.XData, slane1{r}(1)) && isequal(car{t}{2}.YData, slane1{r}(2)) || isequal(car{t}{2}.XData, slane2{r}(1)) && isequal(car{t}{2}.YData, slane2{r}(2)))
                if(isequal(car{t}{5}, N2) || isequal(car{t}{5}, N3) || isequal(car{t}{5}, N4))
                    sStraightCntr = sStraightCntr + 1;
                elseif(isequal(car{t}{5}, W2) || isequal(car{t}{5}, W3) || isequal(car{t}{5}, W4))
                    sLeftCntr = sLeftCntr + 1;
                else
                    sOtherCntr = sOtherCntr + 1;
                end
            end
        end
    end    
    jamBoolS = 1;
else
    jamBoolS = 0;
end

%Keltei oldal
if((jamE(2) == 1 && jamE(3) == 1 && jamE(4) == 1)...
    || (jamE(5) == 1 && jamE(6) == 1 && jamE(7) == 1)...
    || (jamE(2) == 1 && jamE(3) == 1 && jamE(4) == 1 && jamE(5) == 1 && jamE(6) == 1 && jamE(7) == 1))
    for t = 1:carnum
        for r = 1:11
            if(isequal(car{t}{2}.XData, elane1{r}(1)) && isequal(car{t}{2}.YData, elane1{r}(2)) || isequal(car{t}{2}.XData, elane2{r}(1)) && isequal(car{t}{2}.YData, elane2{r}(2)))
                if(isequal(car{t}{5}, W2) || isequal(car{t}{5}, W3) || isequal(car{t}{5}, W4))
                    eStraightCntr = eStraightCntr + 1;
                elseif(isequal(car{t}{5}, S2) || isequal(car{t}{5}, S3) || isequal(car{t}{5}, S4))
                    eLeftCntr = eLeftCntr + 1;
                else
                    eOtherCntr = eOtherCntr + 1;
                end
            end
        end
    end
    jamBoolE = 1;
else
    jamBoolE = 0;
end

%% Eldontjuk milyen ciklus kovetkezzen
if((jamBoolN == 1) || (jamBoolW == 1) || (jamBoolS == 1) || (jamBoolE == 1))
    nCarNum = nOtherCntr + nStraightCntr + nLeftCntr;
    wCarNum = wOtherCntr + wStraightCntr + wLeftCntr;
    sCarNum = sOtherCntr + sStraightCntr + sLeftCntr;
    eCarNum = eOtherCntr + eStraightCntr + eLeftCntr;
end


%North
if((jamBoolN == 1) && (jamBoolW == 0) && (jamBoolS == 0) && (jamBoolE == 0))
    decideNextCycleN()
elseif((jamBoolN == 1) && (jamBoolW == 1) && (jamBoolS == 0) && (jamBoolE == 0))
    if(nCarNum > wCarNum + 4)
        decideNextCycleN()
    elseif(wCarNum > nCarNum + 4)
        decideNextCycleW()
    else
        lampaciklusnext = lampaciklusaktualis;
    end
elseif((jamBoolN == 1) && (jamBoolW == 0) && (jamBoolS == 1) && (jamBoolE == 0))
    if(nCarNum > sCarNum + 4)
        decideNextCycleN()
    elseif(sCarNum > nCarNum + 4)
        decideNextCycleS()
    else
        lampaciklusnext = lampaciklusaktualis;
    end
elseif((jamBoolN == 1) && (jamBoolW == 0) && (jamBoolS == 0) && (jamBoolE == 1))
    if(nCarNum > eCarNum + 4)
        decideNextCycleN()
    elseif(eCarNum > nCarNum + 4)
        decideNextCycleE()
    else
        lampaciklusnext = lampaciklusaktualis;
    end

    
%West
elseif((jamBoolN == 0) && (jamBoolW == 1) && (jamBoolS == 0) && (jamBoolE == 0))
    decideNextCycleW()
elseif((jamBoolN == 1) && (jamBoolW == 1) && (jamBoolS == 0) && (jamBoolE == 0))
    if(wCarNum > nCarNum + 4)
        decideNextCycleW()
    elseif(nCarNum > wCarNum + 4)
        decideNextCycleN()
    else
        lampaciklusnext = lampaciklusaktualis;
    end
elseif((jamBoolN == 0) && (jamBoolW == 1) && (jamBoolS == 1) && (jamBoolE == 0))
    if(wCarNum > sCarNum + 4)
        decideNextCycleW()
    elseif(sCarNum > wCarNum + 4)
        decideNextCycleS()
    else
        lampaciklusnext = lampaciklusaktualis;
    end
elseif((jamBoolN == 0) && (jamBoolW == 1) && (jamBoolS == 0) && (jamBoolE == 1))
    if(wCarNum > eCarNum + 4)
        decideNextCycleW()
    elseif(eCarNum > wCarNum + 4)
        decideNextCycleE()
    else
        lampaciklusnext = lampaciklusaktualis;
    end
   
    
%South
elseif((jamBoolN == 0) && (jamBoolW == 0) && (jamBoolS == 1) && (jamBoolE == 0))
    decideNextCycleS()
elseif((jamBoolN == 1) && (jamBoolW == 0) && (jamBoolS == 1) && (jamBoolE == 0))
    if(sCarNum > nCarNum + 4)
        decideNextCycleS()
    elseif(nCarNum > sCarNum + 4)
        decideNextCycleN()
    else
        lampaciklusnext = lampaciklusaktualis;
    end
elseif((jamBoolN == 0) && (jamBoolW == 1) && (jamBoolS == 1) && (jamBoolE == 0))
    if(sCarNum > wCarNum + 4)
        decideNextCycleS()
    elseif(wCarNum > sCarNum + 4)
        decideNextCycleW()
    else
        lampaciklusnext = lampaciklusaktualis;
    end
elseif((jamBoolN == 0) && (jamBoolW == 0) && (jamBoolS == 1) && (jamBoolE == 1))
    if(sCarNum > eCarNum + 4)
        decideNextCycleS()
    elseif(eCarNum > sCarNum + 4)
        decideNextCycleE()
    else
        lampaciklusnext = lampaciklusaktualis;
    end
    
    
%East
elseif((jamBoolN == 0) && (jamBoolW == 0) && (jamBoolS == 0) && (jamBoolE == 1))
    decideNextCycleE()
elseif((jamBoolN == 1) && (jamBoolW == 0) && (jamBoolS == 0) && (jamBoolE == 1))
    if(eCarNum > nCarNum + 4)
        decideNextCycleE()
    elseif(nCarNum > eCarNum + 4)
        decideNextCycleN()
    else
        lampaciklusnext = lampaciklusaktualis;
    end
elseif((jamBoolN == 0) && (jamBoolW == 1) && (jamBoolS == 0) && (jamBoolE == 1))
    if(eCarNum > wCarNum + 4)
        decideNextCycleE()
    elseif(wCarNum > eCarNum + 4)
        decideNextCycleW()
    else
        lampaciklusnext = lampaciklusaktualis;
    end
elseif((jamBoolN == 0) && (jamBoolW == 0) && (jamBoolS == 1) && (jamBoolE == 1))
    if(eCarNum > sCarNum + 4)
        decideNextCycleE()
    elseif(sCarNum > eCarNum + 4)
        decideNextCycleS()
    else
        lampaciklusnext = lampaciklusaktualis;
    end
    
else
    lampaciklusnext = lampaciklusaktualis;
end



    function decideNextCycleN()
        if(nStraightCntr > nLeftCntr + 2)
            lampaciklusnext = 2;
        elseif(nLeftCntr > nStraightCntr + 3)
            lampaciklusnext = 3;
        else
            lampaciklusnext = lampaciklusaktualis;
        end
    end

    function decideNextCycleW()
        if(wStraightCntr > wLeftCntr + 2)
            lampaciklusnext = 4;
        elseif(wLeftCntr > wStraightCntr + 3)
            lampaciklusnext = 5;
        else
            lampaciklusnext = lampaciklusaktualis;
        end
    end

    function decideNextCycleS()
        if(sStraightCntr > sLeftCntr + 2)
            lampaciklusnext = 6;
        elseif(sLeftCntr > sStraightCntr + 3)
            lampaciklusnext = 7;
        else
            lampaciklusnext = lampaciklusaktualis;
        end
    end

    function decideNextCycleE()
        if(eStraightCntr > eLeftCntr + 2)
            lampaciklusnext = 8;
        elseif(eLeftCntr > eStraightCntr + 3)
            lampaciklusnext = 9;
        else
            lampaciklusnext = lampaciklusaktualis;
        end
    end




end