     % close([f1 f2 f3 f4])


Thin0_1S = readtable("34_S-1_Thin1.csv");
Thick0_1S = readtable("34_S-1_Thick1.csv");
Custom0_1S = readtable("34_S-1_Custom1.csv");

Thin1S = readtable("34_S+1_Thin1.csv");
Thick1S = readtable("34_S+1_Thick1.csv");
Custom1S = readtable("34_S+1_Custom1.csv");

Thin3S = readtable("34_S+3_Thin1.csv");
Thick3S = readtable("34_S+3_Thick1.csv");
Custom3S = readtable("34_S+3_Custom1.csv");

Thin5S = readtable("34_S+5_Thin1.csv");
Thick5S = readtable("34_S+5_Thick1.csv");
Custom5S = readtable("34_S+5_Custom1.csv");

Thin100V = readtable("31_-100_Thin1.csv");
Thick100V = readtable("31_-100_Thick1.csv");
Custom100V = readtable("31_-100_Custom1.csv");

% Data = {Thin025V,Thick025V,Custom025V,Thin100V,Thick100V,Custom100V};
% for k=1:length(State)
% curstate=State{k};
% //now go on
% plot(curstate(1),curstate(2),'ro')
% end

%Thin
f1 = figure;
% plot(Thin0_1S,"GateVoltage","DrainCurrent",'Marker','x')
grid on
hold on
plot(Thin100V,"GateVoltage","DrainCurrent",'Marker','x')
plot(Thin1S,"GateVoltage","DrainCurrent",'Marker','x');
plot(Thin3S,"GateVoltage","DrainCurrent",'Marker','x');
plot(Thin5S,"GateVoltage","DrainCurrent",'Marker','x');

lgd = legend('0V','+1V','+3V','+5V');
lgd.Location = 'east';


hold off
ylim padded
title('Thin diode with different substrate voltages')
xlabel('Gate Voltage (V)')
ylabel('Drain Current (A)')

%Thick

f2 = figure;
% plot(Thick0_1S,"GateVoltage","DrainCurrent",'Marker','x')
grid on
hold on
plot(Thick100V,"GateVoltage","DrainCurrent",'Marker','x')
plot(Thick1S,"GateVoltage","DrainCurrent",'Marker','x');
plot(Thick3S,"GateVoltage","DrainCurrent",'Marker','x');
plot(Thick5S,"GateVoltage","DrainCurrent",'Marker','x');

lgd = legend('0V','+1V','+3V','+5V');
lgd.Location = 'east';


hold off
ylim padded
title('Thick diode with different substrate voltages')
xlabel('Gate Voltage (V)')
ylabel('Drain Current (A)')

%Custom
f3 = figure;
% plot(Custom0_1S,"GateVoltage","DrainCurrent",'Marker','x')
grid on
hold on
plot(Custom100V,"GateVoltage","DrainCurrent",'Marker','x')
plot(Custom1S,"GateVoltage","DrainCurrent",'Marker','x');
plot(Custom3S,"GateVoltage","DrainCurrent",'Marker','x');
plot(Custom5S,"GateVoltage","DrainCurrent",'Marker','x');

lgd = legend('0V','+1V','+3V','+5V');
lgd.Location = 'east';


hold off
ylim padded
title('Custom diode with different substrate voltages')
xlabel('Gate Voltage (V)')
ylabel('Drain Current (A)')

