function [ ] = operacje_morfologiczne( image )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
SE = strel('square',3)
erozja = imerode(image,SE);
dylatacja = imdilate(image,SE);
otwarcie = imopen(image,SE);
zamkniecie = imclose(image,SE);

figure()
subplot(5,1,1)
imshow(image)
title('obraz')
subplot(5,1,2)
imshow(erozja)
title('erozja')
subplot(5,1,3)
imshow(dylatacja)
title('dylatacja')
subplot(5,1,4)
imshow(otwarcie)
title('otwarcie')
subplot(5,1,5)
imshow(zamkniecie);
title('zamkniecie')


end