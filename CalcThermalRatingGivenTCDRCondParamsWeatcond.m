% Sub 15000
% Calc Thermal Rating Given TCDR Conductor Parameters and Weather Condtions
fprintf('Trying a TCDR of %f Deg C\n', TCDR)

% Calc conductor Heat Loss (QS) By Radiation (W/m)
T3 = TCDR + 273;
T4 = TAMB + 273;
QR = .0178 * EMISS * D * ((double(T3) / 100) ^ 4 - (double(T4) / 100) ^ 4);

% Calc conductor heat loss by Convection (W/m)
T5 = (double(TCDR) + double(TAMB)) / 2.0;
U1 = 1.458E-06 * (double(T5) + 273) ^ 1.5 / (double(T5) + 383.4);
P1 = (1.2932 - .0001525 * CDR_ELEV + 6.379E-09 * CDR_ELEV ^ 2) ...
    / (1 + .00367 * double(T5));
K1 = .02424 + 7.477E-05 * T5 - 4.407E-09 * T5 ^ 2;
if (DEBUG == 0)
    fprintf('U1,P1,K1 = %f,%f,%f\n', U1, P1, K1);
end

% Calc Conductor Heat Loss (QC) by Natural Convection (W/m)
if ((TCDR - TAMB ) < 0)
    TCDR = TAMB + .1;
end
QC = .0205 * double(P1) ^ .5 * D ^ .75 * (double(TCDR) - double(TAMB)) ^ 1.25;

if (VWIND ~= 0)
	% Calc conductor Heat Loss (QCF) by forced Convection (W/m)  
    Z = D * P1 * VWIND / U1;
	Q1 = .0119 * double(Z) ^ .6 * double(K1) * (double(TCDR) - double(TAMB));
    Q2 = (1.01 + .0372 * double(Z) ^ .52) * double(K1) * ...
        (double(TCDR) - double(TAMB));
    
    if ((Q1 - Q2) <= 0)
        QCF = Q1;
    else
        QCF = Q2;
    end
    
    QCF = QCF * YC;

	% Select larger of Convective Heat Losses (QC VERSUS OCFI
    if (QCF >= QC)
        QC = QCF;
    end    
end

% Calc sum of steady-state flows
R5 = -QS + QC + QR;

% Calc sqrt of Cond Resistance in Ohms/M
W4 = sqrt(B1 + B * TCDR);

if (R5 <= 0)
    TR = 0;
else
    R4 = double(R5) ^ .5;
    %Calculate Thermal Rating (Ampacity) in Amperes
    TR = R4 / W4;
end

QS
QR
QC
TR
