function index = mysort(a)
%sort the boundary
size = length(a);
b = zeros(1,size);
for i = 1:size
    temp = cell2mat(a(i));
    b(i) = length(temp);
end
[b1,index] = sort(b,'descend');
return
