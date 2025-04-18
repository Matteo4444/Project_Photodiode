     close([f1 f2 f3 f4])


Thin025V = readtable("31_-025_Thin1.csv");
Thick025V = readtable("31_-025_Thick1.csv");
Custom025V = readtable("31_-025_Custom1.csv");
Thin100V = readtable("31_-100_Thin1.csv");
Thick100V = readtable("31_-100_Thick1.csv");
Custom100V = readtable("31_-100_Custom1.csv");

% Data = {Thin025V,Thick025V,Custom025V,Thin100V,Thick100V,Custom100V};
% for k=1:length(State)
% curstate=State{k};
% //now go on
% plot(curstate(1),curstate(2),'ro')
% end

%-0.25V linear plots
f1 = figure;
plot(Thin025V,"GateVoltage","DrainCurrent",'Marker','x')
grid on
hold on
plot(Thick025V,"GateVoltage","DrainCurrent",'Marker','x')
plot(Custom025V,"GateVoltage","DrainCurrent",'Marker','x');

lgd = legend('Thin','Thick','Custom');
lgd.Location = 'southeast';

hold off
ylim padded
title('-0.25V VDS')
xlabel('Gate Voltage (V)')
ylabel('Drain Current (A)')

%-1V linear plots

f2 = figure;
plot(Thin100V,"GateVoltage","DrainCurrent",'Marker','x')
grid on
hold on
plot(Thick100V,"GateVoltage","DrainCurrent",'Marker','x')
plot(Custom100V,"GateVoltage","DrainCurrent",'Marker','x');

lgd = legend('Thin','Thick','Custom');
lgd.Location = 'southeast';

hold off
ylim padded
title('-1V VDS')
xlabel('Gate Voltage (V)')
ylabel('Drain Current (A)')

%-0.25V Log plots
f3 = figure;
plot(Thin025V,"GateVoltage","DrainCurrent",'Marker','x')
grid on
hold on
plot(Thick025V,"GateVoltage","DrainCurrent",'Marker','x')
plot(Custom025V,"GateVoltage","DrainCurrent",'Marker','x');

lgd = legend('Thin','Thick','Custom');
lgd.Location = 'southeast';

hold off
set(gca, 'YScale', 'log')
ylim padded
title('-0.25V VDS')
xlabel('Gate Voltage (V)')
ylabel('Drain Current (A) Log')

%-1V Log plots

f4 = figure;
plot(Thin100V,"GateVoltage","DrainCurrent",'Marker','x')
grid on
hold on
plot(Thick100V,"GateVoltage","DrainCurrent",'Marker','x')
plot(Custom100V,"GateVoltage","DrainCurrent",'Marker','x');

lgd = legend('Thin','Thick','Custom');
lgd.Location = 'southeast';

hold off
set(gca, 'YScale', 'log')
ylim padded
title('-1V VDS')
xlabel('Gate Voltage (V)')
ylabel('Drain Current (A) Log')
