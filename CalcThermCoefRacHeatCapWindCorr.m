% 9000
% Sub to Calculate Therm Coef of Rac & Heatcap & Wind Corr

% Setup Linear Conductor Resistance Eq as Func of Temp
B = (RHI - RLO) / (THI - TLO);
B1 = RLO - B * TLO;

% Setup linear Heat Capacity Eqs as Function of Temp
% Corr Factor (YC) for Non-perpendicular Wind
WINDANG_RAD = pi / 2 - WINDANG_DEG * PIANG;
YC = 1.194 - sin(WINDANG_RAD) - .194 * cos(2 * WINDANG_RAD) + .368 ...
    * sin(2 * WINDANG_RAD);
