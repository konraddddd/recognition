% TO TRZEBA POPRAWIÆ
% TO TRZEBA POPRAWIÆ
% TO TRZEBA POPRAWIÆ
% TO TRZEBA POPRAWIÆ
% TO TRZEBA POPRAWIÆ


clear all;
close all;

image_result = imread('Indeksacja/ccl1Result.png');
image = imread('Indeksacja/ccl1.png');


indexed_image = indeksuj_obraz(image);




figure('name','Prawidlowy wynik');
imshow(image_result,[]);

figure('name','Prawidlowy wynik');
imshow(image,[]);

figure('name','Reczny wynik');
imshow(indexed_image,[]);