function [a,b] = drawline(para,data)
%this function can find the endpoint of each line
[y,x] = find(data);
for i = 1 : length(para)
[linedata,y,x] = findline(para(i,:),y,x);
a(i) = min(linedata(:,2));
b(i) = max(linedata(:,2));
end
a = a';
b = b';


function [linedata,x,y] = findline(para,x,y)
eps = 20;
temp =  x .* cos(para(1)) + y.* sin(para(1)) - para(2);
temp1 = [x,y];
linedata = temp1(abs(temp) < eps,:);
temp1(abs(temp) < eps,:) = [];
x = temp1(:,1);
y = temp1(:,2);
