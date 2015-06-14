close all;clear;clc
%% Taiking Inputes from Source.
% Preparing the Inputs
% path='C:\Users\Dell\Documents\MATLAB\Signal detection\data\';
% imgNo=1;
% extension='.png';
% f=imread('C:\Users\Dell\Documents\MATLAB\Signal detection\data\2.png');
%  image_folder = 'C:\Users\Dell\Documents\MATLAB\Signal detection\Lara3D_UrbanSeq1_JPG'; %  Enter name of folder from which you want to upload pictures with full path
% image_folder = 'C:\Users\Dell\Documents\MATLAB\Signal detection\data'; %  Enter name of folder from which you want to upload pictures with full path
image_folder = 'C:\Users\Dell\Documents\MATLAB\Signal detection\SmallTestImages'; %  Enter name of folder from which you want to upload pictures with full path
% image_folder = 'C:\Users\Dell\Documents\MATLAB\Signal detection\TestThreshold'; %  Enter name of folder from which you want to upload pictures with full path
filenames = dir(fullfile(image_folder, '*.jpg'));  % read all images with specified extention, its jpg in our case
total_images = numel(filenames);    % count total number of photos present in that folder

%% Set the Number of fremes
% total_images=257;
initial=1;
redcount=0;
grecount=0;
yellcount=0;
j=1;

%% Breaking from above testing
% setting different Threshold, for Red, Green and Yellow color
RedThre=[255, 0 , 0];
GreenThre=[0, 230 , 180];
YellowThre=[230, 230 , 0];
detectionFrames=char(1,total_images-initial);
%% Detecting circles
for i = initial:total_images
    % Taking Inputs from specified path
    %     f=imread(strcat(path,int2str(i),extension));
    full_name= fullfile(image_folder, filenames(i).name);         % it will specify images names with full path and extension
    f = imread(full_name);
    %   for every frame find total number of circles in frame
    %   Using Step 5 of Signal Detection Algorithm
    %   this function returns center coordinates and redius of detectd circles
    sliceRedImage=colorseg('euclidean',f,150,RedThre);
    sliceGreenImage=colorseg('euclidean',f,150,GreenThre);
    sliceYellowImage=colorseg('euclidean',f,150,YellowThre);
    [xcRed, rediusRed, Redmetric]=imfindcircles(sliceRedImage,[1 8]);
    [xcGreen, rediusGreen, Greenmetric]=imfindcircles(sliceGreenImage,[1 8]);
    [xcYellow, rediusYellow, Yellowmetric]=imfindcircles(sliceYellowImage,[1 9]);
    
    
    %   Finding Total number Bulbs Detected
    [RedCount, ~]=size(xcRed);
    [GreenCount, ~]=size(xcGreen);
    [YellowCount, ~]=size(xcYellow);
%         pause(0.001);
    %%   Checking The Bulb confidance
    %     BulbColorConfidance is used here followed by BlackBoxConfidance is used
    %     if RedCount ~=0
    %         [RedcenterCoordinates, Redredius, RedsignalColor]=showAllCricles(f,xcRed,rediusRed);
    %     end
    %     if GreenCount ~=0
    %         [GreencenterCoordinates, Greenredius, GreensignalColor]=showAllCricles(f,xcGreen,rediusGreen);
    %     end
    %     if YellowCount ~=0
    %         [YellowcenterCoordinates, Yellowredius, YellowsignalColor]=showAllCricles(f,xcYellow,rediusYellow);
    %     end
    % %   Checking the BlackBoxConfidane
    %     if RedCount ~=0
    %         [Redxcfinal, Redrediusfinal, RedsignalColorfinal]=BlackBoxConfidance(f, RedcenterCoordinates, Redredius, RedsignalColor);
    %     end
    %     if GreenCount ~=0
    %         [Greenxcfinal, Greenrediusfinal, GreensignalColorfinal]=BlackBoxConfidance(f, GreencenterCoordinates, Greenredius, GreensignalColor);
    %     end
    %     if YellowCount ~=0
    %         [Yellowxcfinal, Yellowrediusfinal, YellowsignalColorfinal]=BlackBoxConfidance(f, YellowcenterCoordinates, Yellowredius, YellowsignalColor);
    %     end
    
    %% Checking Metric
    RedCount=size(find(Redmetric>0));
    GreenCount=size(find(Greenmetric>0));
    YellowCount=size(find(Yellowmetric>0));
    
    %%  Flat BlackBoxConfidance is used
    %   BlackBoxConfidanceFlat function is used
    %   Checking the BlackBoxConfidane
    
    if RedCount ~= 0
        [Redxcfinal, Redrediusfinal,RedBulbMetric, RedBMetric]=BlackBoxConfidanceFlat(f, xcRed, rediusRed,Redmetric,'Red');
    end
    if GreenCount ~= 0
        [Greenxcfinal, Greenrediusfinal, GreenBulbMetric,GreenBMetric]=BlackBoxConfidanceFlat(f, xcGreen, rediusGreen,Greenmetric,'Green');
    end
    if YellowCount ~= 0
        [Yellowxcfinal, Yellowrediusfinal, YellowBulbMetric,YellowBMetric]=BlackBoxConfidanceFlat(f, xcYellow, rediusYellow,Yellowmetric,'Yellow');
    end
    
    %% Checking Metric
    RedCount=size(find(RedBMetric>0));
    GreenCount=size(find(GreenBMetric>0));
    YellowCount=size(find(YellowBMetric>0));
    %
    
    %         redius11_trimed=redius11(find(redius11(:,1)>0));
    %         signalColor_trimed=signalColor(find(~cellfun(@isempty,signalColor)));
    
    %     RedDetectionConfidace=Redmetric * RedBMetric;
    %     GreenDetectionConfidace=Greenmetric *GreenBMetric;
    %     YellowDetectionConfidace=Yellowmetric*YellowBMetric;
    
    % Testing for the first value j is declared on top declaretion box 
    [DTConfidance,index]=max([(RedBulbMetric(j)*RedBMetric(j)),(GreenBulbMetric(j)*GreenBMetric(j)), (YellowBulbMetric(j)*YellowBMetric(j))]);
    
    switch index
        case 1
            redcount=redcount+1;
            detectionFrames(i)='R';
        case 2
            grecount=grecount+1;
            detectionFrames(i)='G';
        case 3
            yellcount=yellcount+1;
            detectionFrames(i)='Y';
    end
    
    pause(0.01);
    %% Hiding This
    % To find Total Red/Green/Yellow bojects Detected
        subplot(1,3,1);
        imshow(f);
        if RedCount ~= 0 %&& Redmetric(1) > 0.3
            viscircles(Redxcfinal(j,:), Redrediusfinal(j));
%             redcount=redcount+1;
        end
        subplot(1,3,2);
        imshow(f);
        if GreenCount ~= 0 %&& Greenmetric(1) > 0.3
            viscircles(Greenxcfinal(j,:), Greenrediusfinal(j));
%             grecount=grecount+1;
        end
        subplot(1,3,3);
        imshow(f);
        if YellowCount ~=0 %&& Yellowmetric(1) > 0.3
            viscircles(Yellowxcfinal(j,:), Yellowrediusfinal(j));
%             yellcount=yellcount+1;
        end
    %     subplot(2,3,4);
    %     redcount
    %     subplot(2,3,5);
    %     disp(grecount);
    %     subplot(2,3,6);
    %     disp(yellcount);
    
    %     subplot(2,2,3);
    %     text(xc11(1,1),xc11(1,2),signalColor(1));
    %     subplot(2,2,4);
    %     display(signalColor);
end
clc;
disp([RedBulbMetric,Redmetric]);
disp([GreenBulbMetric,Greenmetric]);
disp([YellowBulbMetric,Yellowmetric]);
Yellowrediusfinal
disp(redcount);
disp(grecount);
disp(yellcount);
disp(total_images+1);
percentage=yellcount/(total_images-initial+1)*100
