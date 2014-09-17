% Sub 5000
% CalcCondSolarHeatGainQS

if (SUN_TIME >= 24)
    QS = 0;
    return;
end

DEG_TO_RAD = pi / 180;

CDR_LAT_RAD = CDR_LAT_DEG * DEG_TO_RAD;

% Solar Declination
DECL_DEG = 23.4583 * sin(((284.0 + double(NDAY)) / 365.0) * 2.0 * pi);
DECL_RAD = DECL_DEG * DEG_TO_RAD;

% Solar Angle Relative to Noon
HOUR_ANG_DEG = (SUN_TIME - 12) * 15;
HOUR_ANG_RAD = HOUR_ANG_DEG * DEG_TO_RAD;

% Find Solar Altitude - H3
H3ARG = cos(CDR_LAT_RAD) * cos(DECL_RAD) * cos(HOUR_ANG_RAD) + ...
    sin(CDR_LAT_RAD) * sin(DECL_RAD);
H3_RAD = atan(H3ARG / sqrt(1 - H3ARG ^ 2));
H3_DEG = H3_RAD / DEG_TO_RAD;

if (A3 == 1)
    % Solar Heat (Q3) At Earth Surface (W/m^2) in Industrial Air (P6)
    Q3 = 53.1821 + 14.211 * H3_DEG + .66138 * H3_DEG ^ 2;
    Q3 = Q3 - .031658 * H3_DEG ^3 + 5.4654E-04 * H3_DEG ^ 4;
    Q3 = Q3 - 4.3446E-06 * H3_DEG ^ 5 + 1.3236E-08 * H3_DEG ^ 6;
    BSTR = 'INDUSTRIAL';
else
    Q3 = -42.2391 + 63.8044 * H3_DEG - 1.922 * H3_DEG ^ 2;
    Q3 = Q3 + .034692 * H3_DEG ^ 3 - 3.6112E-04 * H3_DEG ^ 4;
    Q3 = Q3 + 1.9432E-06 * H3_DEG ^ 5 - 4.0761E-09 * H3_DEG ^ 6;
    BSTR = 'CLEAR';
end

% Calculate Solar Azimuth Variable, Chi
CHI_DENOM = sin(CDR_LAT_RAD) * cos(HOUR_ANG_RAD) - cos(CDR_LAT_RAD) ...
    * tan(DECL_RAD);
CHI = sin(HOUR_ANG_RAD) / CHI_DENOM;

% Calculate Solar Azimuth Constant, CAZ
if ((HOUR_ANG_DEG < 0) && (CHI >= 0))
    CAZ = 0;
elseif ((HOUR_ANG_DEG >= 0) && (CHI < 0))
    CAZ = 360;
else
    CAZ = 180;
end

% Calculate Solar Azimuth in Degrees, Z4_DEG
Z4_DEG = 114;
%Z4_DEG = CAZ + atan(CHI);
Z4_RAD = Z4_DEG * DEG_TO_RAD;
Z1_RAD = Z1_DEG * DEG_TO_RAD;
E1 = cos(H3_RAD) * cos(Z4_RAD - Z1_RAD);
E2_RAD = atan(sqrt(1 / E1 ^ 2 - 1));
QS = ABSORP * Q3 * sin(E2_RAD) * D / 1000 * (1 + .0001148 * CDR_ELEV ...
    - 1.108E-08 * CDR_ELEV ^ 2);

if (QS < 0)
    QS = 0;
end
