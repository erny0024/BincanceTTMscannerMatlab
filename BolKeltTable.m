function [bktable] = BolKeltTable(TimeFrame)
%% YESS
if TimeFrame == 1
    tt = TTMonehr(1);
elseif TimeFrame == 2
    tt = TTMonehr(2);
elseif TimeFrame == 4
    tt = TTMonehr(4);
elseif TimeFrame == 6
    tt = TTMonehr(6);
elseif TimeFrame == 8
    tt = TTMonehr(8);
elseif TimeFrame == 12
    tt = TTMonehr(12);
elseif TimeFrame == '1d'
    tt = TTMonehr('1d');
end
 %%
 bollstr = struct;
 
 symbols = fieldnames(tt);
 for i = 1:length(fieldnames(tt))
     [bollstr.(symbols{i}).middle, bollstr.(symbols{i}).upper,bollstr.(symbols{i}).lower] = bollinger(tt.(symbols{i}).Close);
 end
 %[middle,upper,lower] = indicators([hi,lo,cl]      ,'keltner',emaper,atrmul,atrper)
 keltner = struct;
 for i = 1:length(fieldnames(tt))
     keltner.(symbols{i}) = indicators([tt.(symbols{i}).High,tt.(symbols{i}).Low,tt.(symbols{i}).Close], 'keltner', 20,1,10);
 end
 %%
 bkstr = struct;
 for i = 1:length(fieldnames(tt))
    bkstr.(symbols{i}).upper = bollstr.(symbols{i}).upper;
    bkstr.(symbols{i}).lower = bollstr.(symbols{i}).lower; 
    bkstr.(symbols{i}).upperK = keltner.(symbols{i})(:,2);
    bkstr.(symbols{i}).lowerK = keltner.(symbols{i})(:,3);
    bkstr.(symbols{i}).time = tt.(symbols{i}).Time;
 end
 %%
 bktable = struct;
 for i = 1:length(symbols)
    bktable.(symbols{i}) = struct2table(bkstr.(symbols{i}));
 end
 %%
 %for i = 1:length(symbols)
     %bktable.(symbols{i}) = rmmissing(bktable.(symbols{i}));
 %end
 %%
 for i = 1:length(symbols)
     bktable.(symbols{i}) = table2timetable(bktable.(symbols{i}));
 end
 
end

 