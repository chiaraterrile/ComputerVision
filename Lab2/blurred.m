function [B,img_blurred]=blurred(img,pixel)

B=(1/(pixel^2))*ones(pixel); %blurring filter
img_blurred = conv2(img,B, 'same'); %filtered image

end