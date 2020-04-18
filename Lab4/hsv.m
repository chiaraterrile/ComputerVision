function [m,s]=hsv (img_hsv)
h = img_hsv(:,:,1); % Hue component
m = mean2(h); % mean value
s = std2(h); % standard deviation
end