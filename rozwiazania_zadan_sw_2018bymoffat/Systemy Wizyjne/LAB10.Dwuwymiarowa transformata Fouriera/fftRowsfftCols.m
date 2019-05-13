function [ Amp Ph ] = fftRowsfftCols( image )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
F1= fft(image,[],1);
F2=fft(F1,[],2);
F2 = fftshift(F2);

Amp = abs(F2);
Amp = log10(Amp+1);

Ph = angle(F2.*(Amp>0.0001));


end

