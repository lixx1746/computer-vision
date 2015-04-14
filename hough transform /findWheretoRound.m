function index = findWheretoRound(ref,data)
%this function find where to round the data compare with a ref data 
%both ref and data are vector
%return the index
index = zeros(length(data),2);
for i = 1 : length(data)
   index1 =  findnearest(ref,data(i));
   index(i,:) = [i,index1];
end


function index = findnearest(ref,ele)
%ref is the reference vector, ele is the query element
[c,index] = min(abs(ref - ele));

