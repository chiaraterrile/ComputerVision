function [SH,img_sharpened]=sharpened(img,pixel)
I=zeros(pixel);
[rr, cc]= size(I);
midx=(rr+1)/2;
midy=(cc+1)/2;
I(midx,midy)=2;
S=(1/(pixel^2))*ones(pixel);
SH=I-S; %sharpening filter
img_sharpened = conv2(img,SH, 'same'); %filtered image


end