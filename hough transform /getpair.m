function [index_i,index_j] = getpair(dist,alpha)
%this function get the suitable pair
minmajoraxis = 100; %narrow the search space
maxmajoraxis = 300; 
rotation = 1*pi/180;%since axis doesn't have rotation, so this can be small
dist = triu(dist);
[index_i,index_j] = find(dist >= minmajoraxis & dist <= maxmajoraxis & abs(alpha) <= rotation);