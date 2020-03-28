function [img_gaussian,img_salt_pepper]= noise(img)
%gaussian noise
img_gaussian=double(img)+20*randn(size(img));%20 is the standard deviation
%salt and pepper noise
img=double(img);
[rr,cc]=size(img);
maxv=max(max(img));
indices=full(sprand(rr,cc,0.2));%0.2 is the noise density 
mask1=indices>0 & indices<0.5;  mask2=indices>=0.5;%matlab masking technique
img_salt_pepper= img.*(~mask1) ;
img_salt_pepper=img_salt_pepper.*(~mask2)+maxv*mask2;
end