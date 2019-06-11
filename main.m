close all;
clear all;

image = imread('test16.jpg');
%imshow(image)
%% Poszczegolne skladowe


R = image(:,:,1);
G = image(:,:,2);
B = image(:,:,3);
%figure('Name','Poszczegolne Skladowe')
subplot(1,3,1)
%imshow(R)
title('R')

subplot(1,3,2)
%imshow(G)
title('G')
subplot(1,3,3)
%imshow(B)
title('B')



%% Zmiana kolorystyki obrazu, i jego zniekszta³cenie

imageHSV = rgb2hsv(image);

imageH = imageHSV(:,:,1);
imageS = imageHSV(:,:,2);
imageV = imageHSV(:,:,3);

%figure('Name','Obraz Kolorowy HSV');
%imshow(imageHSV)

%% Poszczegolne skladowe
%figure('Name','Poszczegolne Skladowe')
subplot(1,3,1)
%imshow(imageH)
title('H')

subplot(1,3,2)
%imshow(imageS)
title('S')
subplot(1,3,3)
%imshow(imageV)
title('V')
%% Sharpening

imageH = imsharpen(imageH);
imageS = imsharpen(imageS);
imageV = imsharpen(imageV);


%figure('Name','Poszczegolne Skladowe - sharpened')
subplot(1,3,1)
%imshow(imageH)
title('H')

subplot(1,3,2)
%imshow(imageS)
title('S')
subplot(1,3,3)
%imshow(imageV)
title('V')



%% Histogramy
%figure('Name','Histogramy')
subplot(1,3,1)
imhist(imageH,256);
imageHQ = imageH;

imageSQ =imageS;
subplot(1,3,2)
imhist(imageS,256);

imageVQ = imageV;
subplot(1,3,3)
imhist(imageV,256);

%figure()
subplot(1,2,1);
%imshow(image)


%% Binaryzacja
subplot(1,2,2);
imbin=(imageSQ>0.6&R>90&G<100&B<100);%(imageHQ>0.90)&(imageSQ>0.90);
s=size(imbin);

%imshow(imbin)
% title(["saturation > " num2str(0.3+i/5)]);



%figure()
subplot(2,3,1);
%imshow(imbin)
title("Original binary image");

%% erozja i dylatacja
imbin=imerode(imbin,[0 1 0; 1 1 1; 0 1 0]);
imbin=imdilate(imbin,[0 1 0; 1 1 1; 0 1 0]);
subplot(2,3,2);
%imshow(imbin);
title("Morphologically processed 1");

%% erozja i dylatacja
imbin=imerode(imbin,[1 1 1; 1 1 1; 1 1 1]);
imbin=imdilate(imbin,[1 1 1; 1 1 1; 1 1 1]);
subplot(2,3,3);
%imshow(imbin);
title("Morphologically processed 2");


%% erozja i dylatacja
imbin=imerode(imbin,[0 1 1 0; 1 1 1 1; 1 1 1 1;0 1 1 0]);
imbin=imdilate(imbin,[0 1 1 0; 1 1 1 1; 1 1 1 1;0 1 1 0]);
subplot(2,3,4);
%imshow(imbin);
title("Morphologically processed 3");
%% erozja i dylatacja
imbin=imerode(imbin,[0 1 0; 1 1 1; 0 1 0]);
imbin=imdilate(imbin,[0 1 0; 1 1 1; 0 1 0]);
subplot(2,3,5);
figure()
imshow(imbin);
title("Morphologically processed 4");



%% Circle finder Find circles using circular Hough transform


%figure('Name','Initial')
%imshow(imbin)
Rmin = floor(min(s)/6);
Rmax = floor(min(s)/2);


[centers, rad] = imfindcircles(imbin,[Rmin Rmax],'Sensitivity',0.98);

%viscircles(centers, rad,'Color','b');




for o=1:1



%% GENETIC ALGORITHM
%% Initialization

L=1000;
r=0.4;

noise_power=1;
best=0.3;
generation=zeros(3,L);
noise = wgn(3,int32(r*L),noise_power);
% radius_scale=1.2
cross_tres=best+0.3;
mut_tres=0.6;
points_density=0.1;
s2=size(centers);
% figure()
% imshow(imbin)
for j=1:s2(1)
    
    generation(1,floor(r*L/s2(1)*(j-1)+1))=centers(j,1);%!!!!!!!!!!!!!!!!!!!
    generation(2,floor(r*L/s2(1)*(j-1)+1))=centers(j,2);%!!!!!!!!!!!!!!!!!!!!
    generation(3,floor(r*L/s2(1)*(j-1)+1))=min([rad(j),abs(generation(1,1)-s(2)),abs(generation(2,1)-s(1)),generation(1,1),generation(2,1)]);
%     viscircles(generation(1:2,floor(r*L/s2(1)*(j-1)+1))', generation(3,floor(r*L/s2(1)*(j-1)+1)),'Color','r');
    for i=floor(r*L/s2(1)*(j-1)+1)+1:r*L/s2(1)*j
        
        generation(1,i)=centers(j,1);%!!!!!!!!!!!!!!!!!!!
        generation(2,i)=centers(j,2);%!!!!!!!!!!!!!!!!!!!!
        generation(3,i)=rand()*min([abs(generation(1,i)-s(2)),abs(generation(2,i)-s(1)),generation(1,i),generation(2,i)]);
        
        %     disp([s(1),s(2),generation(1,i),generation(2,i),generation(1,i)-s(2)/2,generation(2,i)-s(1)/2,min([abs(generation(1,i)-s(2)/2),abs(generation(2,i)-s(1)/2)])]);
        
%         viscircles(generation(1:2,i)', generation(3,i),'Color','r');
    end
end

for i=int32(r*L:L)
    generation(3,i)=rand()*min(s)/2;
    generation(1,i)=generation(3,i)+rand()*(s(2)-2*generation(3,i));
    generation(2,i)=generation(3,i)+rand()*(s(1)-2*generation(3,i));
    
    
    %viscircles(generation(1:2,i)', generation(3,i),'Color','r');
end
%
%%%%%%%%%%%%%%%%%%%%%%%%%5
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%
for k=1:100
    %%%%%%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%
    %%%%%%%%%%%%%%%%%
    
    %% Valuation
%     figure()
    %figure('Name','Binaryzacja')
%     imshow(imbin)
    hold on
    G=zeros(2,L);
    for i=1:L
        X=generation(1,i);
        Y=generation(2,i);
        R=generation(3,i);
        
        points1=round([cos(0:points_density:2*pi)*R+X;sin(0:points_density:2*pi)*R+Y]);
        %      plot(points1(1,:), points1(2,:),'g','LineWidth',3)
             points1(1,:)=abs(min(points1(1,:),s(2)));
             points1(2,:)=abs(min(points1(2,:),s(1)));
        R1=R;
        R=0.94*R;
        points2=round([cos(0:points_density:2*pi)*R+X;sin(0:points_density:2*pi)*R+Y]);
        points2(1,:)=abs(min(points2(1,:),s(2)));
        points2(2,:)=abs(min(points2(2,:),s(1)));
        %        plot(points2(1,:), points2(2,:),'g','LineWidth',3)
        R=0.94*R;
        points3=round([cos(0:points_density:2*pi)*R+X;sin(0:points_density:2*pi)*R+Y]);
        points3(1,:)=abs(min(points3(1,:),s(2)));
        points3(2,:)=abs(min(points3(2,:),s(1)));
        %        plot(points3(1,:), points3(2,:),'g','LineWidth',3)
        R=0.94*R;
        points4=round([cos(0:points_density:2*pi)*R+X;sin(0:points_density:2*pi)*R+Y]);
        points4(1,:)=abs(min(points4(1,:),s(2)));
        points4(2,:)=abs(min(points4(2,:),s(1)));
        %        plot(points4(1,:), points4(2,:),'r','LineWidth',3)
        R=0.94*R;
        points5=round([cos(0:points_density:2*pi)*R+X;sin(0:points_density:2*pi)*R+Y]);
        points5(1,:)=abs(min(points5(1,:),s(2)));
        points5(2,:)=abs(min(points5(2,:),s(1)));
        %        plot(points5(1,:), points5(2,:),'r','LineWidth',3)
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
            grade=grade-4*imbin(points5(2,j),points5(1,j));
            
        end
        
        G(:,i)=[grade,i];
        %     grade=imbin(points1)+imbin(points1)+imbin(points1)
        %     plot(points(1,:), points(2,:))
    end
    
    %% Selection
    G_sorted=sortrows(G',1);
    G_sorted=G_sorted';
    
    bestofgeneration=zeros(3,int32(best*L));
    %figure()
    %imshow(imbin)
    
    for i=1:best*L
        bestofgeneration(1,i)=generation(1,G_sorted(2,L-i+1));
        bestofgeneration(2,i)=generation(2,G_sorted(2,L-i+1));
        bestofgeneration(3,i)=generation(3,G_sorted(2,L-i+1));
        G_sorted(2,i);
        %viscircles(bestofgeneration(1:2,i)', bestofgeneration(3,i),'Color','r');
        
    end
    
    
    
    %% Crossover
    
    newgeneration=bestofgeneration;
    
    for i=int32(best*L:cross_tres*L)
        newgeneration(1,i)=bestofgeneration(1,int32((1+floor(rand()*best*L))));
        newgeneration(2,i)=bestofgeneration(2,int32((1+floor(rand()*best*L))));
        newgeneration(3,i)=min([newgeneration(1,i),newgeneration(2,i),abs(newgeneration(1,i)-s(2)),abs(newgeneration(2,i)-s(1)),bestofgeneration(3,int32((1+floor(rand()*best*L))))]);
        
        %viscircles(newgeneration(1:2,i)', newgeneration(3,i),'Color','g')
        
    end
    
    %% Others
    
    for i=int32(cross_tres*L:L)
        newgeneration(3,i)=rand()*min(s)/2;
        newgeneration(1,i)=newgeneration(3,i)+rand()*(s(2)-2*newgeneration(3,i));
        newgeneration(2,i)=newgeneration(3,i)+rand()*(s(1)-2*newgeneration(3,i));
        
        %viscircles(newgeneration(1:2,i)', newgeneration(3,i),'Color','g');
        
    end
    
    %% Mutation
    
    for i=int32(mut_tres*L:L)
        newgeneration(1,i)=abs(newgeneration(1,i)+rand()*10-rand()*10);
        newgeneration(2,i)=abs(newgeneration(2,i)+rand()*10-rand()*10);
        newgeneration(3,i)=abs(newgeneration(3,i)+rand()*10-rand()*10);
        
        
        newgeneration(1,i)=min([s(2)-2,abs(newgeneration(1,i)+rand()*10-rand()*10)]);
        newgeneration(2,i)=min([s(1)-2,abs(newgeneration(2,i)+rand()*10-rand()*10)]);
        
        newgeneration(1,i)=max([1,abs(newgeneration(1,i)+rand()*10-rand()*10)]);
        newgeneration(2,i)=max([1,abs(newgeneration(2,i)+rand()*10-rand()*10)]);
        
        
        
        newgeneration(3,i)=min([newgeneration(1,i),newgeneration(2,i),abs(newgeneration(1,i)-s(2)),abs(newgeneration(2,i)-s(1)),newgeneration(3,i)]);
        
        
        
        %viscircles(newgeneration(1:2,i)', newgeneration(3,i),'Color','b');
        
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

figure(100)
% subplot(1,3,o);
imshow(image);
% title(["Mutation percentage =" num2str(o*0.3)]);
for i=1:0.2*L
    viscircles(generation(1:2,i)', generation(3,i),'Color','r');
    
end
end