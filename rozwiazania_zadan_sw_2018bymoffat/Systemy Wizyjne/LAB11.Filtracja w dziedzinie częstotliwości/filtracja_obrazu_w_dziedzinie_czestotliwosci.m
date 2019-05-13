close all;
clear all;

lena = imread('PlikiFFT/lena.bmp');

[Amp_lena Ph_lena] = FourierTransform2d(lena);

figure('name', 'Lena Fourier')
subplot(3,1,1)
imshow(lena,[]);
title('Input img');
subplot(3,1,2)
imshow(Amp_lena,[]);
title('Amplituda');
subplot(3,1,3)
imshow(Ph_lena,[]);
title('Faza');

low_pass_lena = low_pass_circle_filtr(lena);
figure('name', 'Lena low pass');
imshow(low_pass_lena,[]);

hight_pass_lena = hight_pass_circle_filtr(lena);
figure('name', 'Lena low pass');
imshow(hight_pass_lena,[]);

band_pass_lena = band_pass_circle_filtr(lena);
figure('name', 'Lena low pass');
imshow(band_pass_lena,[]);

low_pass_circle_filtrHanning_lena = low_pass_circle_filtrHanning(lena);
figure('name', 'Lena low passHanning');
imshow(low_pass_circle_filtrHanning_lena,[]);

hight_pass_circle_filtrHanning_lena = hight_pass_circle_filtrHanning(lena);
figure('name', 'Lena hight passHanning');
imshow(hight_pass_circle_filtrHanning_lena,[]);