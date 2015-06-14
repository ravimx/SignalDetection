function [cordinates_trimed, redius_trimed, signalColor_trimed]=showAllCricles(sourceImage,CenterCor, redius)

[row, col]=size(CenterCor);
% cordinates= redius;
cordinates=zeros(row,col);
redius2=zeros(row,1);

% signalColor=repmat('',[row, 1]);
signalColor=cell(row,1);
counter=1;
%% Find the Bulb Color Confidance of every circle
for i=1:row
    rect=[CenterCor(i,1)-redius(i), CenterCor(i,2)-redius(i), redius(i)*2, redius(i)*2 ];
    I2=imcrop(sourceImage,rect);
    %   This is to find Bulb Color Confidance
    [status]=findColor(I2);
    
    if strcmp(status,'Red') || strcmp(status,'Green') || strcmp(status,'Yellow')
        cordinates(counter,:)=CenterCor(i,:);
        redius2(counter)=redius(i);
        signalColor{counter,1}=status;
        counter = counter + 1;
    end
    %     figure;imshow(I2);
end
if counter ~= 0
    cordinates_trimed=[cordinates((find(cordinates(:,1)>0)),1), cordinates((find(cordinates(:,2)>0)),2)];
    redius_trimed=redius2(find(redius2(:,1)>0));
    signalColor_trimed=signalColor(find(~cellfun(@isempty,signalColor)));
end

% emptyrows1=cellfun('isempty',cordinates);
% emptyrows2=cellfun('isempty',redius2);
% cordinates(emptyrows1)=[];
% redius2(emptyrows2)=[];
% cordinates
% redius2

end