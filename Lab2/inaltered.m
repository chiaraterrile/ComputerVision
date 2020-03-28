function [I,img_inaltered]=inaltered(img,pixel)
I=zeros(pixel);
[rr, cc]= size(I);
midx=(rr+1)/2;
midy=(cc+1)/2;
I(midx,midy)=1; %inaltering filter
img_inaltered = conv2(img, I, 'same'); %filtered image


end