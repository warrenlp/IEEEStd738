% Sub 15000
% Calc Thermal Rating Given TCDR Conductor Parameters and Weather Condtions
fprintf('Trying a TCDR of %f Deg C\n', TCDR)

% Calc conductor Heat Loss (QS) By Radiation (W/m)
T3 = TCDR + 273;
T4 = TAMB + 273;
QR = .0178 * EMISS * D * ((T3 / 100) ^ 4 - (T4 / 100) ^ 4);

% Calc conductor heat loss by Convection (W/m)
T5 = (TCDR + TAMB) /2;
U1 = 1.458E-06 * (T5 + 273) ^ 1.5 / (T5 + 383.4);
P1 = (1.2932 - .0001525 * CDR_ELEV + 6.379E-09 * CDR_ELEV ^ 2) ...
    / (1 + .00367 * T5);
K1 = .02424 + 7.477E-05 * T5 - 4.407E-09 * T5 ^ 2;
if (DEBUG == 0)
    fprintf('U1,P1,K1 = %f,%f,%f', U1, P1, K1);
end

% Calc Conductor Heat Loss (QC) by Natural Convection (W/m)
if ((TCDR - TAMB ) < 0)
    TCDR = TAMB + .1;
end
QC = .0205 * P1 ^ .5 * D ^ .75 * (TCDR - TAMB) ^ 1.25;

if (VWIND ~= 0)
    
    
end

% Calc sum of steady-state flows
R5 = -QS + QC + QR;

% Calc sqrt of Cond Resistance in Ohms/M
W4 = sqrt(B1 + B * TCDR);

%15500



