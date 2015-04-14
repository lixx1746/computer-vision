function flag = compare2(data,data2,flag)
[a,b] = find(flag ==1);
for k = 1 : length(a)
    i = a(k);
    j = b(k);
    temp = max(max(data2(i - 1: i + 1,j -1 : j + 1)));
    %temp1 = max(max(data(i - 1: i + 1,j -1 : j + 1)));
    if data(i,j) - temp < 0   
            flag(i,j) = 0;
    end
end