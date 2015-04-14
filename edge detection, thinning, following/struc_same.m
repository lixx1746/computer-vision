function index = struc_same(a,b)
%see struct a in b or not
index = [];
for i = 1:length(a)
    if isequal(a(i).point,b.point)
        index = [index i];
    end
end

    
