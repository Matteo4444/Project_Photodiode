sheets = sheetnames('MeasuredIV.xls');

opts = detectImportOptions('MeasuredIV.xls');


y=0;
f3 = figure;

grid on
hold on
xlim([-1 1])
LegendList = ["I dont know how matlab work"];
disc= [0];
data = {};
mlist=[];
numbers = [0];
ISClist = [0];
VOClist = [0];
PMAXlist = [0];
CFlist = [0];
names = ["names"];

for x = 1:length(sheets)
    sheetname = strsplit(sheets(x),'_');
    if ismember(sheetname(1), ["NOTHING","S","B"])
     % "S","B"
    if ismember(sheetname(2), ["L50","L100"])
    % "NL","L50","L100"
 
    if regexp(sheetname(3),'[RL][0123456789]+')
    % "R","L"    '[L][01][01]'
    y = y+1;
    % opts = detectImportOptions(Sheet, sheets(x));
    opts.Sheet = sheets(x);
    sheet = readtable("MeasuredIV.xls",opts);




    [minimu,index] = min(abs(sheet.AnodeV));
    ISC = sheet.AnodeI(index);
    [minimu,index] = min(abs(sheet.AnodeI));
    VOC = sheet.AnodeV(index);
    PMAX = -min(sheet.AnodeI.*sheet.AnodeV);
    CF = -PMAX/(VOC*ISC);
    name = strcat(sheetname(2)," ",sheetname(1)," ",sheetname(3));
    names(end+1) = strcat(sheetname(2)," ",sheetname(1)," ",sheetname(3));
    ISClist(end+1) = ISC;
    VOClist(end+1) = VOC;
    PMAXlist(end+1) = PMAX;
    CFlist(end+1) = CF;
    plot(sheet.AnodeV,sheet.AnodeI)

    [minimu,index] = min(abs(sheet.AnodeV+1));
    sheet.AnodeI = sheet.AnodeI - sheet.AnodeI(index);
    sheet.AnodeI = log(abs(sheet.AnodeI));
    % discrete derivative
    disc= [0];
    for x2 = 1:length(sheet.AnodeI)-1
        disc(end+1) = (sheet.AnodeV(x2)-sheet.AnodeV(x2+1))/(sheet.AnodeI(x2)-sheet.AnodeI(x2+1));
        
    end
    disc(1) = [];
    plot(disc)
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
    % Rs
    Offset = 0;
    OffsetIr = 1;
    if sheetname(1) == 'B'
        Offset = Offset + 10;
        OffsetIr = OffsetIr+2;
    end
    if extract(sheetname(3),1) == 'R'
        Offset = Offset + 12;
        
        OffsetIr = OffsetIr+1;
    end
    Offset = Offset + str2num(extractAfter(sheetname(3),1));
    if sheetname(2) == "NL"
        yOffset = 1;
    elseif sheetname(2) == "L50"
        yOffset = 2;
    elseif sheetname(2) == "L100"
        yOffset = 3;
    end
    data{yOffset,Offset} = sheet;
    % [~,index] = min(abs(sheet.AnodeV--1));
    VT = 1.380649E-23 * 293/(1.602176634E-19); % at 293K 20C
    m = disc(58)/(VT);
   

    numbers(str2num(extractAfter(sheetname(3),1))) = sheetname(3);
    mlist(str2num(extractAfter(sheetname(3),1)),OffsetIr) = m;
   
    
    


    LegendList(end+1) = string(strcat(sheetname(1)," ",sheetname(2)," ",sheetname(3)));
    end
    end
    end
end
LegendList(1) = [];
lgd = legend(LegendList);
lgd.Location = 'northwest';

mTable = table(transpose(numbers),mlist(1:10,3),mlist(1:10,1),mlist(1:10,2),mlist(1:10,4))





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
