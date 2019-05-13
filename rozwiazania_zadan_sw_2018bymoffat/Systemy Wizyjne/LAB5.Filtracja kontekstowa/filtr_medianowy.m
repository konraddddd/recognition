%%%%%wa¿na cecha filtracji medianowej - po³o¿enie krawêdzi zostaje zachowane.

close all;
clear all;

lena_szum = imread('archiwum_filtracja/lenaSzum.bmp');
lena = imread('archiwum_filtracja/lena.bmp');

low_passVSmedian(lena_szum,3,'lena_szum 3x3');
low_passVSmedian(lena,3,'lena 3x3');