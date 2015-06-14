
%% Taiking Inputes from Source.
% Preparing the Inputs
path='C:\Users\Dell\Documents\MATLAB\Signal detection\data\';
imgNo=1;
extension='.png';
f=imread('C:\Users\Dell\Documents\MATLAB\Signal detection\data\2.png');

%% Detecting circles
for i=1:9
    % Taking Inputs from specified path
    f=imread(strcat(path,int2str(i),extension));
%   for every frame find total number of circles in frame
%   Using Step 5 of Signal Detection Algorithm 
%   this function returns center coordinates and redius of detectd circles
    [xc, redius, Metric]=imfindcircles(rgb2gray(f),[1 9]);
    figure;imshow(f); 
    [xc11, redius11, signalColor]=showAllCricles(f,xc,redius);
    viscircles(xc11, redius11);    
end
