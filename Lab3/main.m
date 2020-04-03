close all
clear 
img = rgb2gray(imread('boccadasse.jpg'));
figure,image(img),colormap gray(256) , title('Original image boccadasse.jpg')

%% laplacian

[Z1,img_conv1]=laplacian_gaussian (1,img); %laplacian using a sd=1
figure, sgtitle('Laplacian of gaussian filter with sd = 1')
subplot(2,2,1),imagesc(Z1), title('Filter image')
subplot(2,2,2),surf(Z1), title('Filter surface')
subplot(2,2,3),imagesc(img_conv1),colormap(gca,'gray') , title('Convolution with original image')


[Z2,img_conv2]=laplacian_gaussian (3.5,img);  %laplacian using a sd=3.5
figure, sgtitle('Laplacian of gaussian filter with sd = 3.5')
subplot(2,2,1),imagesc(Z2), title('Filter image')
subplot(2,2,2),surf(Z2),  title('Filter surface ')
subplot(2,2,3),imagesc(img_conv2),colormap(gca,'gray') , title('Convolution with original image')

%% zero crossing

[Z3,img_conv3]=laplacian_gaussian (2,img);  %laplacian using a sd=2

figure, sgtitle('Zero crossing with sd=1 and different threshold')

% zero crossing with sd=1 and th=0.6
[edges]=zeroCrossing (img_conv1,0.6); %zero crossing using the function zeroCrossing
subplot(2,2,1),imagesc(edges),colormap gray , title('Zero crossing (sd=1,th=0.6)')

edge_std = edge(img_conv1,'log',0.6,1); %zero crossing using the function edge()
subplot(2,2,2),imagesc(edge_std),colormap gray , title('Edge (sd=1,th=0.6)')

% zero crossing with sd=1 and th=3
[edges]=zeroCrossing (img_conv1,3); %zero crossing using the function zeroCrossing
subplot(2,2,3),imagesc(edges),colormap gray , title('Zero crossing (sd=1,th=3)')

edge_std = edge(img_conv1,'log',3,1); %zero crossing using the function edge()
subplot(2,2,4),imagesc(edge_std),colormap gray , title('Edge (sd=1,th=3)')


figure, sgtitle('Zero crossing with sd=2 and different threshold')

% zero crossing with sd=2 and th=0.6
[edges]=zeroCrossing (img_conv3,0.6); %zero crossing using the function zeroCrossing
subplot(2,2,1),imagesc(edges),colormap gray , title('Zero crossing (sd=2,th=0.6)')

edge_std = edge(img_conv1,'log',0.6,2); %zero crossing using the function edge()
subplot(2,2,2),imagesc(edge_std),colormap gray , title('Edge (sd=2,th=0.6)')

% zero crossing with sd=2 and th=3
[edges]=zeroCrossing (img_conv3,3); %zero crossing using the function zeroCrossing
subplot(2,2,3),imagesc(edges),colormap gray , title('Zero crossing (sd=2,th=3)')

edge_std = edge(img_conv1,'log',3,2); %zero crossing using the function edge()
subplot(2,2,4),imagesc(edge_std),colormap gray , title('Edge (sd=2,th=3)')

%% hough transform

hough_transform (); %using the image highway1.jpg

hough_transform2 (); %using the image highway2.jpg

