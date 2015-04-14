%this function can remove a ellispe given the ellispe parameter
function points = removeellispe(x0,y0,a,b,points)
N = length(points(:,1));
eps = 0.3;
temp = (points(:,2) - repmat(x0,N,1)).^2./a^2 + (points(:,1) - repmat(y0,N,1)).^2/b^2 - 1;
points((abs(temp) < eps),:) = [];

