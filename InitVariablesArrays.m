% Initialize Variables and Arrays
    ATCDR = zeros(1,1000);
    TIME = zeros(1,1000);
    FLAG1 = 0;
    XIDUMMY = 0;
    XIPRELOAD = 0;
    XISTEP = 0;
    TCDR = 0;
    TCDRPRELOAD = 0;
    DELTIME = 0;
    FS1 = 0;
    FS2 = 0;
    FS3 = 0;
    % TODO: XSTR = 
    NFLAG = 0;
    PIANG = pi / 180;
    DEBUG = 0;
    
    % Uncomment input filename you wish to process
    FILENAME = 'SSCondTemp.txt'; % NSELECT=1
    %FILENAME = 'SSThermRatingCalc.txt'; % NSELECT=2
    %FILENAME = 'NumCalcTransientCondTemp.txt'; % NSELECT=3
    %FILENAME = 'NumCalcTransientCondThermRating.txt'; % NSELECT=3