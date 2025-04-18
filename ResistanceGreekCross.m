sheets = sheetnames('4-pt-resistivity-sweep.xls');

opts = detectImportOptions('4-pt-resistivity-sweep.xls');


y=0;
f3 = figure;

grid on
hold on
xlim([-1 1])
LegendList = ["I dont know how matlab work"];
resistances = [0];
for x = 1:length(sheets)
    sheetname = strsplit(sheets(x),'_');
    if sheetname(1) == "GreekCross"
     % "Diffusion","GreekCross"
    if regexp(sheetname(2),'[12345678]')
    % '[12345678]' 
 
    
    % "R","L"
    y = y+1;
    % opts = detectImportOptions(Sheet, sheets(x));
    opts.Sheet = sheets(x);
    sheet = readtable("4-pt-resistivity-sweep.xls",opts);
    
    LegendList(end+1) = string(sheetname(2));
    [minimu,index] = min(abs(sheet.I2-0.0001));
    resistances(end+1) = -(pi/log(2)) .* (sheet.SMU4voltage(index)-sheet.SMU3voltage(index))./(sheet.I2(index));
    end
    end
end
LegendList(1) = [];
resistances(1)= [];
lgd = legend(LegendList);
lgd.Location = 'northwest';


hold off
ylim padded
title('Current Voltage relationship of greek cross')
xlabel('Anode Voltage (V)')
ylabel('Anode Current (A)')


f5 = figure;
bar(resistances)
title('R_□')
ylim padded
xlabel('Measurements')
ylabel('Resistance (Ω)')


% 
% sheets2 = convertStringsToChars(sheets);
% sheets3 = convertStringsToChars(sheets2);
% % expression = 'B_.*L+t[015]*_[RL]+[0123456789]*'; 
% expression = '.*'; 
% startIndexSheet = regexp(sheets,expression)
% 
% str = 'bat cat can car coat court CUT ct CAT-scan';
% expression = 'c[aeiou]+t';
% startIndex = regexp(str,expression)
