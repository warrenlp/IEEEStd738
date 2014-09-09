% Selects which type of computation to perform based on NSELECT value

switch NSELECT
    case 1
        
    case 2
        TCDR = TCDRPRELOAD;
        CalcThermalRatingGivenTCDRCondParamsWeatcond();
    case 3
        
    case 4
end