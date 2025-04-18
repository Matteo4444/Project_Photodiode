sheets = sheetnames('4-pt-resistivity-sweep.xls');

opts = detectImportOptions('4-pt-resistivity-sweep.xls');


y=0;
f3 = figure;

grid on
hold on
xlim([-1 1])
LegendList = ["I dont know how matlab work"];
resistancesshort = [1]; %i still dont know how matlab works
resistanceslong = [1]; %i still dont know how matlab works
for x = 1:length(sheets)
    sheetname = strsplit(sheets(x),'_');
    if sheetname(1) == "Diffusion"
     % "Diffusion","GreekCross"
    if regexp(sheetname(2),'[SL][12345678]')
    % '[SL][12345678]' 
 
    
    % "R","L"
    y = y+1;
    % opts = detectImportOptions(Sheet, sheets(x));
    opts.Sheet = sheets(x);
    sheet = readtable("4-pt-resistivity-sweep.xls",opts);
    voltage = sheet.SMU4voltage-sheet.SMU3voltage;
    current = sheet.Current;
    plotvar = plot(voltage,current,'.');
    c = plotvar.Color;
    LegendList(end+1) = '';
    LegendList(end+1) = string(sheetname(2));
    
    Indice = find(sheet.Voltage == 0,1);
    % voltage(Indice(1)) = [];
    % current(Indice(1)) = [];
    p = polyfit(voltage,current,1);

    plot(voltage,polyval(p,voltage),'-','Color',c)
    if regexp(sheetname(2),'[S][12345678]')
        sheetname(2)
        'Leakage Current'
        sum(abs(sheet.Current+sheet.I2))
        'resistance'
        resistancesshort(end+1) = 1/p(1);
    elseif regexp(sheetname(2),'[L][12345678]')
        sheetname(2)
        'Leakage Current'
        sum(abs(sheet.Current+sheet.I2))
        'resistance'
        resistanceslong(end+1) = 1/p(1);



    end
    end
    end
end
LegendList(1) = [];
resistanceslong(1) = [];
resistancesshort(1) = [];
lgd = legend(LegendList);
lgd.Location = 'northwest';


hold off
xlim auto
ylim padded
title('Current Voltage relationship of diffusion area with different lengths')
xlabel('Voltage (V)')
ylabel('Current (A)')


L1 = 200E-6;
L2 = 2000E-6;
c = L1/L2; %0.1
B = 60E-6;
Rc = (c * resistanceslong - resistancesshort)/(2 * (c - 1) );
Rs = (B/(L2 * (c - 1))) * (resistancesshort - resistanceslong);
f4 = figure;
bar(Rc)
title('R_c')
ylim padded
xlabel('Measurements')
ylabel('Resistance (Ω)')

f5 = figure;
bar(Rs)
title('R_□')
ylim padded
xlabel('Measurements')
ylabel('Resistance (Ω)')

% f6 = figure;
% hold on
% 
% bar(resistanceslong)
% hold off
% title('R_□')
% ylim padded
% ylabel('Measurements')
% xlabel('Resistance (Ω)')
% least Square, Leakage current, resistance


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
