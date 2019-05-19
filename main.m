close all;
clear all;

image = imread('test6.jpg');

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


%% Binaryzacja
imbin=(imageSQ>0.9);%(imageHQ>0.90)&(imageSQ>0.90);
s=size(imbin);
figure('Name','Binaryzacja')
imshow(imbin)

%% Circle finder Find circles using circular Hough transform
Rmin = floor(min(s)/8);
Rmax = floor(min(s)/2);

[centers, rad] = imfindcircles(imbin,[Rmin Rmax],'ObjectPolarity','bright');

viscircles(centers, rad,'Color','b');

%% GENETIC ALGORITHM
%% Initialization

L=30;
r=0.5;

noise_power=1;
best=0.2;
generation=zeros(3,L);
noise = wgn(3,r*L,noise_power);
% radius_scale=1.2

points_density=0.1;
s2=size(centers);

for j=1:s2(1)
for i=floor(r*L/s2(1)*(j-1)+1):r*L/s2(1)*j
    
    generation(1,i)=centers(j,1)+noise(1,i);%!!!!!!!!!!!!!!!!!!!
    generation(2,i)=centers(j,2)+noise(2,i);%!!!!!!!!!!!!!!!!!!!!
    generation(3,i)=rand()*min([abs(generation(1,i)-s(2)),abs(generation(2,i)-s(1)),generation(1,i),generation(2,i)]);
    
%     disp([s(1),s(2),generation(1,i),generation(2,i),generation(1,i)-s(2)/2,generation(2,i)-s(1)/2,min([abs(generation(1,i)-s(2)/2),abs(generation(2,i)-s(1)/2)])]);
     
    viscircles(generation(1:2,i)', generation(3,i),'Color','r');
end
end

for i=r*L:L
    generation(3,i)=rand()*min(s)/2;
    generation(1,i)=generation(3,i)+rand()*(s(2)-2*generation(3,i));
    generation(2,i)=generation(3,i)+rand()*(s(1)-2*generation(3,i));
    
    
    viscircles(generation(1:2,i)', generation(3,i),'Color','r');
end
%
%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
for k=1:20
%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%

%% Valuation
% figure()
figure('Name','Binaryzacja')
imshow(imbin)
hold on
G=zeros(2,L);
for i=1:L
    X=generation(1,i);
    Y=generation(2,i);
    R=generation(3,i);
    
    points1=round([cos(0:points_density:2*pi)*R+X;sin(0:points_density:2*pi)*R+Y]);
%      plot(points1(1,:), points1(2,:),'g','LineWidth',3
R1=R;
    R=0.94*R;
    points2=round([cos(0:points_density:2*pi)*R+X;sin(0:points_density:2*pi)*R+Y]);
%      plot(points2(1,:), points2(2,:),'g','LineWidth',3)
    R=0.94*R;
    points3=round([cos(0:points_density:2*pi)*R+X;sin(0:points_density:2*pi)*R+Y]);
%      plot(points3(1,:), points3(2,:),'g','LineWidth',3)
    R=0.94*R;
    points4=round([cos(0:points_density:2*pi)*R+X;sin(0:points_density:2*pi)*R+Y]);
%      plot(points4(1,:), points4(2,:),'r','LineWidth',3)
    R=0.94*R;
    points5=round([cos(0:points_density:2*pi)*R+X;sin(0:points_density:2*pi)*R+Y]);
%      plot(points5(1,:), points5(2,:),'r','LineWidth',3)
    grade=0;
    
    
    for j=1:length(points1)
        if(points1(2,j)==0)
            points1(2,j)=1;
        end
        if(points1(1,j)==0)
            points1(1,j)=1;
        end
        grade=grade+8*imbin(points1(2,j),points1(1,j));
        
    end
    
    for j=1:length(points2)
        if(points2(2,j)==0)
            points2(2,j)=1;
        end
        if(points2(1,j)==0)
            points2(1,j)=1;
        end
        grade=grade+4*imbin(points2(2,j),points2(1,j));
        
    end
    
    for j=1:length(points3)
        if(points3(2,j)==0)
            points3(2,j)=1;
        end
        if(points3(1,j)==0)
            points3(1,j)=1;
        end
        grade=grade+2*imbin(points3(2,j),points3(1,j));
        
    end
    for j=1:length(points4)
        if(points4(2,j)==0)
            points4(2,j)=1;
        end
        if(points4(1,j)==0)
            points4(1,j)=1;
        end
        grade=grade-2*imbin(points4(2,j),points4(1,j));
        
    end
    for j=1:length(points5)
        if(points5(2,j)==0)
            points5(2,j)=1;
        end
        if(points5(1,j)==0)
            points5(1,j)=1;
        end
        grade=grade-2*imbin(points5(2,j),points5(1,j));
        
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
cross_tres=0.5;
newgeneration=bestofgeneration;

for i=best*L:cross_tres*L
    newgeneration(1,i)=bestofgeneration(1,(1+floor(rand()*best*L)));
    newgeneration(2,i)=bestofgeneration(2,(1+floor(rand()*best*L)));
    newgeneration(3,i)=min([newgeneration(1,i),newgeneration(2,i),abs(newgeneration(1,i)-s(2)),abs(newgeneration(2,i)-s(1)),bestofgeneration(3,(1+floor(rand()*best*L)))]);
    
    viscircles(newgeneration(1:2,i)', newgeneration(3,i),'Color','g')
    
end

%% Others

for i=cross_tres*L:L
    newgeneration(3,i)=rand()*min(s)/2;
    newgeneration(1,i)=newgeneration(3,i)+rand()*(s(2)-2*newgeneration(3,i));
    newgeneration(2,i)=newgeneration(3,i)+rand()*(s(1)-2*newgeneration(3,i));
    
    viscircles(newgeneration(1:2,i)', newgeneration(3,i),'Color','y')
    
end

%% Mutation

for i=best*L:L
    newgeneration(1,i)=abs(newgeneration(1,i)+rand()*10-rand()*10);
    newgeneration(2,i)=abs(newgeneration(2,i)+rand()*10-rand()*10);
    newgeneration(3,i)=abs(newgeneration(3,i)+rand()*10-rand()*10);
    
   
    newgeneration(1,i)=min([s(2)-2,abs(newgeneration(1,i)+rand()*10-rand()*10)]);
    newgeneration(2,i)=min([s(1)-2,abs(newgeneration(2,i)+rand()*10-rand()*10)]);
    
    newgeneration(1,i)=max([1,abs(newgeneration(1,i)+rand()*10-rand()*10)]);
    newgeneration(2,i)=max([1,abs(newgeneration(2,i)+rand()*10-rand()*10)]);
    
    
    
    newgeneration(3,i)=min([newgeneration(1,i),newgeneration(2,i),abs(newgeneration(1,i)-s(2)),abs(newgeneration(2,i)-s(1)),newgeneration(3,i)]);
  
    
    
    viscircles(newgeneration(1:2,i)', newgeneration(3,i),'Color','b');
    
    if(newgeneration(3,i)>newgeneration(2,i))
        disp("ERROR")
    end
    
    if(newgeneration(3,i)>newgeneration(1,i))
        disp("ERROR")
    end
    
    
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
