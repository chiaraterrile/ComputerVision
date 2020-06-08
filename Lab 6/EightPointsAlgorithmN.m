function F = EightPointsAlgorithmN(P1, P2)

%normalization of the points
[nP1, T1] = normalise2dpts(P1);
[nP2, T2] = normalise2dpts(P2);

%Number of correspondences
N = size(P1,2);

%Initialization of A with the proper dimensions
A = zeros(N,9);

for i = 1 : N
   a1 = nP2(1,i) .* nP1(:,i)';
   a2 = nP2(2,i) .* nP1(:,i)';
   a3 = nP2(3,i) .* nP1(:,i)';
    
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

%denormalize
F = T2' * F * T1;

end