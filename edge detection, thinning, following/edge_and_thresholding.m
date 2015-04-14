function [Robert_mag,Robert_dir,Sobel_mag,Sobel_dir] = edge_and_thresholding()
%Robert filter
Robert_filter1 = [0,1;-1,0];
Robert_filter2 = [1,0;0,-1];
%sobel filter
Sobel_filter1 = [-1,0,1;-2,0,2;-1,0,1];
Sobel_filter2 = [1,2,1;0,0,0;-1,-2,-1];
%read a image
image = imread('coins.png');
imshow(image);
title('original image');
%convert to double
%image = rgb2gray(image);
image = double(image);
Robert_delta1 = conv2(image,Robert_filter1,'same');
Robert_delta2 = conv2(image,Robert_filter2,'same');
Sobel_delta1 = conv2(image,Sobel_filter1,'same');
Sobel_delta2 = conv2(image,Sobel_filter2,'same');
Robert_mag1 = (Robert_delta1.^2 + Robert_delta2.^2).^0.5;
Robert_dir = atan2(Robert_delta2,Robert_delta1);
Sobel_mag1 = (Sobel_delta1.^2 + Sobel_delta2.^2).^0.5;
Sobel_dir = atan2(Sobel_delta2,Sobel_delta1);

%show the edge
Robert_mag = uint8(Robert_mag1);
Sobel_mag = uint8(Sobel_mag1);
figure(2)
imshow(Robert_mag);
title('Robert image');
figure(3)
imshow(Sobel_mag);
title('Sobel_image');

%Robert thresholding
figure(4)
level = graythresh(Robert_mag);
Ro_t1 = im2bw(Robert_mag,level-0.1);
Ro_t = 255.*Ro_t1;
imshow(uint8(Ro_t));
title('Robert after thresholding');

%Sobel thresholding
figure(5)
level = graythresh(Sobel_mag);
So_t1 =  im2bw(Sobel_mag,level-0.15);
So_t = 255.* So_t1;
imshow(uint8(So_t));
title('Sobel after thresholding');
