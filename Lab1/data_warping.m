function [Xt,Yt] = data_warping(X,Y,M) 
Xn= M.XD;
Yn= M.YD;
Xt=X+Xn;
Yt=Y+Yn;
end