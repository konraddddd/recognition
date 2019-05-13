clear all;
close all;

moon = imread('Histogram/phobos.bmp');
[moon_hist  x] = imhist(moon);
[sizeX sizeY] = size(moon);


%%%%BBHE 
mean_of_col = mean(moon);
lm_bbhe = round(mean(mean_of_col));

hist1_BBHE = moon_hist(1:lm_bbhe,:);
hist2_BBHE = moon_hist(lm_bbhe+1:size(moon_hist),:);

hist1_BBHE_cummulated = cumsum(hist1_BBHE);
hist2_BBHE_cummulated = cumsum(hist2_BBHE);

hist1_BBHE_normalised = hist1_BBHE_cummulated/max(hist1_BBHE_cummulated);
hist2_BBHE_normalised = hist2_BBHE_cummulated/max(hist2_BBHE_cummulated);

C1n = (lm_bbhe)*hist1_BBHE_normalised;
C2n = lm_bbhe+1 + (255-lm_bbhe+1)*hist2_BBHE_normalised;
lutBBHE = uint8([C1n; C2n]);

phobosLUTBBHE = intlut(moon,lutBBHE);
figure('name','BBHE');
imshow(phobosLUTBBHE);


%%%%%DSIHE


 [valueDSIGE lm_DSIHE] = min( abs(cumsum(moon_hist)-(sizeX*sizeY/2)));
 
 
% szukamy poziomu jasnoœci który odpowiada "po³owie" histogramu skumulowanego,
% czyli jasnoœci, dla której jest mniej wiêcej tyle samo pikseli jaœniejszych 
% co ciemniejszych.
hist1_DSIGE = moon_hist(1:lm_DSIHE,:);
hist2_DSIGE = moon_hist(lm_DSIHE+1:size(moon_hist),:);

hist1_DSIGE_cummulated = cumsum(hist1_DSIGE);
hist2_DSIGE_cummulated = cumsum(hist2_DSIGE);

hist1_DSIGE_normalised = hist1_DSIGE_cummulated/max(hist1_DSIGE_cummulated);
hist2_DSIGE_normalised = hist2_DSIGE_cummulated/max(hist2_DSIGE_cummulated);

C1n = (lm_DSIHE)*hist1_DSIGE_normalised;
C2n = lm_DSIHE+1 + (255-lm_DSIHE+1)*hist2_DSIGE_normalised;
lutDSIGE = uint8([C1n; C2n]);

phobosLUTDSIGE = intlut(moon,lutDSIGE);
figure('name','DSIGE');
imshow(phobosLUTDSIGE);
