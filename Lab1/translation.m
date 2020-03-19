function [Xtrasl,Ytrasl] = translation (tx,ty,X,Y)
 % trasnslation of the image
%inverse coordinates of the transformation
Xtrasl=X - tx;
Ytrasl=Y - ty;

%another way would have been using the function TranslImg = imtranslate ( greyimg, [tx,ty]);
end 