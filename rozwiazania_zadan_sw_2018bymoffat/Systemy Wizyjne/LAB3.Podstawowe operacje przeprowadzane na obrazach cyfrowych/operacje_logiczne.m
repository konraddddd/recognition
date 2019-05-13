clear all;
close all;
kolo = imread('Podstawowe operacje/kolo.bmp');
kwadrat = imread('Podstawowe operacje/kwadrat.bmp');
kolo = boolean(kolo);
kwadrat = boolean(kwadrat);
figure(1)
imshow(kwadrat);
figure(3)
imshow(kolo);
figure(2)
imshow(kolo);
subplot(4,1,1)
imshow(kolo & kwadrat);
subplot(4,1,2)
imshow(kolo | kwadrat);
subplot(4,1,3)
imshow(xor(kolo,kwadrat));
subplot(4,1,4)
imshow(~kolo);