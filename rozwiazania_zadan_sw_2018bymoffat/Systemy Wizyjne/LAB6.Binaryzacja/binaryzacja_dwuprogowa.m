close all; clear all;

image = imread('bart.bmp');
obrazBW = image;

figure(1)
subplot(2,1,1)
imshow(image)
subplot(2,1,2)
imhist(image)

obrazBW = image > 188 & image < 203;
obrazBW = uint8(obrazBW);

figure(2)
subplot(2,1,1)
imshow(image)
subplot(2,1,2)
imshow(obrazBW,[])
