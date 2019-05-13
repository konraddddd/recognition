function [] = plot_conv2( image,size_of_mask,figure_name )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
average = fspecial('average',size_of_mask);
filtred_image = conv2(image,average,'same');
filtred_image = uint8(filtred_image);
figure('name',figure_name)
subplot(3,1,1);
imshow(image)
title('Basic')
subplot(3,1,2)
imshow(filtred_image)
title('Filtred')
subplot(3,1,3)
imshow(imabsdiff(image,filtred_image),[])
title('imabsdiff')
end

