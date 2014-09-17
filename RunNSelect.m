% Selects which type of computation to perform based on NSELECT value

switch NSELECT
    case 1
        XIDUMMY = XIPRELOAD;
        NFLAG = 0;
        % 1520 GOSUB 13000
        RTMIMuellerSIterMeth()
    case 2
        TCDR = TCDRPRELOAD;
        % 1320 GOSUB 15000
        CalcThermalRatingGivenTCDRCondParamsWeatcond();
    case 3
        
    case 4
end