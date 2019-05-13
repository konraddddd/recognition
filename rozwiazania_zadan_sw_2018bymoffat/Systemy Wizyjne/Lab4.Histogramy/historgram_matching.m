close all;
clear all;

moon = imread('Histogram/phobos.bmp');
hist = histeq(moon);
figure(1)
subplot(1,2,1);
imshow(moon);
title('Basic img');
subplot(1,2,2);
imshow(hist);
title('Classic histEQ');

load histogramZadany;
figure(2)
subplot(1,2,2);
hist2 = histeq(moon,histogramZadany);
imshow(hist2);
subplot(1,2,1);
plot(histogramZadany);

adjusted = imadjust(moon);
clached = adapthisteq(moon);
figure(3)
subplot(1,2,1);
imshow(adjusted);
subplot(1,2,2);
imshow(clached);