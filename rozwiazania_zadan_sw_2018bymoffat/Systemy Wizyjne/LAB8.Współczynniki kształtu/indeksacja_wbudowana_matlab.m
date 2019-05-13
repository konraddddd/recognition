close all;
clear all;

image = imread('indeks2.bmp');

figure(1)
imshow(image);

figure(2)
subplot(2,1,1)

image_4 = bwlabel(image,4);
imshow(image_4,[]);
title('cztero');
subplot(2,1,2)
image_8 = bwlabel(image,8);
imshow(image_8,[])
title('osmio');