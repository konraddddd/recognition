close all;
clear all;

input_img = imread('PlikiFFT/wiener_motion_noisy.png');

figure('name','Input img');
imshow(input_img,[]);

SNR = 70;  %%[dB]
input_img = im2double(input_img);
psf = fspecial('motion', 15, 0);
variance_of_noise = 1.0046e-005;
variance_of_img = var(input_img(:));



%%%%%%%%NSR%%%%%%%%%%%%%
NSR_1 = 1/SNR;

NSR_2 = variance_of_noise/variance_of_img;

NSR_3 = 2*variance_of_img;

%%%%%%%%%%%%%%%%%%%%%%%%

J1 = deconvwnr(input_img,psf,NSR_1);
J2 = deconvwnr(input_img,psf,NSR_2);
J3 = deconvwnr(input_img,psf,NSR_3);

figure('name','Obrazy odzyskane')
subplot(1,3,1);
imshow(J1,[])
title('NSR=1/SNR')
subplot(1,3,2);
imshow(J2,[])
title('NSR=var(noise) * var(image)')
subplot(1,3,3);
imshow(J3,[])
title('NSR=2 * var(image)')

%%%% Nie udalo sie odzyskaæ orginalnego obrazu.
