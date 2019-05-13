function [ image_tmp ] = hight_pass_circle_filtrHanning( image )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    image_tmp = fftshift(fft2(image));
    [f1,f2] = freqspace(512,'meshgrid');
    Hd = ones(512);
    r = sqrt(f1.^2 + f2.^2);
    Hd((r<0.1)) = 0;
    h = fwind1(Hd,hanning(21));
    [H f1 f2] = freqz2(h,512,512);
    image_tmp = image_tmp.*H;
    image_tmp = ifft2(ifftshift(image_tmp));
    figure('name','high_pass_circle_filtr_visualisationHANNING');
    colormap(jet(64));
    mesh(f1,f2,H);  

end