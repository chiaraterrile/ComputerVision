clear all
close all
img=imread('sunflowers.png');

%% laplacian response in function of the scale

flower1 = img(350:415 ,410:490); %zoomed image of flower1
string1='flower 1 laplacian response';
imgScale(flower1,string1);

flower2 = img(340:390 ,150:180); %zoomed image of flower2
string2='flower 2 laplacian response';
imgScale(flower2,string2);

%% detection of the characteristic scale 

[colNew1,rowNew1,sigmaNew1]=biggestCircleDet(flower1,410,350);
[colNew2,rowNew2,sigmaNew2]=biggestCircleDet(flower2,150,340);
%spatial support corresponding to the characteristic scale sigmaNew
sp1= 3*sigmaNew1; 
sp2= 3*sigmaNew2; 
fprintf('the standard deviation (scale) for flower1 is %i and the spatial support is %i x %i pixels \n',sigmaNew1,sp1,sp1);
fprintf('the standard deviation (scale) for flower2 is %i and the spatial support is %i x %i pixels \n',sigmaNew2,sp2,sp2);
sigmaTot=[sigmaNew1 ; sigmaNew2];
rowTot=[rowNew1 ; rowNew2];
colTot=[colNew1 ; colNew2];
figure
showAllCircles(img,colTot, rowTot, 1.41*sigmaTot, 'r', 1); %figure with the two flowers detected


