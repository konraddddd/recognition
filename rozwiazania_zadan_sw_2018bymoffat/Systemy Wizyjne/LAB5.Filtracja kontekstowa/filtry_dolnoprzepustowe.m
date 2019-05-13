clear all;
close all;

plansza = imread('archiwum_filtracja/plansza.tif');
plot_conv2(plansza,3,'3x3');
plot_conv2(plansza,5,'5x5');
plot_conv2(plansza,9,'9x9');
plot_conv2(plansza,15,'15x15');
plot_conv2(plansza,35,'35x35');
%Modu³ z ró¿nicy zawiera krawiêdzie, zmienia wartoœci bia³e -> czarne i
%odwrotnie, pomaga usun¹c zak³ócenia 

lena  = imread('archiwum_filtracja/lena.bmp');
plot_conv2(lena,3,'l3x3');
plot_conv2(lena,5,'l5x5');
plot_conv2(lena,9,'l9x9');
plot_conv2(lena,15,'l15x15');
plot_conv2(lena,35,'l35x35');


%%% Maska M
M = [1 2 1; 2 4 2; 1 2 1]; 
M = M/sum(sum(M));

filtred_lena_M = uint8(conv2(lena,M,'same'));
figure('name','M-Mask')
subplot(3,1,1);
imshow(lena)
title('Basic')
subplot(3,1,2)
imshow(filtred_lena_M)
title('Filtred')
subplot(3,1,3)
imshow(imabsdiff(lena,filtred_lena_M),[])
title('imabsdiff')


%%%% Maska Gaussa
figure('name','gauss mask')

gauss_mask = fspecial('gaussian',5);
mesh(gauss_mask);
filtred_lena_G = uint8(conv2(lena,gauss_mask,'same'));
figure('name','G-Mask')
subplot(3,1,1);
imshow(lena)
title('Basic')
subplot(3,1,2)
imshow(filtred_lena_G)
title('Filtred')
subplot(3,1,3)
imshow(imabsdiff(lena,filtred_lena_G),[])
title('imabsdiff')
