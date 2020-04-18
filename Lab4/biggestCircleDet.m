function [colNew,rowNew,sigmaNew]=biggestCircleDet(img,extC,extR)
[val,col,row]=circlesDetection(img);
[sortedR, sortIndexes] = sort(val, 'descend'); %sort the val vector to find the biggest value
sigmaNew = sortedR(1);
ind = find(val==sigmaNew);
col = col(ind);
row = row(ind);
% new coordinates with respect to the original image
colNew = col+extC;
rowNew = row+extR;

end