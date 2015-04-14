function octave = otheroctave(I,s)
k = 2^(1/s);
sigma0 = 1.6;
dsigma0 = sigma0 *k * sqrt(1 - 1/k^2) ; % Scale step factor
[M,N] = size(I);
octave = zeros(M,N,s + 3);
octave(:,:,1) = I;
for i = 0 : (s + 1)
dsigma = k^i * dsigma0;
octave(:,:,i + 2) = mygaussian(I,dsigma);
end
