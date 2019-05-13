clear all;
close all;

image = imread('Indeksacja/indeks1.bmp');
image_good = imread('Indeksacja/indeksWynik1.bmp');
figure(1)
imshow(image);

[X Y] = size(image);
image_copy=image;
L = 1;

for i=2:Y-1
    for j=2:X-1
    if image_copy(i,j)~=0
        sasiedzi = [image_copy(i-1,j-1) image_copy(i-1,j) image_copy(i-1,j+1) image_copy(i,j-1)]; 
        img_sum = sum(sasiedzi);
        if img_sum==0
            image_copy(i,j) = L;
            L = L+1;
            
        else
            if img_sum>0
            sasiedzi = nonzeros(sasiedzi);
            minimum = min(sasiedzi);
            maximum = max(sasiedzi);
            image_copy(i,j) = minimum;
            else
                        
        end
    end
        
    end
    end
end
    
figure(2)
imshow(image_copy,[])
figure(3)
imshow(image_good,[])