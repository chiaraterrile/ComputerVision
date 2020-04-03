function []=hough_transform2 ()
img_h = rgb2gray(imread('highway2.jpg'));
[rr,cc]=size(img_h);
figure, sgtitle('Hough Transform highway2.jpg')
subplot(3,2,1),imagesc(img_h),colormap(gca,'gray') , title('Original image highway2.jpg')
BW = edge(img_h,'sobel');
subplot(3,2,2),imshow(BW), title ('Edge Detection')

%%%Hough transform
[H,T,R] = hough(BW);

subplot(3,2,3),imagesc(H),colormap (gca,'pink') , title ('Hough transform matrix')

%%%Identify peaks in Hough transform
P = houghpeaks(H,5,'NHoodSize',[21 21]);     %5 is the number of peaks to identify               

subplot(3,2,5),imshow(H,[],'XData',T,'YData',R,'InitialMagnification','fit');
colormap (gca,'pink')
xlabel('\theta'), ylabel('\rho');
axis on, axis normal, hold on;
%peaks
x = T(P(:,2)); y = R(P(:,1));
plot(x,y,'s','color','yellow'),title ('Image with peaks');

%%%Compute straight lines and plot them
subplot(3,2,4), imshow(BW), hold on
for k=1:length(P)
    if T(P(k,2))>-45 && T(P(k,2))<45
        x1=R(P(k,1))/cos(deg2rad(T(P(k,2)))) - 1*tan(deg2rad(T(P(k,2))));
        x2=R(P(k,1))/cos(deg2rad(T(P(k,2)))) - cc*tan(deg2rad(T(P(k,2))));
        plot([x1,x2],[1 cc],'LineWidth',2,'Color','yellow');
    else
        y1=R(P(k,1))/sin(deg2rad(T(P(k,2)))) - 1/tan(deg2rad(T(P(k,2))));
        y2=R(P(k,1))/sin(deg2rad(T(P(k,2)))) - rr/tan(deg2rad(T(P(k,2))));
        plot([1,rr],[y1 y2],'LineWidth',2,'Color','red'),title ('Straight lines');
    end
end

%%%Find line segments and plot them
lines = houghlines(BW,T,R,P,'FillGap',10,'MinLength',30);
subplot(3,2,6), imshow(img_h), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red'),title('Line segments');
end
end