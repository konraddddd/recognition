close all;
clear all;

knee = imread('knee.png');
knee = double(knee);
[SIZE_X, SIZE_Y] = size(knee);

figure(1)
imshow(knee,[]);
[y_start, x_start] = ginput(1);
y_start = round(y_start);
x_start = round(x_start);



stack = [];
visited = zeros(779,693);
segmented = zeros(779,693);


%%%%%%%%%Algorytm%%%%%%%%%%%%%%%
stack = push(stack,[x_start y_start]);
visited(x_start,y_start) = 1;
segmented(x_start,y_start) = 1;

while (size(stack,1) ~= 0)
    [stack, x_tmp, y_tmp] = pop(stack);
    if (x_tmp>1 && x_tmp<SIZE_X-1 && y_tmp>1 && y_tmp<SIZE_Y-1)
        for j=-1:1
            for k=-1:1
                x_ind = x_tmp+j;
                y_ind = y_tmp+k;
                if (visited(x_ind, y_ind) == 0)
                    if abs(knee(x_ind, y_ind)-knee(x_tmp, y_tmp))<4
                        segmented(x_ind, y_ind)=1;
                        stack=push(stack,[x_ind, y_ind]);
                    end
                   visited(x_ind, y_ind) =1; 
                end
            end
        end
        
    end    
end

figure(2)
imshow(segmented)
