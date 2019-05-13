close all;
clear all;

image = imread('test1.jpg');

%% Zmiana kolorystyki obrazu, i jego zniekszta³cenie

imageHSV = rgb2hsv(image);

imageH = imageHSV(:,:,1);
imageS = imageHSV(:,:,2);
imageV = imageHSV(:,:,3);

figure('Name','Obraz Kolorowy HSV');
imshow(imageHSV)

%% Poszczegolne skladowe
figure('Name','Poszczegolne Skladowe')
subplot(1,3,1)
imshow(imageH)
title('H')
subplot(1,3,2)
imshow(imageS)
title('S')
subplot(1,3,3)
imshow(imageV)
title('V')

%% Histogramy
figure('Name','Histogramy')
subplot(1,3,1)
imhist(imageH,256);
imageHQ = histeq(imageH,256);

imageSQ = histeq(imageS,256);
subplot(1,3,2)
imhist(imageS,256);

imageVQ = histeq(imageV,256);
subplot(1,3,3)
imhist(imageV,256);


%% Normalizacja
obraz2EQ = imageHSV;
obraz2EQ(:,:,1) = imageHQ;
obraz2EQ(:,:,2) = imageSQ;
obraz2EQ(:,:,3) = imageVQ;

obraz2EQ = hsv2rgb(obraz2EQ);

% figure('name','Histogram wyrównany w kolorze HSV/Normalized')
% imshow(obraz2EQ)
%% Binaryzacja
 imbin=(imageHQ>0.90)&(imageSQ>0.90);
figure('Name','Binaryzacja')
imshow(imbin)

%% Circle finder Find circles using circular Hough transform
Rmin = 100;
Rmax = 400;

[centers, rad] = imfindcircles(imbin,[Rmin Rmax],'ObjectPolarity','bright');
l='centre:'+string(centers(1))+' '+string(centers(2))+' radius: '+string(rad);

viscircles(centers, rad,'Color','b');
title(l);

%% GENETIC ALGORITHM
%% Initialization

L=20
r=0.4

noise_power=1;
best=0.3;
generation=zeros(3,L);
noise = wgn(3,r*L,noise_power);
radius_scale=1.2
s=size(imbin);
points_density=0.1;

for i=1:r*L
    generation(1,i)=centers(1)+noise(1,i);
    generation(2,i)=centers(2)+noise(2,i);
    generation(3,i)=rand()*min([generation(1,i),s(1),s(2),generation(2,i)]);
     
    viscircles(generation(1:2,i)', generation(3,i),'Color','r');
end

for i=r*L:L
    generation(3,i)=rand()*rad*radius_scale;
    generation(1,i)=rand()*s(2);
    
    if(generation(1,i)<generation(3,i))
        generation(1,i)=generation(3,i)+1;
%         print('1');
    end
    if(generation(1,i)>s(2)-generation(3,i));
        generation(1,i)=s(2)-generation(3,i)-1;
%         print('1');
    end
     
    generation(2,i)=rand()*s(1);
    
    if(generation(2,i)<generation(3,i))
        generation(2,i)=generation(3,i)+1;
%         print('1');
    end
    if(generation(2,i)>s(1)-generation(3,i));
        generation(2,i)=s(1)-generation(3,i)-1;
%         print('1');
    end
    
    viscircles(generation(1:2,i)', generation(3,i),'Color','r');
end

%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
for k=1:15
%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%

%% Valuation
% figure()
hold on
G=zeros(2,L);
for i=1:L
    X=generation(1,i);
    Y=generation(2,i);
    R=generation(3,i);
    points1=round([cos(0:points_density:2*pi)*R+X;sin(0:points_density:2*pi)*R+Y]);
    plot(points1(1,:), points1(2,:),'y')
    R=0.94*R;
    points2=round([cos(0:points_density:2*pi)*R+X;sin(0:points_density:2*pi)*R+Y]);
    plot(points2(1,:), points2(2,:),'g')
    R=0.94*R;
    points3=round([cos(0:points_density:2*pi)*R+X;sin(0:points_density:2*pi)*R+Y]);
    plot(points3(1,:), points3(2,:),'b')
    R=0.94*R;
    points4=round([cos(0:points_density:2*pi)*R+X;sin(0:points_density:2*pi)*R+Y]);
    plot(points4(1,:), points4(2,:),'b')
    R=0.94*R;
    points5=round([cos(0:points_density:2*pi)*R+X;sin(0:points_density:2*pi)*R+Y]);
    plot(points5(1,:), points5(2,:),'b')
    grade=0;
    
    for j=1:length(points1)
        if(points1(2,j)==0)
            points1(2,j)=1;
        end
        if(points1(1,j)==0)
            points1(1,j)=1;
        end
        grade=grade+imbin(points1(2,j),points1(1,j));
        
    end
    
    for j=1:length(points2)
        if(points2(2,j)==0)
            points2(2,j)=1;
        end
        if(points2(1,j)==0)
            points2(1,j)=1;
        end
        grade=grade+imbin(points2(2,j),points2(1,j));
        
    end
    
    for j=1:length(points3)
        if(points3(2,j)==0)
            points3(2,j)=1;
        end
        if(points3(1,j)==0)
            points3(1,j)=1;
        end
        grade=grade+imbin(points3(2,j),points3(1,j));
        
    end
    for j=1:length(points4)
        if(points4(2,j)==0)
            points4(2,j)=1;
        end
        if(points4(1,j)==0)
            points4(1,j)=1;
        end
        grade=grade-imbin(points4(2,j),points4(1,j));
        
    end
    for j=1:length(points5)
        if(points5(2,j)==0)
            points5(2,j)=1;
        end
        if(points5(1,j)==0)
            points5(1,j)=1;
        end
        grade=grade-imbin(points5(2,j),points5(1,j));
        
    end
    
     G(:,i)=[grade,i];
%     grade=imbin(points1)+imbin(points1)+imbin(points1)
%     plot(points(1,:), points(2,:))
end

%% Selection
G_sorted=sortrows(G',1);
G_sorted=G_sorted';

bestofgeneration=zeros(3,best*L);
figure()
imshow(imbin)

for i=1:best*L
    bestofgeneration(1,i)=generation(1,G_sorted(2,L-i+1));
    bestofgeneration(2,i)=generation(2,G_sorted(2,L-i+1));
    bestofgeneration(3,i)=generation(3,G_sorted(2,L-i+1));
    G_sorted(2,i)
    viscircles(bestofgeneration(1:2,i)', bestofgeneration(3,i),'Color','r');
    
end



%% Crossover

newgeneration=zeros(3,best*L);

for i=1:L
    newgeneration(1,i)=bestofgeneration(1,(1+floor(rand()*6)));
    newgeneration(2,i)=bestofgeneration(2,(1+floor(rand()*6)));
    newgeneration(3,i)=bestofgeneration(3,(1+floor(rand()*6)));
    viscircles(newgeneration(1:2,i)', newgeneration(3,i),'Color','g')
    
end

%% Mutation

for i=1:L
    newgeneration(1,i)=abs(newgeneration(1,i)+rand()*50-rand()*50);
    newgeneration(2,i)=abs(newgeneration(2,i)+rand()*50-rand()*50);
    newgeneration(3,i)=abs(newgeneration(3,i)+rand()*10-rand()*10);
    
    
    
    if(newgeneration(1,i)<newgeneration(3,i))
        newgeneration(1,i)=newgeneration(3,i)+2;
%         print('1');
    end
    if(newgeneration(1,i)>s(2)-newgeneration(3,i));
        newgeneration(1,i)=s(2)-newgeneration(3,i)-2;
%         print('1');
    end
     

    
    if(newgeneration(2,i)<newgeneration(3,i))
        newgeneration(2,i)=newgeneration(3,i)+2;
%         print('1');
    end
    if(newgeneration(2,i)>s(1)-newgeneration(3,i));
        newgeneration(2,i)=s(1)-newgeneration(3,i)-2;
%         print('1');
    end
   
    viscircles(newgeneration(1:2,i)', newgeneration(3,i),'Color','b');
    
    
    
end

generation=newgeneration;
%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%
end

figure()
imshow(image);
for i=1:best*L
    viscircles(bestofgeneration(1:2,i)', bestofgeneration(3,i),'Color','r'); 
end
