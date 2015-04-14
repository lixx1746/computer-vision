function temp = expansion(a)
%edge expansion, but i don't use it in test.m
nei = [1,1,1;1,1,1;1,1,1];
temp = conv2(a,nei,'same');
temp(temp>=1) = 1;
