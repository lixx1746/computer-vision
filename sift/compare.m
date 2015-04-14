function flag = compare(data,data1)
[M,N] = size(data);
flag = zeros(M,N);
eps = 0.0001;
j = 2;
i = 2;
while i <= (M - 1)
    while j <= N - 1
         if j < N-1 && ~isempty(find(flag(i - 1: i + 1,j - 1 : j + 1), 1))
            j  = j + 1;
         end
        temp = max(max(data1(i - 1: i + 1,j -1 : j + 1)));
        temp1 = max(max(data(i - 1: i + 1,j -1 : j + 1)));
        
        if data(i,j) - temp >= 0 && data(i,j) - temp1 >= 0  
            flag(i,j) = 1;
        end
    j = j + 1;
    end
    i = i + 1;
    j = 2;
end