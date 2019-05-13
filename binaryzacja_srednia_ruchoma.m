clear all;
close all;



image = imread('tekstReczny.tif');
[sizeX sizeY] = size(image);
image_bin=image;
n=20;
a=0.5;
m=1;
FIFO = 0;
for i=1:sizeX
    for j=1:sizeY
        
        if size(FIFO)==n
            FIFO(1:end-1) = FIFO(2:end);
            FIFO(end) = image(i,j);
        else
            if( size(FIFO)<n)
            FIFO = [FIFO image(i,j)];
            end
        end         
        m = sum(FIFO)/n;
        T = a*m;
        if(image(i,j)<T)
            image_bin(i,j)=0;
        else
            image_bin(i,j)=255;
        end
        
    end
end

%%%%%%%%%%%%%%%%%%%%%
image_bin_manual = im2bw(image,152/255);
%%%%%%%%%%%%%%%%%%%%%
lvl = graythresh(image);
image_bin_otsu = im2bw(image,lvl);



figure('name','srednia ruchoma');
imshow(image_bin,[])
figure('name','srednia manualna');
imshow(image_bin_manual,[])
figure('name','srednia otsu');
imshow(image_bin_otsu,[])
