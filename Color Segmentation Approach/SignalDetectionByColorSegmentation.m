
%% Taiking Inputes from Source.
% Preparing the Inputs
% path='C:\Users\Dell\Documents\MATLAB\Signal detection\data\';
% imgNo=1;
% extension='.png';
% f=imread('C:\Users\Dell\Documents\MATLAB\Signal detection\data\2.png');
 image_folder = 'C:\Users\Dell\Documents\MATLAB\Signal detection\Lara3D_UrbanSeq1_JPG'; %  Enter name of folder from which you want to upload pictures with full path
% image_folder = 'C:\Users\Dell\Documents\MATLAB\Signal detection\data'; %  Enter name of folder from which you want to upload pictures with full path
% image_folder = 'C:\Users\Dell\Documents\MATLAB\Signal detection\SmallTestImages'; %  Enter name of folder from which you want to upload pictures with full path
filenames = dir(fullfile(image_folder, '*.jpg'));  % read all images with specified extention, its jpg in our case
total_images = numel(filenames);    % count total number of photos present in that folder
total_images
RedThre=[230, 0 , 0];
GreenThre=[0, 230 , 180];
YellowThre=[230, 230 , 0];
%% Detecting circles
for i = 1:total_images
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
    [xcRed, rediusRed, ~]=imfindcircles(sliceRedImage,[1 9]);
    [xcGreen, rediusGreen, ~]=imfindcircles(sliceGreenImage,[1 9]);
    [xcYellow, rediusYellow, ~]=imfindcircles(sliceYellowImage,[1 9]);
    
    %   Finding Total number Bulbs Detected
    [RedCount, ~]=size(xcRed);
    [GreenCount, ~]=size(xcGreen);
    [YellowCount, ~]=size(xcYellow);    
    pause(0.001);
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
%%  Flat BlackBoxConfidance is used   
%   BlackBoxConfidanceFlat function is used
%   Checking the BlackBoxConfidane
    if RedCount ~=0
        [Redxcfinal, Redrediusfinal]=BlackBoxConfidanceFlat(f, xcRed, rediusRed,'Red');
    end
    if GreenCount ~=0
        [Greenxcfinal, Greenrediusfinal]=BlackBoxConfidanceFlat(f, xcGreen, rediusGreen,'Green');
    end
    if YellowCount ~=0
        [Yellowxcfinal, Yellowrediusfinal]=BlackBoxConfidanceFlat(f, xcYellow, rediusYellow,'Yellow');
    end
    %     xc11_trimed=[xc11((find(xc11(:,1)>0)),1), xc11((find(xc11(:,2)>0)),2)];
    %     redius11_trimed=redius11(find(redius11(:,1)>0));
    %     signalColor_trimed=signalColor(find(~cellfun(@isempty,signalColor)));
    
    subplot(1,3,1);
    imshow(f);
    viscircles(Redxcfinal, Redrediusfinal);
    subplot(1,3,2);
    imshow(f);
    viscircles(Greenxcfinal, Greenrediusfinal);
    subplot(1,3,3);
    imshow(f);
    viscircles(Yellowxcfinal, Yellowrediusfinal);
    %     subplot(2,2,3);
    %     text(xc11(1,1),xc11(1,2),signalColor(1));
    %     subplot(2,2,4);
    %     display(signalColor);
end
