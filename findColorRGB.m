function [signalColor, Value]= findColorRGB(sourceImage)

% hsvsourceImage=rgb2hsv(sourceImage);
signalColor='Unknown';
Value=0;
% figure;imshow(hsvsourceImage(:,:,1));
%% Checking Yellow Color
% Set envoirnment for yellow color
% I = rgb2hsv(sourceImage);
I = sourceImage;

% Define thresholds for channel 1 based on histogram settings
channel1Min = 200.00;
channel1Max = 255.00;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 150.00;
channel2Max = 255.00;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.000;
channel3Max = 80.000;



%% Create mask based on chosen histogram thresholds
Yellow = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
YellowValue=mean(mean(Yellow));
%% Checking for Red Color

channel1Min = 120.000;
channel1Max = 255.000;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.000;
channel2Max = 150.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.000;
channel3Max = 100.000;

% Create mask based on chosen histogram thresholds
Red = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);


RedValue=mean(mean(Red));

%% Checking for Green Color
% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.00;
channel1Max = 151.00;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 50.00;
channel2Max = 255.00;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.000;
channel3Max = 200.00;

% Create mask based on chosen histogram thresholds
Green = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
GreenValue=mean(mean(Green));
%% Checking for Black Color
% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.00;
channel1Max = 70.00;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.00;
channel2Max = 70.00;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.000;
channel3Max = 70.00;

% Create mask based on chosen histogram thresholds
Black = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
BlackValue=mean(mean(Black));

[Value, Index]=max([RedValue, GreenValue, YellowValue, BlackValue]);

switch Index
    case 1
        if RedValue >0.5
            signalColor='Red';
        end
    case 2
        if GreenValue>0.5
            signalColor='Green';
        end
    case 3
        if YellowValue > 0.5
            signalColor='Yellow';
        end
    case 4
        if BlackValue > 0.5
            signalColor='Black';
        end
    otherwise
        signalColor='Unknown';
end

end