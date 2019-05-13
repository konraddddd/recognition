close all;
clear all;
load maskiPP.mat

img = imread('Pliki/lab112.bmp');
img = rgb2gray(img);

figure('name', 'Input img')
imshow(img)

BW = im2bw(img,32/255);


figure('name','zbinaryzowany');
imshow(BW)

BW = uint8(255*BW);


% SE = ones (1,3);
kwadraty = medfilt2(BW,[1 8])

SE = [0 0 0;1 1 1;0 0 0]

kwadraty = imerode(kwadraty,SE);

figure('name', 'same kwadraty')
imshow(kwadraty)




k1 = conv2(kwadraty,R2,'same');
k1 = abs(k1);

k2 = conv2(kwadraty,R1,'same');
k2 = abs(k2);

krawedzie = k1 | k2;
krawedzie = imclearborder(krawedzie);
krawedzie = double(255*krawedzie)

figure('name', 'krawedzie')
imshow(krawedzie);


[H theta rho] = hough(krawedzie);

figure('name', 'przestrzen H')
imshow(H,[])

peaks = houghpeaks(H,8);

lines = houghlines(krawedzie,theta,rho,peaks);


figure, imshow(img), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end



