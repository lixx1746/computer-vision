function a = dif(I,s)
temp = Ooctave(I,s);
l = length(temp.octave);
for i = 1 : l
    a.dog{i} = onedif(temp.octave{i});
end



function a = onedif(data)
[M,N,l] = size(data);
a = zeros(M,N,l-1);
for i = 1 : (l-1)
    a(:,:,i) = data(:,:,i+1) - data(:,:,i);
end
