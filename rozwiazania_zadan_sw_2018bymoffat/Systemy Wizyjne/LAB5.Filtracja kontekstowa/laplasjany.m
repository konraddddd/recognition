clear all;
close all;

moon = imread('archiwum_filtracja/moon.bmp');
dipxe = imread('archiwum_filtracja/dipxe.jpg');

M = [0 1 0; 1 -4 1; 0 1 0];
M = M./9;

moon_filtred = conv2(moon,M,'same');

moon_normalised128 = moon_filtred + 128;
moon_normalisedabs = abs(moon_filtred);

laplace = fspecial('laplacian')
moon_filtred_laplace = uint8(conv2(moon,laplace,'same'));
moon_filtred_laplace = moon_filtred_laplace+moon;

figure('name','Filtracja Laplasjanami z maska M')
subplot(1,4,1)
imshow(moon);
title('Input image')
subplot(1,4,2)
imshow(moon_normalised128,[])
title('+128')
subplot(1,4,3)
imshow(moon_normalisedabs,[])
title('abs')
subplot(1,4,4)
imshow(moon_filtred_laplace,[])
title('moon_filtred_laplace +')

unsharp_mask(dipxe,4.5);
unsharp_mask(dipxe,1);
