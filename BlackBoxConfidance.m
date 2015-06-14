function [cordinates, redius2, signalColorDest]=BlackBoxConfidance(sourceImage,CenterCor, redius, signalColor)
[row, col]=size(CenterCor);
% cordinates= redius;
cordinates=zeros(row,col);
redius2=zeros(row,1);

% signalColor=repmat('',[row, 1]);
signalColorDest=cell(row,1);
counter=1;
% %% Find the Bulb Color Confidance of every circle
% for i=1:row
%     if redius(i) ~= 0
%         rectup=[CenterCor(i,1)-redius(i), CenterCor(i,2)-(2*redius(i)), redius(i)*2, redius(i)*2 ];
%         rectdown=[CenterCor(i,1)-redius(i), CenterCor(i,2)+redius(i), redius(i)*2, redius(i)*2 ];
%         Iup=imcrop(sourceImage,rectup);
%         Idown=imcrop(sourceImage,rectdown);
%         %   This is to find Bulb Color Confidance
%         [statusup]=findColorRGB(Iup);
%         [statusdown]=findColorRGB(Idown);
%         
%         if strcmp(statusup,'Black') || strcmp(statusdown,'Black')
%             cordinates(counter,:)=CenterCor(i,:);
%             redius2(counter)=redius(i);
%             signalColorDest{counter,1}=signalColor{i,1};
%             counter = counter + 1;
%         end
%         
%         %     if strcmp(status,'Red') || strcmp(status,'Green') || strcmp(status,'Yellow')
%         %         cordinates(counter,:)=CenterCor(i,:);
%         %         redius2(counter)=redius(i);
%         %         signalColor{counter,1}=status;
%         %         counter = counter + 1;
%         %     end
%         %     figure;imshow(I2);
%     end
% end
% end
for i=1:row
    if redius(i) ~= 0 && CenterCor(i,1)-redius(i) > 4*redius(i) && CenterCor(i,2)-redius(i) > 4*redius(i)
        
        %         rectup=[CenterCor(i,1)-redius(i), CenterCor(i,2)-(2*redius(i)), redius(i)*2, redius(i)*2 ];
        %         rectdown=[CenterCor(i,1)-redius(i), CenterCor(i,2)+redius(i), redius(i)*2, redius(i)*2 ];
        if strcmp(signalColor(i),'Yellow')
            rectup=[CenterCor(i,1)-redius(i), ((CenterCor(i,2)-redius(i))-2*redius(i)), redius(i)*2, redius(i)*2];
            rectdown=[CenterCor(i,1)-redius(i), CenterCor(i,2)+redius(i), redius(i)*2, redius(i)*2];
            Iup=imcrop(sourceImage,rectup);
            Idown=imcrop(sourceImage,rectdown);
            %   This is to find Bulb Color Confidance
            [statusup]=findColorRGB(Iup);
            [statusdown]=findColorRGB(Idown);
            
            if strcmp(statusup,'Black') && strcmp(statusdown,'Black')
                cordinates(counter,:)=CenterCor(i,:);
                redius2(counter)=redius(i);
                signalColorDest{counter,1}=signalColor{i,1};
                counter = counter + 1;
            end
            
            %     if strcmp(status,'Red') || strcmp(status,'Green') || strcmp(status,'Yellow')
            %         cordinates(counter,:)=CenterCor(i,:);
            %         redius2(counter)=redius(i);
            %         signalColor{counter,1}=status;
            %         counter = counter + 1;
            %     end
            %     figure;imshow(I2);
        else
            if strcmp(signalColor(i),'Green')
                rect=[CenterCor(i,1)-redius(i), ((CenterCor(i,2)-redius(i))-4*redius(i)), redius(i)*2, redius(i)*4];
            end
            if strcmp(signalColor(i),'Red')
                rect=[CenterCor(i,1)-redius(i), CenterCor(i,2)+redius(i), redius(i)*2, redius(i)*4];
            end
            Idown=imcrop(sourceImage,rect);
            [statusdown]=findColorRGB(Idown);
            if strcmp(statusdown,'Black')
                cordinates(counter,:)=CenterCor(i,:);
                redius2(counter)=redius(i);
                signalColorDest{counter,1}=signalColor{i,1};
                counter = counter + 1;
            end
        end
    end
end
