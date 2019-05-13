close all;
clear all;

load 'PlikiFFT/inv_filter.mat';
[SizeX SizeY] = size(inv_filter);

figure('name','Input img')
imshow(inv_filter);


figure('name','porownanie amplitud')

subplot(3,1,1)
psf10 = fspecial('disk', 10);
input_img_FFT = fftshift(fft2(inv_filter,SizeX,SizeY));
psf10_FFT = fftshift(fft2(psf10,SizeX,SizeY));
out_img = input_img_FFT./psf10_FFT;
out_img = ifft2(out_img);
Amp = abs(out_img);
Amp = log10(Amp+1);
imshow(Amp,[])
title('10')


subplot(3,1,2)
psf20 = fspecial('disk', 20);
input_img_FFT = fftshift(fft2(inv_filter,SizeX,SizeY));
psf20_FFT = fftshift(fft2(psf20,SizeX,SizeY));

out_img = input_img_FFT./psf20_FFT;
out_img = ifftshift(ifft2(out_img));
Amp = abs(out_img);
Amp = log10(Amp+1);
imshow(Amp,[])
title('20')



subplot(3,1,3)
psf5 = fspecial('disk', 5);
input_img_FFT = fftshift(fft2(inv_filter,SizeX,SizeY));
psf5_FFT = fftshift(fft2(psf5,SizeX,SizeY));
out_img = input_img_FFT./psf5_FFT;
out_img = ifftshift(ifft2(out_img));
Amp = abs(out_img);
Amp = log10(Amp+1);
imshow(Amp,[])
title('5')
