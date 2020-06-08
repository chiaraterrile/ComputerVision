function F = EightPointsAlgorithm(P1, P2)
%Number of correspondences
N = size(P1,2);

%Initialization of A with the proper dimensions
A = zeros(N,9);

for i = 1 : N
   a1 = P2(1,i) .* P1(:,i)';
   a2 = P2(2,i) .* P1(:,i)';
   a3 = P2(3,i) .* P1(:,i)';
    
   A(i, :) = [a1 a2 a3]; 
end

% singular value decomposition
[U,D,V] = svd(A);

%select as solution the last column of V
f = V(:,9);
F = reshape(f, [3,3]);
F = F';

%force the rank of F to be 2
[U,D,V] = svd(F);
D(3,3) = 0;
F = U*D*V';

end