function [image,Sobel_mag,binary_data] = EdgeThresholding(file)
%sobel filter
Sobel_filter1 = [-1,0,1;-2,0,2;-1,0,1];
Sobel_filter2 = [1,2,1;0,0,0;-1,-2,-1];
%read a image
image = imread(file);
image = rgb2gray(image);
imagedouble = double(image);
Sobel_delta1 = conv2(imagedouble,Sobel_filter1,'same');
Sobel_delta2 = conv2(imagedouble,Sobel_filter2,'same');
Sobel_mag1 = (Sobel_delta1.^2 + Sobel_delta2.^2).^0.5;
Sobel_dir = atan2(Sobel_delta2,Sobel_delta1);
Sobel_mag = uint8(Sobel_mag1);
%thresholding
level = graythresh(Sobel_mag);
So_t1 =  im2bw(Sobel_mag,level-0.15);
binary_data = So_t1;
binary_data(1,:) = 0;
binary_data(end,:) = 0;
binary_data(:,1) = 0;
binary_data(:,end) = 0;
