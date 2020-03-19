function [Xrot,Yrot] = rotation (angle,cc,rr,X,Y)
% rotation of the image
 
%Indexes of the centre of the image
midX = floor(cc/2);
midY = floor(rr/2);
%inverse coordinates of the transformation
Xr = (X-midX)*cos(angle) + (Y-midY)*sin(angle);
Yr = -(X-midX)*sin(angle) + (Y-midY)*cos(angle);
%recentring the image
Xrot= Xr + midX;
Yrot= Yr + midY;

%another way would have been using the function   RotImg = imrotate ( greyimg, angle);

end