close all;
clear all;

p=imread('Pliki/lenaRGBSzumKolor.bmp');

figure
imshow(p);

R = p(:,:,1);
G = p(:,:,2);
B = p(:,:,3);

h = fspecial('average');

R=medfilt2(R,[3 3]);
G=medfilt2(G,[3 3]);
B=medfilt2(B,[3 3]);

RGB=p;

RGB(:,:,1)=R;
RGB(:,:,2)=G;
RGB(:,:,3)=B;

goodRGB=RGB;

%%HSV

p=rgb2hsv(p);

R = p(:,:,1);
G = p(:,:,2);
B = p(:,:,3);

h = fspecial('average');

R=medfilt2(R,[3 3]);
G=medfilt2(G,[3 3]);
B=medfilt2(B,[3 3]);


RGB=p;

RGB(:,:,1)=R;
RGB(:,:,2)=G;
RGB(:,:,3)=B;

goodHSV=RGB;


figure
subplot(1,2,1);imshow(goodRGB);title('median rgb');
subplot(1,2,2);imshow(hsv2rgb(goodHSV));title('median hsv');