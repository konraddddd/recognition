close all;
clear all;

image = zeros(11,11);
image(3,4) = 1;
image(1,4) = 1;
H = houghAB(image);

figure(1)
imshow(H,[]);
%proste przecinaj� si� w nieskonczonosci ta przestrzen si� nie nadaje bo
%nie nadaje si� do pokazania nieskonczonosci. Dla duzych tangens�w ta
%przestrzen sie nie nadaje