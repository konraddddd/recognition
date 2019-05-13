close all;
clear all;

image = imread('ksztalty.bmp');
image8 = bwlabel(image,8);

[X Y] = size(image8);

wsp = obliczWspolczynniki(image8);
figure(1)
imshow(image8,[])
r = regionprops(image8,'Centroid');
for i=1:length(r)
    text(r(i).Centroid(1),r(i).Centroid(2),['\color{magenta}',num2str(i)]);
end
figure(2)

kola = image8;
for i=1:Y
    for j=1:X
    piksel = kola(i,j);
    if piksel ~= 0 && ~(wsp(piksel,1) > 0.73 && wsp(piksel,1) < 0.86)
     kola(i,j) = 0;
    end
    end
end
imshow(kola,[])
title('same kola')

figure(3)
kwadraty = image8;
for i=1:Y
    for j=1:X
    piksel = kwadraty(i,j);
    if piksel ~= 0 && ~(wsp(piksel,2) > 0.8 && wsp(piksel,2) < 0.96)
     kwadraty(i,j) = 0;
    end
    end
end
imshow(kwadraty,[])
title('same kwadraty')
