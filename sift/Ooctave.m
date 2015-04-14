function G = Ooctave(I,O)
sig = 1.6;
sign = 0.5;
s = 3;
Iup = doubleSize(I);
[M,N] = size(I);
if nargin < 2
    O = log2(min(M,N))- 3;
    O = ceil(O);
end
G.S = s;
G.O = O;
G.octave{1} = firstoctave(Iup,s);
for i = 2 : O
    temp = G.octave{i - 1};
    I = temp(:,:,end - 2);
    I = halveSize(I);
    G.octave{i} = otheroctave(I,s);
end