close all; 
clear all;


kw = imread('archiwum_filtracja/kw.bmp');
load ('archiwum_filtracja/maskiPP.mat');

%Maska R1
kwR1 = conv2(kw,R1, 'same');
kwR1 = uint8(kwR1);

kwR1_128 = kwR1 + 128;
kwR1_abs = abs(kwR1);

figure('Name', 'R1')
subplot(1,3,1)
imshow(kw)
title('Basic')
subplot(1,3,2)
imshow(kwR1_128,[])
title('128')
subplot(1,3,3)
imshow(kwR1_abs,[])
title('abs')






%Maska R2
kwR2 = conv2(kw,R2, 'same');
kwR2 = uint8(kwR2);

kwR2_128 = kwR2 + 128;
kwR2_abs = abs(kwR2);

figure('Name', 'R2')
subplot(1,3,1)
imshow(kw)
title('Basic')
subplot(1,3,2)
imshow(kwR2_128,[])
title('128')
subplot(1,3,3)
imshow(kwR2_abs,[])
title('abs')


%Maska P1
kwP1 = conv2(kw,P1, 'same');
kwP1 = uint8(kwP1);

kwP1_128 = kwP1 + 128;
kwP1_abs = abs(kwP1);

figure('Name', 'P1')
subplot(1,3,1)
imshow(kw)
title('Basic')
subplot(1,3,2)
imshow(kwP1_128,[])
title('128')
subplot(1,3,3)
imshow(kwP1_abs,[])
title('abs')

%Maska P2
kwP2 = conv2(kw,P2, 'same');
kwP2 = uint8(kwP2);

kwP2_128 = kwP2 + 128;
kwP2_abs = abs(kwP2);

figure('Name', 'P2')
subplot(1,3,1)
imshow(kw)
title('Basic')
subplot(1,3,2)
imshow(kwP2_128,[])
title('128')
subplot(1,3,3)
imshow(kwP2_abs,[])
title('abs')


%Maska S1
kwS1 = conv2(kw,S1, 'same');
kwS1 = uint8(kwS1);

kwS1_128 = kwS1 + 128;
kwS1_abs = abs(kwS1);

figure('Name', 'S1')
subplot(1,3,1)
imshow(kw)
title('Basic')
subplot(1,3,2)
imshow(kwS1_128,[])
title('128')
subplot(1,3,3)
imshow(kwS1_abs,[])
title('abs')


%Maska S2
kwS2 = conv2(kw,S2, 'same');
kwS2 = uint8(kwS2);

kwS2_128 = kwS2 + 128;
kwS2_abs = abs(kwS2);

figure('Name', 'S2')
subplot(1,3,1)
imshow(kw)
title('Basic')
subplot(1,3,2)
imshow(kwS2_128,[])
title('128')
subplot(1,3,3)
imshow(kwS2_abs,[])
title('abs')

%Kombinowany SQRT
kwSQRT = sqrt(conv2(kw,S1, 'same').^2 + conv2(kw,S2, 'same').^2);
kwSQRT = uint8(kwSQRT);

kwSQRT_128 = kwSQRT + 128;
kwSQRT_abs = abs(kwSQRT);

figure('Name', 'SQRT')
subplot(1,3,1)
imshow(kw)
title('Basic')
subplot(1,3,2)
imshow(kwSQRT_128,[])
title('128')
subplot(1,3,3)
imshow(kwSQRT_abs,[])
title('abs')


%Kombinowany abs
kwABS = abs(conv2(kw,S1, 'same'))+ abs(conv2(kw,S2, 'same'));
kwABS = uint8(kwABS);

kwABS_128 = kwABS + 128;
kwABS_abs = abs(kwABS);

figure('Name', 'ABS')
subplot(1,3,1)
imshow(kw)
title('Basic')
subplot(1,3,2)
imshow(kwABS_128,[])
title('128')
subplot(1,3,3)
imshow(kwABS_abs,[])
title('abs')