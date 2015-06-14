%% Get Input
% f=imread('C:\Users\Dell\Documents\MATLAB\Signal detection\data\4.png');
image_folder = 'C:\Users\Dell\Documents\MATLAB\Signal detection\SmallTestImages\frame_003390.jpg'; %  Enter name of folder from which you want to upload pictures with full path
f=imread(image_folder);
imtool(image_folder);
g=f;
%% Slicing
% 
% [C m]=covmatrix(f);
% m=[230, 230 , 0];%Yellow Color range
% m=[230, 0 , 0]; % Red Light
m=[0, 230 , 180]; % Green Light 
slice=colorseg('euclidean',f,150,m);
[xc, redius, Metric]=imfindcircles(slice,[1 9]);
imshow(image_folder);
viscircles(xc, redius);

% final=elembyelem(g,slice);
% final=slice;
imshow(slice);

%% End of Program