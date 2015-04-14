function [A,para] = houghLine(n,m,data)
%this function caculate the parameter for these lines
%the number of subdivision n for thea,m for distance p
%return the parameter for each line angle, and distance
[row,col] = size(data);
dis = sqrt(row.^2 + col.^2);
A = zeros(n,m);
thea = linspace(-pi/2,pi/2,n);
temp = [cos(thea)',sin(thea)'];
p = linspace(-dis,dis,m);
count = 1;
for i = 1:row
    for j = 1:col
        if data(i,j) == 1
           temp1 = temp * [i;j]; 
           index = findWheretoRound(p',temp1);
           
           %this block draw the parameter space
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%            if count < 1000                                
%            figure(3)                                      
%            title('parameter space');                      
%            plot(thea,p(index(:,2)),'LineWidth',0.001);    
%            hold on                                         
%            count = count + 1;
%            end
       %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
           A = myset(A,index);
         end
    end
end

nmostsig = 10;
indexofnmost = nmost(A,nmostsig);
para = zeros(nmostsig,2);
for i = 1 : nmostsig
    temp = indexofnmost(i,:);
    linethea = thea(temp(1));
    linep = p(temp(2));
    para(i,:) = [linethea,linep];
end

%this function set the accumalator matrix A
function count = myset(count,index)
for i = 1 : size(index,1);
    count(index(i,1),index(i,2)) =  count(index(i,1),index(i,2)) + 1;
end
function temp = nmost(m,n)
[ele,index] = max(m,[],2);
temp = 1:size(m,1);
temp = temp';
temp = [temp,index];
[c,index1] = sort(ele,'descend');
temp = temp(index1,:);
temp = temp(1:n,:);











