function [answer] = checkEpConst(P1, P2, F)
N = size(P1, 2);
answer = true;
th = 0.1; %threshold of tolerance

%Check the epipolar constraint for each point
for ii = 1 : N
    result = P2(:,ii)' * F * P1(:,ii);
    if abs(result) > th
        answer = false;
    end

end

end