% Sub 11000
function [] = CalcCDRTempVsTimeForStepCurrent()

    if (NSELECT == 4)
        %printf
    end
    
    FLAG = 0;
    ATCDR(1) = TCDRPRELOAD;
    % GOSUB 15000
    CalcThermalRatingGivenTCDRCondParamsWeatcond();
    K = 1;
    ATCDR(K+1) = TCDR + (W4 ^2 * XISTEP ^2 + QS - QR - QC) ...
        * DELTIME / HEATCAP;
    TIME(K+1) = TIME(K) + DELTIME;
    TCDR = ATCDR(K+1);
    
    if (NSELECT == 4)
        %GOTO 11130
    else
        %printf
    end
    
    if ((NSELECT == 3) && (TCDR > TCDRMAX))
        % GOTO 11280
    else
        % GOSUB 15000
        CalcThermalRatingGivenTCDRCondParamsWeatcond();
        K = K + 1;
        if (K == 3000)
            %printf
            % GOTO 1880???
            return;
        end
        
        if (TIME(K) < TT)
            % 11090
        end
        
        if ((XISTEP == 0) && (TCDR > TCDRMAX))
            % 11220
            %printf
            % printf
            % GOTO 1880
        else
            % 11250
            % Check for short duration faults
            if ((TIME(K) >= 60) || (FLAG == 1) || (HEATCORE == 0) || ...
                    (TT < 60))
                %GOTO 11320
                KTIMEMAX = K;
            end
        end
end