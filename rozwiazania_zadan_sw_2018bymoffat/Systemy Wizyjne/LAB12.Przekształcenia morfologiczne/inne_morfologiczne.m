close all;
clear all;


fingerprint = imread('pliki/fingerprint.bmp');

figure('name','sciesnianie')
subplot(4,1,1)
imshow(fingerprint)
subplot(4,1,2)
n1 = bwmorph(fingerprint,'thin',1);
imshow(n1);
subplot(4,1,3)
n2 = bwmorph(fingerprint,'thin',2);
imshow(n2);
subplot(4,1,4)
nINF = bwmorph(fingerprint,'thin',Inf);
imshow(n2);




kosc = imread('pliki/kosc.bmp');
figure('name','szkieletyzacja')
subplot(2,1,1)
imshow(kosc)
subplot(2,1,2)
szkiel = bwmorph(kosc,'skel',Inf);
% szkiel = medfilt2(szkiel);
imshow(szkiel)


text = imread('pliki/text.png');
SE = ones(51,1);
text_otwarcie = imopen(text,SE);
figure()
subplot(2,1,1)
imshow(text_otwarcie)

text_rek = imreconstruct(imerode(text,SE),text);
subplot(2,1,2)
imshow(text_rek)

figure('name','wypelnianie dziur')
imshow(imfill(text,'holes'),[]);



figure('name','czyszczenie brzegow')
imshow(imclearborder(text),[]);