function draw(para)
% draws an ellipse with specified center, minor
% and major semiaxes,and rotation.

xc = para(1);yc = para(2);a = para(3);b = para(4);angle = para(5);
theta = [-pi:0.01:pi];
R = [cos(angle), sin(angle); -sin(angle), cos(angle)]*...
   [a*cos(theta);b*sin(theta)];
x = R(1,:)+xc;
y = R(2,:)+yc;
plot(x,y,'LineWidth',1.5);
