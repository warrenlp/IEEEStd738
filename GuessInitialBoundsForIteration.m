% Sub 14000
% GuessInitialBoundsForIteration
DIV = 10.0;
if (NFLAG == 0)
    XLO = TAMB;
    XHI = 1000.0;
elseif (NFLAG == 1)
    XLO = 0.0;
    XHI = 10*AT;
end

CHA = (XHI - XLO) / DIV;
NUM = DIV;
X = XLO;

% 14060 GOSUB 12000
IterateToFindCondTempGivenCurrent();

FO = TEMP;

jump = false;
for JK =1:NUM
    X = XLO + JK * CHA;
    % 14090 GOSUB 12000
    IterateToFindCondTempGivenCurrent();
    FF = TEMP;
    if ((sign(FF) + sign(FO)) == 0)
        jump = true;
        break;
    end
    FO = FF; 
end

if (jump)
    XRI = X;
    XLI = X - CHA;
else
    XLI = XLO;
    XRI = XHI;
end
