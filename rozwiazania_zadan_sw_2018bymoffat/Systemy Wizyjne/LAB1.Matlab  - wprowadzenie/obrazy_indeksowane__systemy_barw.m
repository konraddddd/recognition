% OBRAZY INDEKSOWANE

% close all
% clear all
% 
% 
% lenaGray = imread('lena_gray.bmp')
% [X, map] = gray2ind(lenaGray, 256);
% X
% map
% figure(1)
% imshow(X,map)
% figure(2)
% imshow(lenaGray)
% figure(3)
% imshow(X,spring)
% 
%  
% 
% ========================================

 

close all
clear all

%RGB


lena =imread('lena.bmp')
R = lena(:,:,1); G = lena(:,:,2); B = lena(:,:,3);
figure(3);
subplot(2,2,1);
imshow(lena);
title('Oryginal');
subplot(2,2,2);
imshow(R);
title('R');
subplot(2,2,3);
imshow(G);
title('G');
subplot(2,2,4);
imshow(B);
title('B');

%HSV


lenaHSV = rgb2hsv(lena)
Hue = lenaHSV(:,:,1)
Saturation = lenaHSV(:,:,2)
Value= lenaHSV (:,:,3)

figure(4);
subplot(2,2,1);
imshow(lenaHSV);
title('Oryginal');
subplot(2,2,2);
imshow(Hue);
title('Hue');
subplot(2,2,3);
imshow(Saturation);
title('Saturation');
subplot(2,2,4);
imshow(Value);
title('Value');

 

%YCbCr

lenaYCbCr = rgb2ycbcr(lena)
Y = lenaYCbCr(:,:,1)
Cb = lenaYCbCr(:,:,2)
Cr = lenaYCbCr(:,:,3)
figure(5)
subplot(2,2,1);
imshow(lenaYCbCr);
title('Oryginal');
subplot(2,2,2);
imshow(Y);
title('Y');
subplot(2,2,3);
imshow(Cb);
title('Cb');
subplot(2,2,4);
imshow(Cr);
title('Cr');