function Ig = mygaussian(I,sigmal)
%set the size of gaussian filter
h = ceil(6 * sigmal + 0.01);
G = fspecial('gaussian',[h h],sigmal);
% Filter it
Ig = imfilter(I,G,'same');
% Display
%imshow(Ig)