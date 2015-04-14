function octave = firstoctave(I,s)
k = 2^(1/s);
sigma0 = 1.6;
dsigma0 = sigma0 *k * sqrt(1 - 1/k^2) ; % Scale step factor
sign  = 0.5 ;                      % Nominal smoothing of the image
[M,N] = size(I);
octave = zeros(M,N,s + 3);
sigrup = sqrt(sigma0^2 - (2 * sign)^2);
octave(:,:,1) = mygaussian(I,sigrup);
for i = 0 : (s + 1)
dsigma = k^i * dsigma0;
octave(:,:,i+2) = mygaussian(I,dsigma);
end
