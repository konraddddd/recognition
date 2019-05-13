close all;
clear all;


lena = imread('lena.bmp');
lena = imresize(lena, [128 128]);
lena0_31 = imadjust(lena,[],[0 0.08]);
lena0_15 = imadjust(lena,[],[0 0.17]);
lena0_7 = imadjust(lena,[],[0 0.36]);
lena0_3 = imadjust(lena,[],[0 0.85]);
lena0_1 = imadjust(lena,[],[0 0.225]);

subplot(3,3,1);
imshow(lena,[]);
title('Original');

subplot(3,3,2);
imshow(lena0_31,[]);
title('lena0_31');
 
subplot(3,3,3);
imshow(lena0_15,[]);
title('lena0_15');
 
subplot(3,3,4);
imshow(lena0_7,[]);
title('lena0_7');
 
subplot(3,3,5);
imshow(lena0_3,[]);
title('lena0_3');
 
subplot(3,3,6);
imshow(lena0_1,[]);
title('lena0_1');



