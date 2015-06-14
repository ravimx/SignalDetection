function [signalColor]= findColorLab(sourceImage)
%% Initializing required Data 

sourceImage = im2double(sourceImage);
cform = makecform('srgb2lab', 'AdaptedWhitePoint', whitepoint('D65'));
I = applycform(sourceImage,cform);
signalColor='Unknown';
% figure;imshow(hsvsourceImage(:,:,1));
%% Checking Yellow Color
% Set envoirnment for yellow color

% Define thresholds for channel 1 based on histogram settings
channel1Min = 82.045;
channel1Max = 100.000;

% Define thresholds for channel 2 based on histogram settings
channel2Min = -43.624;
channel2Max = -3.291;

% Define thresholds for channel 3 based on histogram settings
channel3Min = 4.695;
channel3Max = 92.342;

% Create mask based on chosen histogram thresholds
Yellow = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
% Calculating Yellow Color Confidance 
YellowValue=mean(mean(Yellow));

%% Checking for Red Color
% Define thresholds for channel 1 based on histogram settings
% Define thresholds for channel 1 based on histogram settings
channel1Min = 0.000;
channel1Max = 99.753;

% Define thresholds for channel 2 based on histogram settings
channel2Min = 18.385;
channel2Max = 73.739;

% Define thresholds for channel 3 based on histogram settings
channel3Min = -7.585;
channel3Max = 54.810;

% Create mask based on chosen histogram thresholds
Red = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
% Calculating Red Color Confidance 
RedValue=mean(mean(Red));

%% Checking for Green Color
% Define thresholds for channel 1 based on histogram settings
channel1Min = 64.838;
channel1Max = 100.000;

% Define thresholds for channel 2 based on histogram settings
channel2Min = -50.777;
channel2Max = -2.989;

% Define thresholds for channel 3 based on histogram settings
channel3Min = -43.859;
channel3Max = 0.952;

% Create mask based on chosen histogram thresholds
Green = (I(:,:,1) >= channel1Min ) & (I(:,:,1) <= channel1Max) & ...
    (I(:,:,2) >= channel2Min ) & (I(:,:,2) <= channel2Max) & ...
    (I(:,:,3) >= channel3Min ) & (I(:,:,3) <= channel3Max);
% Calculating Green Color Confidance 
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