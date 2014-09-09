% Sub 8000

fileID = fopen(FILENAME);

NSELECT = cell2mat(textscan(fgets(fileID), '%d %*s'))

switch NSELECT
    case 1
        XIPRELOAD = cell2mat(textscan(fgets(fileID), '%d %*s'))
    case 2
        TCDRPRELOAD = cell2mat(textscan(fgets(fileID), '%f %*s'))
    case {3,4}
        IORTPRELOAD = cell2mat(textscan(fgets(fileID), '%d %*s'))
        if (IORTPRELOAD == 1)
            XIPRELOAD = cell2mat(textscan(fgets(fileID), '%d %*s'))
        elseif (IORTPRELOAD == 2)
            TCDRPRELOAD = cell2mat(textscan(fgets(fileID), '%d %*s'))
        end
        
        if (NSELECT == 4)
            TCDRMAX = cell2mat(textscan(fgets(fileID), '%d %*s'))
        else
            TCDRMAX = 1000
        end
        
        if (NSELECT == 3)
            XISTEP = cell2mat(textscan(fgets(fileID), '%d %*s'))
        end
        
        SORM = cell2mat(textscan(fgets(fileID), '%d %*s'))
        TT = cell2mat(textscan(fgets(fileID), '%d %*s'))
        DELTIME = cell2mat(textscan(fgets(fileID), '%d %*s'))
        
        if (SORM ==1)
            TT = TT * 60;
        end
end

% Weather Data
TAMB = cell2mat(textscan(fgets(fileID), '%d %*s'))
VWIND = cell2mat(textscan(fgets(fileID), '%f %*s'))
WIND_ANG = cell2mat(textscan(fgets(fileID), '%f %*s'))

% Conductor Data
CONDSTR = textscan(fgets(fileID), '%s')
D = cell2mat(textscan(fgets(fileID), '%f %*s'))
C = cell2mat(textscan(fgets(fileID), '%f %f %*s'))
TLO = C(1,1)
THI = C(1,2)
C = cell2mat(textscan(fgets(fileID), '%f %f %*s'))
RLO = C(1,1) / 1000
RHI = C(1,2) / 1000

% Conductor data specific to Transient Calcs
if ((NSELECT == 3) || (NSELECT == 4))
    HNH = cell2mat(textscan(fgets(fileID), '%d %*s'))
    if (HNH == 1)
        HEATOUT = cell2mat(textscan(fgets(fileID), '%f %*s'))
        HEATCORE = 0
    elseif (HNH == 2)
        C = cell2mat(textscan(fgets(fileID), '%f %f %*s'))
        HEATOUT = C(1,1)
        HEATCORE = C(1,2)
    end
    HEATCAP = HEATOUT + HEATCORE
end

% Solar Heating Data
C = cell2mat(textscan(fgets(fileID), '%f %f %*s'))
EMISS = C(1,1)
ABSORP = C(1,2)
CDR_ELEV = cell2mat(textscan(fgets(fileID), '%f %*s'))
Z1_DEG = cell2mat(textscan(fgets(fileID), '%f %*s'))

% Specify Latitude and Sun Time
CDR_LAT_DEG = cell2mat(textscan(fgets(fileID), '%f %*s'))
C = textscan(fgets(fileID), '%f %d %*s')
SUN_TIME = cell2mat(C(1,1))
NDAY = cell2mat(C(1,2))
C = textscan(fgets(fileID), '%f %s %*s')
A3 = cell2mat(C(1,1))
B = C(1,2);
BSTR = B{1}

fclose(fileID);
