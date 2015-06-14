clear;clc;
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
total_images=215;
initial=179;
counter=0;
%%Test parameters
%% Detecting circles
for i = initial:total_images
    % Taking Inputs from specified path
%%    f=imread(strcat(path,int2str(i),extension));
full_name= fullfile(image_folder, filenames(i).name);         % it will specify images names with full path and extension
f = imread(full_name); 
%   for every frame find total number of circles in frame
%   Using Step 5 of Signal Detection Algorithm 
%   this function returns center coordinates and redius of detectd circles
    [xc, redius, Metric]=imfindcircles(rgb2gray(f),[1 9]);        
 
%     figure;imshow(f); 
    pause(0.001);
%     subplot(2,2,1);    
    [xc11, redius11, signalColor]=showAllCricles(f,xc,redius);
      

    xc11_trimed=[xc11((find(xc11(:,1)>0)),1), xc11((find(xc11(:,2)>0)),2)];
    redius11_trimed=redius11(find(redius11(:,1)>0));
    signalColor_trimed=signalColor(find(~cellfun(@isempty,signalColor)));
    [xcfinal, rediusfinal, signalColorfinal]=BlackBoxConfidance(f, xc11_trimed, redius11_trimed, signalColor_trimed);
    [row, ~]=size(xcfinal);
    if row ~= 0
       counter=counter+1; 
    end
    imshow(f);
    viscircles(xcfinal, rediusfinal);
    
%     subplot(2,2,3);
%     text(xc11(1,1),xc11(1,2),signalColor(1));
%     subplot(2,2,4);
%     display(signalColor);
end
counter
total_images-initial
percentage=counter/(total_images-initial)*100