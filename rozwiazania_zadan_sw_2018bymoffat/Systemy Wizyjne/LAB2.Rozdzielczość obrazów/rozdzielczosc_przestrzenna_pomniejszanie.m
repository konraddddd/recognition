close all;
clear all;

lena = imread('lena.bmp');

lena256 = imresize(lena,[256 256]);
lena64 = imresize(lena,[64 64]);
lena128 = imresize(lena,[128 128]);

figure(1)
imshow(lena64,'InitialMagnification',800)
title('64x64');
figure(2)
imshow(lena128,'InitialMagnification',400)
title('128x128')
figure(3)
imshow(lena256,'InitialMagnification',200)
title('256x256')
figure(4)
imshow(lena)
title('Basic');