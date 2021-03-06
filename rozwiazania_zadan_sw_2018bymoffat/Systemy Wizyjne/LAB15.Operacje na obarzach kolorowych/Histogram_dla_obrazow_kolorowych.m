close all;
clear all;

lena = imread('Pliki/lenaRGB.bmp');

lenaR = lena(:,:,1);
lenaG = lena(:,:,2);
lenaB = lena(:,:,3);

figure('Name','Obraz Kolorowy');
imshow(lena)

figure('Name','Poszczegolne Skladowe')
subplot(1,3,1)
imshow(lenaR)
title('R')
subplot(1,3,2)
imshow(lenaG)
title('G')
subplot(1,3,3)
imshow(lenaB)
title('B')

lenaRE = histeq(lenaR,256);
lenaGE = histeq(lenaG,256);
lenaBE = histeq(lenaB,256);


obrazEQ = lena;
obrazEQ(:,:,1) = lenaRE;
obrazEQ(:,:,2) = lenaGE;
obrazEQ(:,:,3) = lenaBE;

figure('name','Histogram wyr�wnany w kolorze')
imshow(obrazEQ)

%%%Zmiana kolorystyki obrazu, i jego zniekszta�cenie

lena2 = rgb2hsv(lena);

lena2R = lena2(:,:,1);
lena2G = lena2(:,:,2);
lena2B = lena2(:,:,3);

figure('Name','Obraz Kolorowy HSV');
imshow(lena2)


figure('Name','Poszczegolne Skladowe')
subplot(1,3,1)
imshow(lena2R)
title('H')
subplot(1,3,2)
imshow(lena2G)
title('S')
subplot(1,3,3)
imshow(lena2B)
title('V')

lena2RE = histeq(lena2R,256);
lena2GE = histeq(lena2G,256);
lena2BE = histeq(lena2B,256);


obraz2EQ = lena2;
obraz2EQ(:,:,1) = lena2RE;
obraz2EQ(:,:,2) = lena2GE;
obraz2EQ(:,:,3) = lena2BE;

obraz2EQ = hsv2rgb(obraz2EQ);

figure('name','Histogram wyr�wnany w kolorze HSV')
imshow(obraz2EQ)


