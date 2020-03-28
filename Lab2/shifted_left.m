function [S,img_shifted]=shifted_left(img,pixel)

S=zeros(pixel);
[rr, cc]= size(S);
midx=(rr+1)/2;
lastY=cc;
S(midx,lastY)=1; %shifting filter
img_shifted = conv2(img,S, 'same'); %filtered image


end