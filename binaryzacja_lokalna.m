close all; clear all;


image = imread('rice.png');
bin_img = image;

[ X Y ] = size(image);

for i = 1:X
    for j = 1:Y
        img_mean = meanLT(i,j,8,image,X,Y);
         if bin_img(i,j)>img_mean
            bin_img(i,j) = 255;
         else
             bin_img(i,j) = 0;
         end
    end
end

figure(1)
subplot(1,2,1)
imshow(image)
subplot(1,2,2)
imshow(bin_img)

[ X Y ] = size(image);

for i = 1:X
    for j = 1:Y
        m=meanLT(i,j,8,image,X,Y);
        T = m*(1+0.15*((stddevLT(i,j,8,image,m,X,Y)/128) - 1));
         if bin_img(i,j)>img_mean
            bin_img(i,j) = 255;
         else
             bin_img(i,j) = 0;
         end
    end
end

figure(2)
subplot(1,2,1)
imshow(image)
subplot(1,2,2)
imshow(bin_img)