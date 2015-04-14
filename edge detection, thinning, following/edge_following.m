function all_bound = edge_following(a)
%edge following
[x,y] = size(a);
all_bound = {};%store the bound i find
already_go = [];%keep track the point i have already pass
k = 1;%keep track of the nth bound
%set the frame to 0;
a(1,:) = 0;a(x,:) = 0;a(:,1) = 0;a(:,y) = 0;
for i = 2:x-1
    for j = 2:y-1
        temp2 = [i,j];
        if a(i,j) == 1 && ~in(temp2,already_go)
            bound_list =[struct('point',[i,j],'nth',k)];%keep track the current bound
            current = [i,j];
            previous = [i,j-1];
            while true
            %I use radial sweep, this next function return the next point
            %given previous point and current point
            b = next(a,previous,current); 
            previous = current;
            current = b;
            %if no neighbor then break
            if isempty(b)
                break;
            end
            b = struct('point',b,'nth',k);
            %struc_same function find if the bound_list has this point b
            index = struc_same(bound_list,b);
            if isempty(index)
                bound_list = [bound_list b];
            else 
                bound_list = [bound_list b];
                flag = 0;
                for n = 1:length(index)
                    if index(n) == 1
                        flag = 1;
                        break;
                    end
                    if isequal(bound_list(end-1), bound_list(index(n) - 1))
                        flag = 1;
                        break;
                    end
                end 
                if flag
                    all_bound = [all_bound {bound_list}];
                    temp1 = [bound_list.point];
                    temp = reshape(temp1,2,length(temp1)./2);
                    temp = temp';
                    temp = union(temp,temp,'rows');
                    already_go = [already_go;temp];%keep the point i already passed
                    already_go = union(already_go,already_go,'rows');
                    k = k+1;
                    break;
                end
            end
            end
        end
    end
 end
