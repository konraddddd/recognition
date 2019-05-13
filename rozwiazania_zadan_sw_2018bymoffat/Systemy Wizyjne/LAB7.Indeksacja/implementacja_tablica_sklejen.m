clear all;
close all;

image = imread('Indeksacja/indeks1.bmp');
image_good = imread('Indeksacja/indeksWynik1.bmp')
figure(1)
imshow(image);

[X Y] = size(image);
image_copy=image;
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
for i=2:Y-1
    for j=2:X-1
        if (image_copy(i,j)~=0)
       image_copy(i,j) = tabSkl(image_copy(i,j));
        end
    end
    
end

figure(2)
imshow(image_copy,[])



