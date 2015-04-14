%test function 
clc;close all;clear all;

%this is line test
[image,Sobel_mag,data]  = EdgeThresholding('line1.jpg'); %this function return the origianl pic, the sobel pic and the thresholding data
figure()
imshow(image);
title('line original pic');
figure()
imshow(Sobel_mag);
title('line after sobel')
lineimage = 255.* data;
figure()
imshow(uint8(lineimage));
title('line after Sobel and thresholding');
n = 180;
m = 2000;
thinning_data = thinning1(data);
figure();
imshow(uint8(255.*thinning_data))
title('line after thinning');

%I already store the parameter for these lines, so if you don't want to run
%the program, you can directly use these parameters. if you want to run the 
%program, you can delete the %% before %%[A,para] = houghLine(n,m,data) .
figure()
imshow(image)
title('line after thinning and hough transform');
para = load('linepara.mat');
para = para.para;
%%[A,para] = houghLine(n,m,data);

para = remove_dup_line(para); % for better apperance, I use this function to remove the parallel lines, so i just draw one line for the parallel lines.
[a,b] = drawline(para,thinning_data);% this function can find the endpoint of each line
hold on
 for i = 1 : length(para)
     y = a(i) : b(i);
     temp = para(i,:);
     x = (temp(2) - sin(temp(1)).*y)./cos(temp(1));
     plot(y,x,'Color','r','LineWidth',2);
 end
 
 
 % this is ellipse test
 [image,Sobel_mag,data] = EdgeThresholding('ellipse1.jpg');%this function return the origianl pic, the sobel pic and the thresholding data
%I already store the parameter for these ellipses, so if you don't want to run
%the program, you can directly use these parameters. if you want to run the 
%program, you can delete the %% before %%ellipse = houghellipse(data);.
ellipse = load('ellipse.mat');
ellipse = ellipse.ellipse;
%%ellipse = houghellipse(data);

figure()
imshow(image);
title('ellipse original picture');
figure()
imshow(Sobel_mag);
title('ellipse after sobel transform');
ellipseimage = 255.* data;
figure()
imshow(uint8(ellipseimage));
title('ellipse after thresholding and hough transform');
hold on
for i = 1 : 4
draw(ellipse(i,:)) %this function draw the ellipse i found
hold on
end

