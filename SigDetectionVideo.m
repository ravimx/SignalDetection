
%%Taiking Inputes from Source.
% f is the inputed color image.
% path='C:\Users\Dell\Documents\MATLAB\Signal detection\data\';
% imgNo=1;
% extension='.jpg';
% f=imread('C:\Users\Dell\Documents\MATLAB\Signal detection\data\2.png');

path='C:\Users\Dell\Documents\MATLAB\Signal detection\data\';
imgNo=15;
videoName='14';
extension='.avi';
mov = VideoReader(strcat(path,int2str(imgNo),extension));
numFrames = mov.NumberOfFrames; 

%%This is code for draw rectangles 
% [x, y, z]=size(f);
% red=zeros(x,y,z);
% shapeInserter = vision.ShapeInserter;
% radius=5;
% red=f(:,:,1);
% green=f(:,:,2);
% blue=f(:,:,3);

%% Detecting circles
for i=1:100:numFrames
% for i=199:200
    f=read(mov, i);
    [xc, redius, Metric]=imfindcircles(rgb2gray(f),[1 9]);
%     [xc1, redius1, Metric1]=imfindcircles(rgb2gray(f),[3 8]);
%     [xc2, redius2, Metric2]=imfindcircles(rgb2gray(f),[4 11]);
    % ractangles=int32([xc yc 10 10]);
    % rectangles = int32([xc(1)-15 xc(2)-15 30 30]);
    % pdecirc(xc,yc,radius)
    % imtool(f);
    % imshow();
    % figure;rectangle('Position',[xc,yc,1,1]);
    % J=step(shapeInserter,red,rectangles);
    % figure;imtool(J);
    figure;imshow(f); 
%     viscircles(xc(1:5,:), redius(1:5));
    [xc11, redius11, signalColor]=showAllCricles(f,xc,redius);
    viscircles(xc11, redius11);
    
%     [xc21, redius21]=showAllCricles(f,xc1,redius1);
%     viscircles(xc21, redius21);
%     
%     [xc31, redius31]=showAllCricles(f,xc2,redius2);
%     viscircles(xc31, redius31);
%     viscircles(xc1, redius1);
%     imshow(f);
        
%     [status, BW]=findColor(RGB);
%     status
%     delete(f);    
end
% showAllCricles(f,xc,redius);
% figure;imtool(J);
