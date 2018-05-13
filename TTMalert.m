function [TTM] = TTMalert(TimeFrame)
%%
if TimeFrame == 1
    tt = BolKeltTable(1);
elseif TimeFrame == 2
    tt = BolKeltTable(2);
elseif TimeFrame == 4
    tt = BolKeltTable(4);
elseif TimeFrame == 6
    tt = BolKeltTable(6);
elseif TimeFrame == 8
    tt = BolKeltTable(8);
elseif TimeFrame == 12
    tt = BolKeltTable(12);
elseif TimeFrame == '1d'
    tt = BolKeltTable('1d');
end
 %%
 
TTM = struct;
symbols = fieldnames(tt);
for i = 1:length(symbols)
    if tt.(symbols{i}).upper(end) < tt.(symbols{i}).upperK(end) || tt.(symbols{i}).lower(end) > tt.(symbols{i}).lowerK(end)
        TTM.(symbols{i}).TTMs = tt.(symbols{i});
    end
end

     
     
 
 