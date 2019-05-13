close all;
clear all;

calc = imread('Pliki/calculator.png');

SE = ones(1,71);

calc_open = imopen(calc,SE);

calc_erozja = imerode(calc,SE);
calc_reko = imreconstruct(calc_erozja,calc);

figure('name','otwarcia')
subplot(3,1,1)
imshow(calc)
title('input image')
subplot(3,1,2)
imshow(calc_open)
title('otwarcie klasyczne')
subplot(3,1,3)
imshow(calc_reko)
title('otwarcie przez rekonstrukcje')

calc_minus_tlo = calc - calc_reko;
calc_imtp = imtophat(calc,SE);

figure('name','bez tla')
subplot(2,1,1)
imshow(calc_minus_tlo)
title('Odejmowanie')
subplot(2,1,2)
imshow(calc_imtp)
title('imtophat')

SE2 =   ones(1,11);

calc_erozja2 = imerode(calc_minus_tlo,SE2);
calc_pre_result = imreconstruct(calc_erozja2,calc_minus_tlo);

figure('name', 'problem z pionowymi elementami')
imshow(calc_pre_result)

SE3 = ones(1,21);

calc_dil = imdilate(calc_pre_result,SE3);

final_result = imreconstruct(min(calc_dil,calc_minus_tlo),calc_minus_tlo);
figure('name','result')
imshow(final_result)