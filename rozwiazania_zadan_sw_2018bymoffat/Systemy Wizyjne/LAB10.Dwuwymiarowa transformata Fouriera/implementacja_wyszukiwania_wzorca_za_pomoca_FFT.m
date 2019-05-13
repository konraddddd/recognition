close all;
clear all;

literki = imread('obrazki/literki.bmp');
wzorA = imread('obrazki/wzorA.bmp');

wzorAF = fft2(rot90(wzorA,2),256,256);
literkiF = fft2(literki);

mul =  literkiF.*wzorAF;
mul = ifft2(mul);
A = abs(mul);

SE = strel('square',3);
output_img = imtophat(A,SE);

figure('name','input img literki')
imshow(literki,[])
figure('name','input img wzorA')
imshow(wzorA,[])
figure('name','output_img')
imshow(output_img,[])