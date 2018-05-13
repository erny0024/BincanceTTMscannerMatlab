%% Choose TimeFrame
answer = input('Choose a timeframe. Avaible options is 1h, 2h, 4h, 6h, 8h, 12h, 1d.: ');
%% One hour data
if answer == '1h'
    OneHour = TTMalert(1);
    disp(fieldnames(OneHour));
%% Two hour data
elseif answer == '2h'
    TwoHour = TTMalert(2);
    disp(fieldnames(TwoHour));
%% Four hour data
elseif answer == '4h'
    FourHour = TTMalert(4);
    disp(fieldnames(FourHour));
%% Six hour data
elseif answer == '6h'
    SixHour = TTMalert(6);
    disp(fieldnames(SixHour));
%% Eight hour data
elseif answer == '8h'
    EightHour = TTMalert(8);
    disp(fieldnames(EightHour));
%% Twelve hour data
elseif answer == '12h'
    TwelveHour = TTMalert(12);
    disp(fieldnames(TwelveHour));
%% One day data
elseif answer == '1d'
    OneDay = TTMalert('1d');
    disp(fieldnames(OneDay));
end

    



