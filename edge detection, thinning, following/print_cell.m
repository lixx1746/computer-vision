function temp = print_cell(a)
%print the boundary
temp = cell2mat(a);
length1 = length(temp);
temp = [temp.point];
temp = reshape(temp,2,length1);
temp = temp';
