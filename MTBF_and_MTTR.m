function signal = generateMTBFSignal(MTBF, MTTR, Tsim)
    t = 0;
    time = [];
    onoff = [];

    while t < Tsim
        % UPTIME
        uptime = exprnd(MTBF);
        tend = min(t + uptime, Tsim);
        time  = [time; t; tend];
        onoff = [onoff; 1; 1];

        t = tend;
        if t >= Tsim
            break;
        end

        % DOWNTIME (repair)
        downtime = exprnd(MTTR);
        tend = min(t + downtime, Tsim);
        time  = [time; t; tend];
        onoff = [onoff; 0; 0];

        t = tend;
    end

    signal = [time, onoff];
end


% =======================
% Initialize MTBF and MTTR for EBOX and PAINTING machines
% =======================

% Simulation length
Tsim = 220 * 8 * 60;   % minutes

% Machine 1 — E-Box
MTBF_EBOX = 4200;
MTTR_EBOX = 210;

% Machine 2 — Painting
MTBF_PAINT = 6300;
MTTR_PAINT = 420;

% Generate the two on/off signals
MTBF_MTTR_EBOX  = generateMTBFSignal(MTBF_EBOX,  MTTR_EBOX,  Tsim);
MTBF_MTTR_PAINT = generateMTBFSignal(MTBF_PAINT, MTTR_PAINT, Tsim);

% Tsim is adjustable based on the time of simulation. if 6 years, Tsim*6

% Improvement EBox Machine 1:
MTBF_EBOX_smartsensors = MTBF_EBOX * 1.1;
MTTR_EBOX_smartsensors = MTTR_EBOX * 0.93;

% Generate signal to import to Simulink
MTBF_MTTR_EBOX_smartsensors = generateMTBFSignal(MTBF_EBOX_smartsensors, MTTR_EBOX_smartsensors, Tsim);

% Improvement EBox Machine 2
MTBF_EBOX_predictive = MTBF_EBOX * 1.26;
MTTR_EBOX_predictive = MTTR_EBOX * 0.91;

% Generate signal to import to Simulink
MTBF_MTTR_EBOX_predictive = generateMTBFSignal(MTBF_EBOX_predictive, MTTR_EBOX_predictive, Tsim);

% Improvement Painting Machine 1
MTBF_PAINT_smartsensors = MTBF_PAINT * 1.2;
MTTR_PAINT_smartsensors = MTTR_PAINT * 0.95;

% Generate signal to import to Simulink
MTBF_MTTR_PAINT_smartsensors = generateMTBFSignal(MTBF_PAINT_smartsensors, MTTR_PAINT_smartsensors, Tsim);

% Improvement Painting Machine 2

MTBF_PAINT_predictive = MTBF_PAINT * 1.3;
MTTR_PAINT_predictive = MTTR_PAINT * 0.85;

% Generate signal to import to Simulink
MTBF_MTTR_PAINT_predictive = generateMTBFSignal(MTBF_PAINT_predictive, MTTR_PAINT_predictive, Tsim);