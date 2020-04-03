function [Z, img_conv,sp]=laplacian_gaussian (s,img)
sp=ceil(s*3); %approximantion
[X,Y]=meshgrid(-sp:sp);
Z=(1/(2*pi*s^2))*((X.^2+Y.^2 -2*s^2)/s^4).*exp(-(X.^2+Y.^2)/(2*s^2));
img_conv = conv2 ( img, Z, 'same');

end