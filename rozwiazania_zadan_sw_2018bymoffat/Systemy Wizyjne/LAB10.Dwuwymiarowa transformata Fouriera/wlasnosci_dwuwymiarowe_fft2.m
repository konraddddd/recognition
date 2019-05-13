close all;
clear all;

kwadrat = imread('obrazki/kwadrat.bmp');
kwadratT = imread('obrazki/kwadratT.bmp');
kwadrat45 = imread('obrazki/kwadrat45.bmp');
kwadratS = imread('obrazki/kwadratS.bmp');
kwadratKL = imread('obrazki/kwadratKL.bmp');

[Akwadrat PHkwadrat] = FourierTransform2d(kwadrat);
[AkwadratT PHkwadratT] = FourierTransform2d(kwadratT);


figure('name', 'badanie wyp造wu translacji');
subplot(3,2,1)
imshow(kwadrat,[])
title('Imput img')
subplot(3,2,2)
imshow(kwadratT,[])
title('kwadratT')
subplot(3,2,3)
imshow(Akwadrat,[])
title('Amplituda kwadratu')
subplot(3,2,4)
imshow(AkwadratT,[])
title('Amplituda kwadratuT')
subplot(3,2,5)
imshow(PHkwadrat,[])
title('Faza kwadratu')
subplot(3,2,6)
imshow(PHkwadratT,[])
title('Faza kwadratuT')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[Akwadrat45 PHkwadrat45] = FourierTransform2d(kwadrat45);


figure('name', 'badanie wyp造wu rotacji');
subplot(3,2,1)
imshow(kwadrat,[])
title('Imput img')
subplot(3,2,2)
imshow(kwadrat45,[])
title('kwadrat45')
subplot(3,2,3)
imshow(Akwadrat,[])
title('Amplituda kwadratu')
subplot(3,2,4)
imshow(Akwadrat45,[])
title('Amplituda kwadratu45')
subplot(3,2,5)
imshow(PHkwadrat,[])
title('Faza kwadratu')
subplot(3,2,6)
imshow(PHkwadrat45,[])
title('Faza kwadratu45')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[AkwadratS PHkwadratS] = FourierTransform2d(kwadratS);


figure('name', 'badanie wyp造wu zmiany rozmiaru');
subplot(3,2,1)
imshow(kwadrat,[])
title('Imput img')
subplot(3,2,2)
imshow(kwadratS,[])
title('kwadratS')
subplot(3,2,3)
imshow(Akwadrat,[])
title('Amplituda kwadratu')
subplot(3,2,4)
imshow(AkwadratS,[])
title('Amplituda kwadratuS')
subplot(3,2,5)
imshow(PHkwadrat,[])
title('Faza kwadratu')
subplot(3,2,6)
imshow(PHkwadratS,[])
title('Faza kwadratuS')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[AkwadratKL PHkwadratKL] = FourierTransform2d(kwadratKL);


figure('name', 'badanie wyp造wu kombinacji liniowej');
subplot(3,2,1)
imshow(kwadrat,[])
title('Imput img')
subplot(3,2,2)
imshow(kwadratKL,[])
title('kwadratKL')
subplot(3,2,3)
imshow(Akwadrat,[])
title('Amplituda kwadratu')
subplot(3,2,4)
imshow(AkwadratKL,[])
title('Amplituda kwadratuKL')
subplot(3,2,5)
imshow(PHkwadrat,[])
title('Faza kwadratu')
subplot(3,2,6)
imshow(PHkwadratKL,[])
title('Faza kwadratuKL')
