close all;
clear all;

image = zeros(11,11);
image(3,4) = 1;
image(1,4) = 1;
H = houghAB(image);

figure(1)
imshow(H,[]);
%proste przecinaj¹ siê w nieskonczonosci ta przestrzen siê nie nadaje bo
%nie nadaje siê do pokazania nieskonczonosci. Dla duzych tangensów ta
%przestrzen sie nie nadaje