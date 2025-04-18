sheets = sheetnames('Diode2.xls');

opts = detectImportOptions('Diode2.xls');


y=0;
f3 = figure;

grid on
hold on
xlim([-1 1])
LegendList = ["I dont know how matlab work"];
disc= [0];
data = {};
Irlist=[];
numbers = [];
for x = 1:length(sheets)
    sheetname = strsplit(sheets(x),'_');
    if ismember(sheetname(1), ["NOTHING","S","B"])
     % "S","B"
    if sheetname(2) == "BD"
    % "NL","L50","L100"
 
    if regexp(sheetname(3),'[RL][0123456789]+')
    % "R","L"    '[L][01][01]'
    y = y+1;
    % opts = detectImportOptions(Sheet, sheets(x));
    opts.Sheet = sheets(x);
    sheet = readtable("Diode2.xls",opts);
    [minimu,index] = min(abs(sheet.AnodeV+1));
    % sheet.AnodeI = sheet.AnodeI - sheet.AnodeI(index);
    % sheet.AnodeI = log(abs(sheet.AnodeI));
    % discrete derivative
    for x2 = 1:length(sheet.AnodeI)-1
        disc(end+1) = (sheet.AnodeV(x2)-sheet.AnodeV(x2+1))/(sheet.AnodeI(x2)-sheet.AnodeI(x2+1));
    end
    disc(1) = [];
    plot(sheet.AnodeV,sheet.AnodeI)
    % ylim([0 8.0221e+08])
    

    % sheet.AnodeI = (sheet.AnodeI-sheet.AnodeI(index));
    % plot(sheet.AnodeV,sheet.AnodeI);
    % xlim([-1 1])


    % line of Rp
    % [minimu,index2] = min(abs(sheet.AnodeV+0.8));
    % [minimu,index3] = min(abs(sheet.AnodeV+0.4));
    % plot([2*sheet.AnodeV(index2)-sheet.AnodeV(index3) sheet.AnodeV(index2) sheet.AnodeV(index3) 3*sheet.AnodeV(index3)-2*sheet.AnodeV(index2)],[2*sheet.AnodeI(index2)-sheet.AnodeI(index3) sheet.AnodeI(index2) sheet.AnodeI(index3) 3*sheet.AnodeI(index3)-2*sheet.AnodeI(index2)],'r-x')
    % 'resistance'
    % (sheet.AnodeV(index2)-sheet.AnodeV(index3))/(sheet.AnodeI(index2)-sheet.AnodeI(index3))

   


    LegendList(end+1) = string(strcat(sheetname(1)," ",sheetname(2)," ",sheetname(3)));
    end
    end
    end
end
LegendList(1) = [];
lgd = legend(LegendList);
lgd.Location = 'northwest';






lgd = legend(LegendList);
lgd.Location = 'northwest';
hold off
% set(gca, 'YScale', 'log')
% ylim([-4.5E-5 1.5E-5])
% xlim([-1 0.4])
ylim padded
title('IV curves of diodes at different illumination')
xlabel('Anode Voltage (V)')
ylabel('Anode Current (A) Log')
