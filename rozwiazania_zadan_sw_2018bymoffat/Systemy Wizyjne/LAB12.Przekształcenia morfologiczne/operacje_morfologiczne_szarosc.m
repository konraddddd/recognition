close all; clear all;

ferrari = imread('pliki/ferrari.bmp');

figure('name','ferrari')
subplot(4,1,1)
imshow(ferrari)
title('ferrari input')
subplot(4,1,2)
ferrari_erozja = imerode(ferrari,strel('square',3));
imshow(ferrari_erozja)
title('ferrari erozja')
subplot(4,1,3)
ferrari_dyl = imdilate(ferrari,strel('square',3));
imshow(ferrari_dyl)
subplot(4,1,4)
imshow(ferrari_dyl-ferrari_erozja);


figure('name', 'im top hat & imbothar')
subplot(2,1,1)
imshow(imtophat(ferrari,strel('square',3)));
title('imtophat')
subplot(2,1,2)
imshow(imbothat(ferrari,strel('square',3)))
title('imbothat')




rice = imread('rice.png');
figure('name', 'jasnosc')
subplot(2,1,1)
imshow(rice);
title('rice')
subplot(2,1,2)
imshow(imtophat(rice,strel('disk',10)))
title('imbothat')
%Niejednorodnosc zostala usunieta