close all;
clear all;

image = zeros(11,11)
% image(3,5) = 1;
% image(3,4) = 1;
% image(3,3) = 1;


image(1,1)=1;
image(2,1)=1;
image(4,1)=1;

[H,theta, rho] = hough(image,'RhoResolution',0.1,'ThetaResolution',0.5);

figure(1)
imshow(H,[]);

