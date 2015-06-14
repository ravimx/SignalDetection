path='C:\Users\Dell\Documents\MATLAB\Signal detection\data\';
imgNo=14;
videoName='14';
extension='.mp4';
mov = VideoReader(strcat(path,int2str(imgNo),extension));
numFrames = mov.NumberOfFrames;

for t = 1 : numFrames    
    currFrame = read(mov, t); 
    imshow(currFrame);
end