function temp = next(a,previous,current)
%return the next point, clockwise 
v = [[0,-1];[-1,-1];[-1,0];[-1,1];[0,1];[1,1];[1,0];[1,-1]];
x_p = previous(1);
y_p = previous(2);
i = current(1);
j = current(2);
index = myfind([x_p - i, y_p - j],v);
temp = [];
for k = index : index+7
    temp1 = mod(k,8)+1;
    vtemp = v(temp1,:);
    if a(i + vtemp(1),j + vtemp(2)) == 1
        temp = [i+vtemp(1),j + vtemp(2)];
        return
    end
end



function i = myfind(a,b)
for i = 1:length(b)
    if b(i,1) == a(1) && b(i,2) == a(2)
        return
    end
end

     
     
   