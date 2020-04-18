function []=plottingSeg(img, binaryImageB,segB,binaryImageR,segR)
figure
prop=regionprops(binaryImageB, 'Area','Centroid','BoundingBox');
xc=floor(prop(1).Centroid(1));
yc=floor(prop(1).Centroid(2));
ul_corner_width=prop(1).BoundingBox;

subplot(221),imagesc(segB),colormap gray,title('Detected object (black car)')
hold on
plot(xc,yc,'*g')
rectangle('Position',ul_corner_width,'EdgeColor',[0,1,0])

subplot(222),imagesc(imread(img)),colormap gray,title('Detected object (black car)')
hold on
plot(xc,yc,'*g')
rectangle('Position',ul_corner_width,'EdgeColor',[0,1,0])

prop2=regionprops(binaryImageR, 'Area','Centroid','BoundingBox');
xc=floor(prop2(1).Centroid(1));
yc=floor(prop2(1).Centroid(2));
ul_corner_width=prop2(1).BoundingBox;

subplot(223),imagesc(segR),colormap gray,title('Detected object (red car)')
hold on
plot(xc,yc,'*g')
rectangle('Position',ul_corner_width,'EdgeColor',[0,1,0])

subplot(224),imagesc(imread(img)),colormap gray,title('Detected object (red car)')
hold on
plot(xc,yc,'*g')
rectangle('Position',ul_corner_width,'EdgeColor',[0,1,0])

end