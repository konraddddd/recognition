close all;
clear all;

lena = imread('Pliki/lenaRGBSzumKolor.bmp');
lenaHSV = rgb2hsv(lena);

h = fspecial('average',4);

figure('name','Obraz RGB')
imshow(lena)

figure('name','Obraz HSV')
imshow(lenaHSV)


%%%%%%%%%%%%%%%%%%%%%%%%%
lenaR = lena(:,:,1);
lenaG = lena(:,:,2);
lenaB = lena(:,:,3);

lenaH = lenaHSV(:,:,1);
lenaS = lenaHSV(:,:,2);
lenaV = lenaHSV(:,:,3);

lenaR = conv2(lenaR,h,'same');
lenaG = conv2(lenaG,h,'same');
lenaB = conv2(lenaB,h,'same');

lenaH = conv2(lenaH,h,'same');
lenaS = conv2(lenaS,h,'same');
lenaV = conv2(lenaV,h,'same');

obraz = lena;
obraz(:,:,1) = lenaR;
obraz(:,:,2) = lenaG;
obraz(:,:,3) = lenaB;

obraz2 = cat(3, lenaH, lenaS, lenaV);
obraz2 = hsv2rgb(obraz2);

figure('name','Filtracja RGB')
imshow(obraz)

figure('name','Filtracja HSV')
imshow(obraz2)



