close all;
clear all;

lena = imread('Pliki/lenaRGBSzumKolor.bmp');
lenaHSV = rgb2hsv(lena);

figure('name','Obraz RGB')
imshow(lena)

figure('name','Obraz HSV')
imshow(lenaHSV)

lenaR = lena(:,:,1);
lenaG = lena(:,:,2);
lenaB = lena(:,:,3);
lenaR = medfilt2(lenaR,[4 4]);
lenaG = medfilt2(lenaG,[4 4]);
lenaB = medfilt2(lenaB,[4 4]);



lenaH = lenaHSV(:,:,1);
lenaS = lenaHSV(:,:,2);
lenaV = lenaHSV(:,:,3);
lenaH = medfilt2(lenaH,[4 4]);
lenaS = medfilt2(lenaS,[4 4]);
lenaV = medfilt2(lenaV,[4 4]);


HSV = cat(3, lenaH, lenaS, lenaV);
RGB = cat(3, lenaR, lenaG, lenaB);
HSV = hsv2rgb(HSV);

figure('Name','Filtred HSV')
imshow(HSV)

figure('Name','Filtred RGB')
imshow(RGB)



