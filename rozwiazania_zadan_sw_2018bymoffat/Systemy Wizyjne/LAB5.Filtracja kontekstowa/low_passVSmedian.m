function [] = low_passVSmedian( image, mask_size,figure_name )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
average_mask = fspecial('average',mask_size);
filtred_image_average = uint8(conv2(image,average_mask,'same'))

filtred_image_median = medfilt2(image,[mask_size mask_size]);

figure('name',figure_name)
subplot(2,3,1);
imshow(image);
title('Basic');
subplot(2,3,2);
imshow(filtred_image_average);
title('Filtred average')
subplot(2,3,3);
imshow(imabsdiff(image,filtred_image_average),[]);
title('imabsdiff');
subplot(2,3,4);
imshow(image);
title('Basic')
subplot(2,3,5)
imshow(filtred_image_median);
title('Filtred median');
subplot(2,3,6);
imshow(imabsdiff(image,filtred_image_median),[]);
title('imabsdiff')

end

