%this function can caculate the parameter of these ellipses
function ellipse = houghellipse(data)
ellimage = 255.* data;
min_minoraxis =  25;%in order to constrain my search, i set the min value of minoraxis as 25; 
n = 4;
eps = 0.0001;
ellipse = zeros(n,6);
[y,x]=find(ellimage);
count = 1;
while (count <= n)
    N = length(x);
    dy = repmat(y,[1 N])-repmat(y',[N,1]);
    dx = repmat(x,[1,N])-repmat(x',[N 1]);
    dist = sqrt( dx.^2 + dy.^2 );
    alpha = atan( dy ./ dx );
    %get all suitable pairs
    [index_i,index_j] = getpair(dist,alpha);% this can get all suitalbe pairs
    pairs = 1:length(index_i);
    for p=pairs
        %set the pair
        x1=x(index_i(p)); y1=y(index_i(p));
        x2=x(index_j(p)); y2=y(index_j(p));
        
        %estimate the center and half-major-axis a
        x0=(x1+x2)/2; y0=(y1+y2)/2;
        a = dist(index_i(p),index_j(p))/2;
        
        %the distance between the third point and the center
        thirddis = sum( ([x y] - repmat([x0 y0],[N 1])).^2, 2);
        k = find(thirddis <= a^2); % this distance should small than a^2
        th_sec = (x(k)-x2).^2 + (y(k)-y2).^2; %distance between the third point and x2
        cost = (a^2 + thirddis(k) - th_sec) ./ (2*a*sqrt(thirddis(k)));
        cost = min(max(-1,cost),1);
        sintsq = 1 - cost.^2;
        b = sqrt((a^2 * thirddis(k) .* sintsq) ./ (a^2 - thirddis(k) .* cost.^2 + eps));
        roundpoints = ceil(b + eps);%round to integer
        weight = 1;
        
        accumulator = accumarray(roundpoints, weight, [300 1]);%set the accumulator, the array size is 300
        [current_score, idx] = max(accumulator);
        tmp = ellipse(count,end);
        bestscore = tmp(end);
        if (bestscore < current_score && idx > min_minoraxis)
            ellipse(count,:) = [x0 y0 a idx alpha(index_i(p),index_j(p)) current_score];
        end
    end
    points = [y,x];
    points =  removeellispe(ellipse(count,1),ellipse(count,2),ellipse(count,3),ellipse(count,4),points);
    y = points(:,1);x = points(:,2);
    count = count + 1;
end
    
    
    
    
    
   



        
    
    
  

