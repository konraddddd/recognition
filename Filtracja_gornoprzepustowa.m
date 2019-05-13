close all;
clear all;
load MaskiPP.mat
lena = imread('Pliki/lenaRGB.bmp');

lenaR = (lena(:,:,1));
lenaG = (lena(:,:,2));
lenaB = (lena(:,:,3));

lenaR1 = conv2(lenaR,S1, 'same');
lenaR2 = conv2(lenaR,S2, 'same');
lenaR = abs(lenaR1) + abs(lenaR2);

lenaG1 = conv2(lenaG,S1, 'same');
lenaG2 = conv2(lenaG,S2, 'same');
lenaG = abs(lenaG1) + abs(lenaG2);

lenaB1 = conv2(lenaB,S1, 'same');
lenaB2 = conv2(lenaB,S2, 'same');
lenaB = abs(lenaB1) + abs(lenaB2);


figure('Name','Obraz Kolorowy');
imshow(lena)

figure('Name','Poszczegolne Skladowe')
subplot(1,3,1)
imshow(lenaR,[])
title('R')
subplot(1,3,2,[])
imshow(lenaG,[])
title('G')
subplot(1,3,3)
imshow(lenaB,[])
title('B')


obrazEQ = lena;
obrazEQ(:,:,1) = lenaR;
obrazEQ(:,:,2) = lenaG;
obrazEQ(:,:,3) = lenaB;

SUM_RGB = lenaR+lenaG+lenaB;

figure('name','Wynik RGB')
imshow(obrazEQ)
figure('name','Krawedzie w skali szarosci RGB')
imshow(SUM_RGB,[])

lenaHSV = rgb2hsv(lena);

figure('Name','Obraz Kolorowy HSV');
imshow(lenaHSV)

lenaH = double(lena(:,:,1));
lenaS = double(lena(:,:,2));
lenaV = double(lena(:,:,3));

lenaH1 = conv2(lenaH,S1, 'same');
lenaH2 = conv2(lenaH,S2, 'same');
lenaH = abs(lenaH1) + abs(lenaH2);

lenaS1 = conv2(lenaS,S1, 'same');
lenaS2 = conv2(lenaS,S2, 'same');
lenaS = abs(lenaS1) + abs(lenaS2);

lenaV1 = conv2(lenaV,S1, 'same');
lenaV2 = conv2(lenaV,S2, 'same');
lenaV = abs(lenaV1) + abs(lenaV2);

figure('Name','Poszczegolne Skladowe HSV')
subplot(1,3,1)
imshow(lenaH,[])
title('H')
subplot(1,3,2)
imshow(lenaS,[])
title('S')
subplot(1,3,3)
imshow(lenaV,[])
title('V')

SUM_HSV = lenaH + lenaS + lenaV;


obrazEQ = double(lena);
obrazEQ(:,:,1) = lenaH;
obrazEQ(:,:,2) = lenaS;
obrazEQ(:,:,3) = lenaV;



figure('name','Krawedzie w skali szarosci HSV')
imshow(SUM_HSV,[])

