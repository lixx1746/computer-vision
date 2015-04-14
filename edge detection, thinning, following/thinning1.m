function a =thinning1(a)
%thinning a edge
%getsize of a
[x,y] = size(a);
changed = 1;%set the chaged to 1
while changed 
 changed = 0;
 flag = zeros(x,y);%set the mark matrix
 for i = 2:1:x-1
        for j = 2:1:y-1
        %if a(i,j) is 1,then proceed
        if (a(i,j) ==1)
            nei = nei_pos(a,i,j);
            nonzeronei = sum_nei(nei);%non-zero number around i,j
            transit = tran(nei);      %transit number
            %if satsify, then mark it as 1,delete it
            if ~((nonzeronei == 0) || (nonzeronei == 1) || (nonzeronei == 7) || (nonzeronei == 8) || (transit >=2))
                flag(i,j) = 1;
            end
        end
        end
 end
    a(flag > 0) = 0;
    %Check if anything has changed
    if sum(flag(:)) > 0;changed = 1;end
end
% get i,j's neighbor
function nei_pos = nei_pos(a,i,j)
nei_pos = zeros(1,9);         
nei_pos(1) = a(i,j);
nei_pos(2) = a(i-1,j);
nei_pos(3) = a(i-1,j+1);
nei_pos(4) = a(i,j+1);
nei_pos(5) =a(i+1,j+1);
nei_pos(6) =a(i+1,j);
nei_pos(7) = a(i+1,j-1);
nei_pos(8) = a(i,j-1);
nei_pos(9) =a(i-1,j-1);

%get the 8-connection sum
function temp = sum_nei(nei)
temp =   sum(nei(2:end));

%get the transit num         
function transit = tran(nei)
transit = 0;
current_pos = nei(9);
for i = 2:9
  if (nei(i) - current_pos < 0)
    transit = transit + 1;
  end
  current_pos = nei(i);
end
         
         