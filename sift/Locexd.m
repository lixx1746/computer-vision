function Loc = Locexd(I)
temp = dif(I,3);
for i = 1 : length(temp.dog)
    temp1 = temp.dog{i};
    Loc.Loc{i} = aux(temp1);
end




function acc = aux(data)
[m,n] = size(data(:,:,1));
acc = zeros(m,n,3);
for j = 1 : 3
  flag = compare(data(:,:,j + 1),data(:,:,j));
  flag = compare2(data(:,:,j + 1),data(:,:,j + 2),flag);
  temp = data(:,:,j + 1);
  temp(flag == 0) = 0;
  acc(:,:,j) = temp;
end
 






   




