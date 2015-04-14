function J = doubleSize(I)
[M,N]=size(I) ;
J = zeros(2*M,2*N);
J(1:2:end,1:2:end) = I;
J(2:2:end-1,2:2:end-1) = 0.25*I(1:end-1,1:end-1) + 0.25*I(2:end,1:end-1) + ...
  0.25*I(1:end-1,2:end) + 0.25*I(2:end,2:end);
J(2:2:end-1,1:2:end) = 0.5*I(1:end-1,:) + 0.5*I(2:end,:);
J(1:2:end,2:2:end-1) = 0.5*I(:,1:end-1) + 0.5*I(:,2:end);
