function [ Amp Ph] = FourierTransform2d( image )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
imageF = fft2(image);
imageF = fftshift(imageF);

Amp = abs(imageF);
Amp = log10(Amp+1);

Ph = angle(imageF.*(Amp>0.0001));
end

