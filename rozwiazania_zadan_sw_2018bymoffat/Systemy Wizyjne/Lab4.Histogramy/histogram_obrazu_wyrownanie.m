clear all;
close all;

figure(1)
lena1 = imread('Histogram/lena1.bmp');
lena2 = imread('Histogram/lena2.bmp');
lena3 = imread('Histogram/lena3.bmp');
lena4 = imread('Histogram/lena4.bmp');
subplot(4,2,1);
imshow(lena1);
title('lena1');
subplot(4,2,2);
imhist(lena1,256);

subplot(4,2,3);
imshow(lena2);
title('lena2');
subplot(4,2,4);
imhist(lena2,256);

subplot(4,2,5);
imshow(lena3);
title('lena3');
subplot(4,2,6);
imhist(lena3,256);

subplot(4,2,7);
imshow(lena4);
title('lena4');
subplot(4,2,8);
imhist(lena4,256);

hist1 = imread('Histogram/hist1.bmp');
figure(2)
subplot(2,2,1);
imshow(hist1);
subplot(2,2,3);
imhist(hist1,256);

adjusted = imadjust(hist1);
subplot(2,2,2);
imshow(adjusted);
subplot(2,2,4);
imhist(adjusted,256);

%histogram skumulowany
[H,x] = imhist(hist1);
C = cumsum(H);
k = max(C)/max(H);
C2 = C/k;

figure(7);
plot(x,H);
hold on; 
plot(x,C2);
hold off;

figure(8);
subplot(2,1,1);
imhist(adjusted,256);
subplot(2,1,2);
plot(x,C2);

%algorytm wyrownania
wsp = 255/max(C);
LUT = C * wsp;
LUT = uint8(LUT);

figure 
subplot(1,3,1);
plot(x,LUT);
title('Hist. obrazu');
subplot(1,3,2);
B = intlut(hist1,LUT);
imshow(B);
title('Obraz');
subplot(1,3,3);
plot(x,C2);
title('skulumowany');

figure
subplot(1,2,1);
imshow(B);
title('My LUT');
subplot(1,2,2);
histeq(hist1,256);
title('Funkcja Matlaba');



histogram_2 = imread('Histogram/hist2.bmp');
histogram_3 = imread('Histogram/hist3.bmp');
histogram_4 = imread('Histogram/hist4.jpg');
histogram_2R = imadjust(histogram_2);
histogram_3R = imadjust(histogram_3);
histogram_4R = imadjust(histogram_4);
histogram_2HE = histeq(histogram_2);
histogram_3HE = histeq(histogram_3);
histogram_4HE = histeq(histogram_4);
histogram_2CL = adapthisteq(histogram_2);
histogram_3CL = adapthisteq(histogram_3);
histogram_4CL = adapthisteq(histogram_4);

figure(11)
subplot(3,4,1);
imshow(histogram_4);
title('Original');
subplot(3,4,2);
imshow(histogram_4R);
title('Adjusted');
subplot(3,4,3);
imshow(histogram_4HE);
title('HE');
subplot(3,4,4);
imshow(histogram_4CL);
title('CLAHE');
subplot(3,4,5);
imshow(histogram_2);
subplot(3,4,6);
imshow(histogram_2R);
subplot(3,4,7);
imshow(histogram_2HE);
subplot(3,4,8);
imshow(histogram_2CL);
subplot(3,4,9);
imshow(histogram_3);
subplot(3,4,10);
imshow(histogram_3R);
subplot(3,4,11);
imshow(histogram_3HE);
subplot(3,4,12);
imshow(histogram_3CL);
