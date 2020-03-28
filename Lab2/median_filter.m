function [img_mf]=median_filter(img_noisy,pixel)
img_mf = medfilt2(img_noisy,[pixel, pixel]); %image with median filter
end