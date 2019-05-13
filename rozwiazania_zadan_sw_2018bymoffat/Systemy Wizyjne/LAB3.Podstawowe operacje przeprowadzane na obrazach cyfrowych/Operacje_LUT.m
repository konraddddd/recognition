close all;
clear all;


load 'Podstawowe operacje/funkcjeLUT.mat';

figure('Name','kwadratowa')
plot(kwadratowa);
figure(1);
plot(kwadratowa);
lena = imread('Podstawowe operacje/lena.bmp');
figure(2);
LUT(lena,kwadratowa)
figure(3)
LUT(lena,wykladnicza)
figure(4)
LUT(lena,pierwiastkowa)
figure(5)
LUT(lena,pila)
figure(6)
LUT(lena,odwrotna)
figure(7)
LUT(lena,log)
figure(8)
LUT(lena,odwlog)