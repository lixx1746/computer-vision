function is_in = in(a,b)
%see if a point in an array
is_in = false;
for i = 1:length(b)
    if b(i,1) == a(1) && b(i,2) == a(2)
        is_in = true;
        return
    end
end