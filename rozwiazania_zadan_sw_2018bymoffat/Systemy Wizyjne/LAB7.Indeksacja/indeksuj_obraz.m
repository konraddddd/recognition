function [ image_copy ] = indeksuj_obraz( image )
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
image_copy=image;
[X Y] = size(image_copy);
L = 1;
tabSkl=zeros(256);

for i=2:Y-1
    for j=2:X-1
    if image_copy(i,j)~=0
        sasiedzi = [image_copy(i-1,j-1) image_copy(i-1,j) image_copy(i-1,j+1) image_copy(i,j-1)]; 
        img_sum = sum(sasiedzi);
        if img_sum==0
            image_copy(i,j) = L;
            tabSkl(1,L)=L;
            L = L+1;
        elseif img_sum>0
            sasiedzi = nonzeros(sasiedzi);
            minimum = min(sasiedzi);
            maximum = max(sasiedzi);
            image_copy(i,j) = minimum;
            tabSkl(maximum)=minimum;
                        
        end
    end
        
    end
    
end
for i=2:X-1
    for j=2:Y-1
        if (image_copy(i,j)~=0)
       image_copy(i,j) = tabSkl(image_copy(i,j));
        end
    end
    
end

end

