close all;
clear all;

lena = imread('lena.bmp');

A = imrotate(lena,45);
imshow(A);
close all;

chessboard = imread('szachownica.bmp');

chessboard_rotated_nearest = imrotate(chessboard,-45),'nearest';
chessboard_rotated_bilinear = imrotate(chessboard,-45,'bilinear');
chessboard_rotated_bicubic = imrotate(chessboard,-45,'bicubic');

subplot(4,1,1)
imshow(chessboard);
title('Basic');
subplot(4,1,2)
imshow(chessboard_rotated_nearest);
title('chessboard rotated nearest');
subplot(4,1,3)
imshow(chessboard_rotated_bilinear);
title('chessboard rotated bilinear');
subplot(4,1,4)
imshow(chessboard_rotated_bicubic);
title('chessboard rotated bicubic');

%Bicubic
theta = -45;
scale = [0.5 0 0; 0 0.5 0; 0 0 1 ];
rotate = [cosd(theta) sind(theta) 0;-sind(theta) cosd(theta) 0; 0 0 1]*scale;
tform = affine2d(rotate);
B=imwarp(lena,tform);
figure(2)
imshow(B)
title('Rotated 1/2');
translatedLena = imtranslate(lena,[10 25]);
figure(3)
imshow(translatedLena);