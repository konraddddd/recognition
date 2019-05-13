close all;
clear all;


lena100 = imread('lena100.bmp');
figure(1)
imshow(lena100)
figure(2)
imshow(imresize(lena100,2,'nearest'))
figure(3)
imshow(imresize(lena100,2,'bilinear'))
figure(4)
imshow(imresize(lena100,2,'bicubic'))

pause;
close all;

chessboard = imread('szachownica.bmp');

chessboardNearest = imresize(chessboard,10,'nearest');
chessboardBilinear = imresize(chessboard,10,'bilinear');
chessboardBicubic = imresize(chessboard,10,'bicubic');

chessboardNearest = imresize(chessboardNearest,0.625,'nearest');
chessboardBilinear = imresize(chessboardBilinear,0.625,'bilinear');
chessboardBicubic = imresize(chessboardBicubic,0.625,'bicubic');

figure(1)
imshow(chessboard)
title('Basic')
figure(2)
imshow(chessboardNearest)
title('Nearest-neighbor interpolation')
figure(3)
imshow(chessboardBilinear)
title('Bilinear interpolation')
figure(4)
imshow(chessboardBicubic)
title('Bicubic interpolation')

pause;
close all;


