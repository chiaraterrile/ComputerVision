function [L,img_lpf]= gaussian_lpf (img_noisy,pixel)
%Define the gaussian filter
sigma = pixel/6;      %3*sigma has to be equal or less than half width
L = fspecial('gaussian', pixel, sigma);
%Apply the filter
img_lpf= imfilter(img_noisy, L); 

end