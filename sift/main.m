function [a,b,local_max] = main()
S = 3;
I = double(imread('coins.png'));
temp = max(max(I));
I = I / temp;
%imshow(I)
a = Ooctave(I,3);
b = dif(I,3);
for o=1:3
temp = findlocalmax(b.dog{o}, -1);
local_max{o} = [temp , findlocalmax( - b.dog{o},  -1)] ; 
end
for i = 1 : 3
    figure(i)
    title(num2str(i))
    for j = 1 : 5
        subplot(2,3,j)
        imshow(b.dog{i}(:,:,j));
    end
   
end




