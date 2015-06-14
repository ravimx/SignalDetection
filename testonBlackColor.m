sourceImage=imread('TestThreshold\frame_002055.jpg');
Iup=imcrop(sourceImage);
% Idown=imcrop(sourceImage,rectdown);
%   This is to find Bulb Color Confidance
[status]=findColorRGB(Iup);
status