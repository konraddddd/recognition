close all; clear all;

dwieFale = imread('obrazki/dwieFale.bmp');

[A P] = FourierTransform2d(dwieFale);
[Arc Prc] = fftColsfftRows(dwieFale);
[Acr Pcr] = fftRowsfftCols(dwieFale);


figure('name', 'Matlab Fourier')
subplot(3,1,1)
imshow(dwieFale,[]);
title('Input img');
subplot(3,1,2)
imshow(A,[]);
title('Amplituda');
subplot(3,1,3)
imshow(P,[]);
title('Faza');

figure('name', ' Fourier Rows->Cols')
subplot(3,1,1)
imshow(dwieFale,[]);
title('Input img');
subplot(3,1,2)
imshow(Arc,[]);
title('Amplituda rc');
subplot(3,1,3)
imshow(Prc,[]);
title('Faza rc');

figure('name', 'Fourier cols->rows')
subplot(3,1,1)
imshow(dwieFale,[]);
title('Input img');
subplot(3,1,2)
imshow(Acr,[]);
title('Amplituda cr');
subplot(3,1,3)
imshow(Pcr,[]);
title('Faza cr');

figure('name', ' Pokaz roznice amplitud')
subplot(3,1,1)
imshow(A-Arc)
title('Amplituda matlaba - amplituda row->cols')
subplot(3,1,2)
imshow(A-Acr)
title('Amplituda matlaba - amplituda cols->row')
subplot(3,1,3)
imshow(Acr-Arc)
title('amplituda cols->row - amplituda row->cols')


figure('name', ' Pokaz roznice faz')
subplot(3,1,1)
imshow(P-Prc)
title('Faza matlaba - Faza row->cols')
subplot(3,1,2)
imshow(P-Pcr)
title('Faza matlaba - Faza cols->row')
subplot(3,1,3)
imshow(Pcr-Prc)
title('Faza cols->row - Faza row->cols')


%%%%% Transformata 2d jest z³o¿eniem transformat 1d, jednak z powodu
% bledów numerycznych s¹ "niewielkie" róznice
