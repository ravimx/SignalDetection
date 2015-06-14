function [FilteredArray]=transitionfiltering(detectionFrames)
[row, ~]=size(detectionFrames);
% FilteredArray=char(1,row);
FilteredArray=detectionFrames;

for i=3:row-3
    if detectionFrames(i,1)~= detectionFrames(i+1,1)
       if  detectionFrames(i+1,1)==detectionFrames(i+2,1) && detectionFrames(i-1,1)==detectionFrames(i-2,1)
           FilteredArray(i,1)=detectionFrames(i-1,1);
       elseif  detectionFrames(i+1,1)==FilteredArray(i-1,1) && detectionFrames(i+1,1)==FilteredArray(i-2,1) 
           FilteredArray(i,1)=detectionFrames(i-1,1);
       end
    end
end
end