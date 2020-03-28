function [img_average,K]= moving_average (img_noisy, pixel )

K = ones(pixel) / pixel^2; %moving average filter
img_average = movmean ( img_noisy,pixel); %image with moving average filter

end