close all;
clear all;

ertka = imread('pliki/ertka.bmp');

SE_square = strel('square',3);

SE_diamond = strel('diamond',3);

SE_disk = strel('disk',4,6);

ertka_erozja_square = imerode(ertka,SE_square);
ertka_erozja_diamond = imerode(ertka,SE_diamond);
ertka_erozja_disk = imerode(ertka,SE_disk);

figure('name','ERTKA erozja kwadrat 3x3')
subplot(2,2,1)
imshow(ertka);
title('Input image')
subplot(2,2,2)
imshow(ertka_erozja_square);
title('Erozja 3x3 kwadrat')
subplot(2,2,3)
imshow(ertka_erozja_diamond);
title('Erozja diamond')
subplot(2,2,4)
imshow(ertka_erozja_disk);
title('Erozja disk')

figure('name','Erozja kwadrat 3 iteracje')
ertka_erozja_3_iteracje = imerode(imerode(imerode(ertka,SE_square),SE_square),SE_square);
imshow(ertka_erozja_3_iteracje);

kolka = imread('pliki/kolka.bmp')
buska = imread('pliki/buska.bmp');
wyspa = imread('pliki/wyspa.bmp');
SE_prawo = [0 0 1;0 1 0;1 0 0];
SE_lewo = [1 0 0;0 1 0;0 0 1];
buska_bez_wlosow_prawo=imerode(buska,SE_prawo);
buska_bez_wlosow_lewo=imerode(buska,SE_lewo);
figure('name','usun wlosy');
subplot(3,1,1)
imshow(buska)
subplot(3,1,2)
imshow(buska_bez_wlosow_prawo)
subplot(3,1,3)
imshow(buska_bez_wlosow_lewo)

operacje_morfologiczne(ertka);
operacje_morfologiczne(wyspa);
operacje_morfologiczne(kolka);


output = imerode(ertka,SE_square);
output = imdilate(output,SE_square);
output = imdilate(output,SE_square);
figure('name','RT')
imshow(output);


hom = imread('pliki/hom.bmp');
figure('name','hom')
imshow(hom)

SE1= [ 0 1 0; 1 1 1; 0 1 0];

SE2= [ 1 0 1; 0 0 0; 1 0 1];

output = bwhitmiss(hom,SE1,SE2);
figure('name','hom bwhitmiss')
imshow(output)