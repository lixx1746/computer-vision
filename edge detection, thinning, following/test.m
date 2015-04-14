%test function
clear all
close all
clc
%test the first problem and the second problem
[Robert_mag,Robert_dir,Sobel_mag,Sobel_dir] = edge_and_thresholding();


a = [1,0,0,0,0,0,0,0,0,0;
     0,1,1,0,0,0,0,0,0,0;
     0,1,1,1,0,0,0,0,0,0;
     0,0,1,1,1,0,0,0,0,0;
     0,0,0,1,1,1,0,0,0,0;
     0,0,0,0,1,1,1,0,0,0;
     0,0,0,0,0,1,1,1,0,0;
     0,0,0,0,0,0,1,1,1,0;
     0,0,0,0,0,0,0,1,1,0;
     0,0,0,0,0,0,0,0,0,1
     ];
 
 thinning_result = thinning1(a);
 isequal(thinning_result,diag(ones(1,10)))
 
%Thinning for Sobel edge
figure(6)
level = graythresh(Sobel_mag);
So_t1 =  im2bw(Sobel_mag,level);
So_t = 255.* So_t1;
a = thinning1(double(So_t1));
imshow(255.*uint8(a));
title('Sobel thinning');
level = graythresh(Robert_mag);
Ro_t1 = im2bw(Robert_mag,level);
Ro_t = 255.*Ro_t1;
a = thinning1(double(Ro_t1));
figure(7)
imshow(255.*uint8(a));
title('robert thinning');

%edge_follow, i just print the 10 longest boundary
b = edge_following(a);
index = mysort(b);
the_first = b(index(1:10));
for i = 1:10
edge = print_cell(the_first(i))
end
 
 