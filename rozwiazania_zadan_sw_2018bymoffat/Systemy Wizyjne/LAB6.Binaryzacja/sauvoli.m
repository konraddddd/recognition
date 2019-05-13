function tresh=sauboli(image)

[ X Y ] = size(image);

for i = 1:X
    for j = 1:Y
        img_mean = meanLT(i,j,8,image,X,Y);
         if bin_img(i,j)>img_mean
            bin_img(i,j) = 255;
         else
             bin_img(i,j) = 0;
         end
    end
end
end