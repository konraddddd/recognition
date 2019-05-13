function [ output_args ] = unsharp_mask( image,k )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
image_cpy = image;
image_blurred = imgaussfilt(image_cpy,5);
image_mask = image_cpy - image_blurred;

output_image = image_cpy + k*image_mask;
figure()
subplot(1,4,1)
imshow(image);
title('Input image')
subplot(1,4,2)
imshow(image_blurred,[])
title('rozmyty')
subplot(1,4,3)
imshow(image_mask,[])
title('maska')
subplot(1,4,4)
imshow(output_image,[])
title('rezultat')




end

