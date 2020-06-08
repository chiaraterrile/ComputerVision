close all
clear all

%% Load the two sets of corresponding points

%Load the first set of points
P1i = load("./Mire/mire1.points");
P2i = load("./Mire/mire2.points");

%Load the two images
I1 = imread("./Mire/mire1.pgm", "pgm");
I2 = imread("./Mire/mire2.pgm", "pgm");

% P1i = load("./Rubik/rubik1.points");
% P2i = load("./Rubik/rubik2.points");
% 
% I1 = imread("./Rubik/rubik1.pgm", "pgm");
% I2 = imread("./Rubik/rubik2.pgm", "pgm");

N = size(P1i, 1);

P1 = [P1i'; ones(1,N)];
P2 = [P2i'; ones(1,N)];

F1 = EightPointsAlgorithm(P1,P2);
F2 = EightPointsAlgorithmN(P1,P2);

%% Check of the epipolar constraint

answer1 = checkEpConst(P1, P2, F1);
if (answer1 == 0)
    disp('The epipolar constraint (without normalization) is NOT respected');
else
    disp('The epipolar constraint (without normalization) is respected'); 
end
answer2 = checkEpConst(P1, P2, F2);
if (answer2 == 0)
    disp('The epipolar constraint (with normalization) is NOT respected');
else
    disp('The epipolar constraint (with normalization) is respected'); 
end


%% Visualization of the correspondences along with the epipolar lines

visualizeEpipolarLines(I1, I2, F1, P1i, P2i)
visualizeEpipolarLines(I1, I2, F2, P1i, P2i)

%% Computation of the epipoles

% using F1
% right epipole
[U, D, V] = svd(F1);
Ep1R = U(:,3);
% left epipole
Ep1L = V(:,3);
R1 = sprintf(['The right epipoles (without normalization) are: ',num2str( Ep1R(1)) , ', ' ,num2str( Ep1R(2)),', ' ,num2str( Ep1R(3))]);
disp(R1);
L1 = sprintf(['The left epipoles (without normalization) are: ',num2str( Ep1L(1)) , ', ' ,num2str( Ep1L(2)),', ' ,num2str( Ep1L(3))]);
disp(L1);

% using F2
% right epipole
[U, D, V] = svd(F2);
Ep2R = U(:,3);
% left epipole
Ep2L = V(:,3);
R2 = sprintf(['The right epipoles (with normalization) are: ',num2str( Ep2R(1)) , ', ' ,num2str( Ep2R(2)),', ' ,num2str( Ep2R(3))]);
disp(R2);
L2 = sprintf(['The left epipoles (with normalization) are: ',num2str( Ep2L(1)) , ', ' ,num2str( Ep2L(2)),', ' ,num2str( Ep2L(3))]);
disp(L2);
