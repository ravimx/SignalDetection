function imageReturn=elembyelem(g, slice)

[row, col, dim]=size(g);
[row1, col1]=size(slice);
imageReturn=zeros(row1,col1,3);

if row ~= row1 && col ~= col1
    inm='Matrix dimenstion must agree'
else
    for i=1:row
        for j=1:col
            imageReturn(i,j,1)=g(i,j,1)*uint8(slice(i,j));
            imageReturn(i,j,2)=g(i,j,2)*uint8(slice(i,j));
            imageReturn(i,j,3)=g(i,j,3)*uint8(slice(i,j));
            %             =[a, b, c];
        end
    end
end

