close all;
clear all;

image = imread('ksztaltyReal.bmp');
image_train = imread('ksztalty.bmp');
image_train8 = bwlabel(image_train,8);
wsp_train = obliczWspolczynniki(image_train8);
image = rgb2gray(image);
bin_image = im2bw(image,75/255);

figure(1)
imshow(bin_image,[]);

rev_bin_image = ~bin_image;
figure(2)
imshow(rev_bin_image,[]);

rev_bin_image = imgaussfilt(uint16(rev_bin_image),1.2);
image8 = bwlabel(rev_bin_image,8);


wsp = obliczWspolczynniki(image8);
wsp(:,3) = wsp(:,3)/10;
wsp_train(:,3) = wsp_train(:,3)/10;
figure(1)
imshow(image8,[]);
r = regionprops(image8,'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1),r(i).Centroid(2),['\color{magenta}',num2str(i)]);
end
figure(3)
%%%Kwadraty
kwadraty = image8;
[X Y] = size(kwadraty)
for i=1:X
    for j=1:Y
    piksel = kwadraty(i,j);
    if piksel ~= 0 && ~(wsp(piksel,2) > 0.75 && wsp(piksel,2) < 0.84)
     kwadraty(i,j) = 0;
    end
    end
end
imshow(kwadraty,[])
title('same kwadraty')
figure(4)
%%%kola
kola = image8;
[X Y] = size(kola)
for i=1:X
    for j=1:Y
    piksel = kola(i,j);
    if piksel ~= 0 && ~(wsp(piksel,1) > 0.75 && wsp(piksel,1) < 0.84)
     kola(i,j) = 0;
    end
    end
end
imshow(kola,[])
title('same kola')
figure(5)

krzyz = image8;
[X Y] = size(krzyz)
for i=1:X
    for j=1:Y
    piksel = krzyz(i,j);
    if piksel ~= 0 && ~(wsp(piksel,3) > 0.48 && wsp(piksel,3) < 0.501)
     krzyz(i,j) = 0;
    end
    end
end
imshow(krzyz,[])
title('same krzyze')



klasy={'kolo';'krzyz';'kwadrat';'kwadrat';'krzyz';'kolo';'kwadrat'; 'krzyz'}
MD1 = fitcknn(wsp_train,klasy);
yp = predict(MD1,wsp)
celldisp (yp)
figure(6)
imshow(image8,[]);
r = regionprops(image8,'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1),r(i).Centroid(2),['\color{magenta}',yp(i)]);
end