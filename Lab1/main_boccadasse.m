%% main using the image boccadasse.jpg

load boccadasse.jpg
greyimg= rgb2gray(imread('boccadasse.jpg','jpg')); % conversion of the image from RGB format into B/W
[rr,cc]=size(greyimg); % rr and cc are the rows and the columns of the matrix of pixels
figure,imagesc(greyimg),colormap gray, title ('original image')
[X,Y]=meshgrid(1:cc,1:rr);


%% translation of the image

tx = -13.5; ty = -17.5; % translation factors
[Xtrasl,Ytrasl] = translation (tx,ty,X,Y);
figure,imagesc(griddata(X,Y,double(greyimg),Xtrasl,Ytrasl,'linear')),colormap gray,title('translated image')

%% rotation of the image 

angle1 = - pi / 4 ; %angle of rotation
[Xrot1,Yrot1] = rotation (angle1,cc,rr,X,Y);
figure,imagesc(griddata(X,Y,double(greyimg),Xrot1,Yrot1,'linear')),colormap gray,title('rotated image of an angle of 45°')

%choose of another angle
angle2 = pi ; %angle of rotation
[Xrot2,Yrot2] = rotation (angle2,cc,rr,X,Y);
figure,imagesc(griddata(X,Y,double(greyimg),Xrot2,Yrot2,'linear')),colormap gray,title('rotated image of an angle of 180°')


%% transformation using data.mat
M = load('data.mat');
[Xt,Yt] = data_warping(X,Y,M);
figure,imagesc(griddata(X,Y,double(greyimg),Xt,Yt,'linear')),colormap gray,title('warped translation image with data.mat')
