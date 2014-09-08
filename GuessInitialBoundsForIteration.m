% Sub 14000
function [] = GuessInitialBoundsForIteration(NFLAG, TAMB, AT)

    if (NFLAG == 0)
        XLO = TAMB;
        XHI = 1000;
        DIV = 10;
    elseif (NFLAG == 1)
        XLO = 0;
        XHI = 10*AT;
        DIV  =10;
    end
    
    CHA = (XHI - XLO) / DIV;
    NUM = DIV;
    X = XLO;
   
    
    
end