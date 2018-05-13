%% One hour TTM data ( was from beginning supposed to be for only one hour chart but added some if statements for the other timeframes aswell) 
function [One] = TTMonehr(TimeFrame)
%% Assign values
url = 'https://api.binance.com/api/v1/klines';
strsymbols = load('BinanceSymbols.mat');
symbols3 = strsymbols.BinanceSymbols;
if TimeFrame == 1
    interval = '1h';
elseif TimeFrame == 2
    interval = '2h';
elseif TimeFrame == 4
    interval = '4h';
elseif TimeFrame == 6
    interval = '6h';
elseif TimeFrame == 8
    interval = '8h';
elseif TimeFrame == 12
    interval = '12h';
elseif TimeFrame == '1d'
    interval = '1d';
end
    


for i = 1:length(symbols3)
    One.(symbols3{i}) = [];
end

%% Call Binance and collect data
for i = 1:length(symbols3)
   One.(symbols3{i}) = webread(url,'symbol',symbols3{i},'interval',interval,'limit',50); 
end
%% Structure the data
vals = {'Open','Close','High','Low','Time'};


data2 = struct;

for i = 1:length(symbols3)
    for k = 1:50
        data2.(symbols3{i}).Open{k,1} = One.(symbols3{i}){k,1}{2,1};
        data2.(symbols3{i}).Close{k,1} = One.(symbols3{i}){k,1}{5,1};
        data2.(symbols3{i}).High{k,1} = One.(symbols3{i}){k,1}{3,1};
        data2.(symbols3{i}).Low{k,1} = One.(symbols3{i}){k,1}{4,1};
        data2.(symbols3{i}).Time{k,1} = One.(symbols3{i}){k,1}{1,1};
    end
end


%vals = {'Open','Close','High','Low','Time'};
for i = 1:length(symbols3)
    One.(symbols3{i}) = struct2table(data2.(symbols3{i}));
end
%%

for i = 1:length(symbols3)
    One.(symbols3{i}).Open = str2double(One.(symbols3{i}).Open);
    One.(symbols3{i}).Close = str2double(One.(symbols3{i}).Close);
    One.(symbols3{i}).High = str2double(One.(symbols3{i}).High);
    One.(symbols3{i}).Low = str2double(One.(symbols3{i}).Low);
    One.(symbols3{i}).Time = cell2mat(One.(symbols3{i}).Time);
end
%%
for i = 1:length(symbols3)
    One.(symbols3{i}).Time = One.(symbols3{i}).Time./1000;
    One.(symbols3{i}).Time = datetime(One.(symbols3{i}).Time,'convertfrom','posixtime');
end
%%
for i = 1:length(symbols3)
    One.(symbols3{i}) = table2timetable(One.(symbols3{i}));
end
end





