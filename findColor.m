function [signalColor]= findColor(sourceImage)

% hsvsourceImage=rgb2hsv(sourceImage);
signalColor='Unknown';
% figure;imshow(hsvsourceImage(:,:,1));
%% Checking Yellow Color
% Set envoirnment for yellow color
% I = rgb2hsv(sourceImage);
I = rgb2hsv(sourceImage);

% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.126;
channel1Max = 0.200;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.622;
channel2Max = 1.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.000;
channel3Max = 1.000;



%% Create mask based on chosen histogram thresholds
Yellow = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
YellowValue=mean(mean(Yellow));
%% Checking for Red Color

% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.942;
channel1Max = 0.998;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.511;
channel2Max = 1.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.000;
channel3Max = 1.000;

% Create mask based on chosen histogram thresholds
Red = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);


RedValue=mean(mean(Red));

%% Checking for Green Color
% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.282;
channel1Max = 0.514;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 0.296;
channel2Max = 1.000;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 0.000;
channel3Max = 1.000;

% Create mask based on chosen histogram thresholds
Green = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
GreenValue=mean(mean(Green));

[~, Index]=max([RedValue, GreenValue, YellowValue]);

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
    otherwise
        signalColor='Unknown';
end

end