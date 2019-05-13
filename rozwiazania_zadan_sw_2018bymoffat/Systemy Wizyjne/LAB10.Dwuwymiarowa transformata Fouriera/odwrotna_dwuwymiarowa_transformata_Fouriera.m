close all;
clear all;

image = imread('obrazki/kolo.bmp');

image_fft2 = fft2(image);
image_fft2_shifted = fftshift(image_fft2);

image_after_inverse_fft2 = ifft2 (ifftshift(image_fft2_shifted));

difference_img = imabsdiff(image,uint8(image_after_inverse_fft2));

figure('name', 'Input Image')
imshow(image,[]);
figure('name', 'Img after inverce transform')
imshow(image_after_inverse_fft2,[]);
figure('name', 'Difference IMG');
imshow(difference_img,[]);

%%Obrazy s¹ identyczne, transformata fouriera jest wiêc bezstratna
