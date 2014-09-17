clc
clear

% 10-870
InitVariablesArrays();
% 880 GOSUB 8000
DataEntry();
% 1150 GOSUB 5000
CalcCondSolarHeatGainQS();
% 1190 GOSUB 9000
CalcThermCoefRacHeatCapWindCorr();
% 1230
RunNSelect();
