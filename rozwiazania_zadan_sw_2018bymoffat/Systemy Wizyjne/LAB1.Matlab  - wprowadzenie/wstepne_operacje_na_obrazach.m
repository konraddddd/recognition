clear all
close all


imfinfo('lena/lena.bmp')
imfinfo('lena/lena.jpg')


lena1 = imread('lena/lena.bmp');
lena2 = imread('lena/lena.jpg');

figure(1)
imshow(lena1);
figure(2)
imshow(lena2);
lena2gray=rgb2gray(lena2);
figure(3)
imshow(lena2gray);
imwrite(lena2gray,'lena_gray.bmp');
figure(4)
colormap gray
figure(4)
mesh(lena2gray);
figure(5)
plot(lena2gray(5,:));
figure(6);
plot(lena2gray(:,3));