function [binaryImage,seg]=segmentation(img_hsv,th1,th2)
[rr,cc,pp]=size(img_hsv);
seg=zeros(rr,cc);
mask=img_hsv(:,:,1)>th1 & img_hsv(:,:,1)< th2; %threshold on the hue componet
seg=seg+mask;
binaryImage = largestBlob(seg, 1); %detection of the largest blob in the segmented image
end