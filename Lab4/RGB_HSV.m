function [img_rgb,img_hsv]= RGB_HSV (img)
img_rgb=imread(img);
img_hsv=rgb2hsv(img_rgb);
figure,subplot(236)
subplot(231),imagesc(img_rgb(:,:,1)),colormap gray,title('R component')%as intensity
subplot(232),imagesc(img_rgb(:,:,2)),colormap gray,title('G component')%as intensity
subplot(233),imagesc(img_rgb(:,:,3)),colormap gray,title('B component')%as intensity
subplot(234),imagesc(img_hsv(:,:,1)),colormap gray,title('H component')%as intensity
subplot(235),imagesc(img_hsv(:,:,2)),colormap gray,title('S component')%as intensity
subplot(236),imagesc(img_hsv(:,:,3)),colormap gray,title('V component')%as intensity
end