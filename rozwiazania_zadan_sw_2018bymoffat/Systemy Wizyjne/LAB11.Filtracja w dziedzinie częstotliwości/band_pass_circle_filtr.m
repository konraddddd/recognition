function [ image_tmp ] = band_pass_circle_filtr( image )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    image_tmp = fftshift(fft2(image));
    [f1,f2] = freqspace(512,'meshgrid');
    Hd = ones(512);
    r = sqrt(f1.^2 + f2.^2);
    Hd((r<0.1 | r>0.25)) = 0;
    image_tmp = image_tmp.*Hd;
    image_tmp = ifft2(ifftshift(image_tmp));
    figure('name','band_pass_circle_filtr_visualisation');
    colormap(jet(64));
    mesh(f1,f2,Hd);  

end