% Sub 12000
function [] = IterateToFindCondTempGivenCurrent()

    if (NFLAG == 0)
        TCDR = X;
        %GOSUB 15000
        CalcThermalRatingGivenTCDRCondParamsWeatcond();
        TEMP = XIDUMMY - TR;
        return;
    elseif (NFLAG == 1)
        XISTEP = X;
        %GOSUB 11000;
    end
    
    if (TCDRPRELOAD <= TCDRMAX)
        TEMP = TCDRMAX - TCDR;
    else
        TEMP = TCDR - TCDRMAX;
    end
end