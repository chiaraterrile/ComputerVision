clear all
close all

figure, sgtitle('Original images')
subplot(231),imagesc(imread('ur_c_s_03a_01_L_0376.png')),colormap gray
subplot(232),imagesc(imread('ur_c_s_03a_01_L_0377.png')),colormap gray
subplot(233),imagesc(imread('ur_c_s_03a_01_L_0378.png')),colormap gray
subplot(234),imagesc(imread('ur_c_s_03a_01_L_0379.png')),colormap gray
subplot(235),imagesc(imread('ur_c_s_03a_01_L_0380.png')),colormap gray
subplot(236),imagesc(imread('ur_c_s_03a_01_L_0381.png')),colormap gray

%% RGB & HSV
 
[img_rgb1,img_hsv1]= RGB_HSV ('ur_c_s_03a_01_L_0376.png');
[img_rgb2,img_hsv2]= RGB_HSV ('ur_c_s_03a_01_L_0377.png');
[img_rgb3,img_hsv3]= RGB_HSV ('ur_c_s_03a_01_L_0378.png');
[img_rgb4,img_hsv4]= RGB_HSV ('ur_c_s_03a_01_L_0379.png');
[img_rgb5,img_hsv5]= RGB_HSV ('ur_c_s_03a_01_L_0380.png');
[img_rgb6,img_hsv6]= RGB_HSV ('ur_c_s_03a_01_L_0381.png');

%% segmentation

img_z = img_hsv1(390:400,575:595); % image zoomed for the detection of the black car
[m,s]=hsv(img_z); %mean value and standard deviation of the Hue component
[binaryImageB,segB]=segmentation(img_hsv1,(m-s),(m+s)); %black car
[binaryImageR,segR]=segmentation(img_hsv1,0.97,1); %red car

plottingSeg('ur_c_s_03a_01_L_0376.png',binaryImageB,segB,binaryImageR,segR);
plottingSeg('ur_c_s_03a_01_L_0377.png',binaryImageB,segB,binaryImageR,segR);
plottingSeg('ur_c_s_03a_01_L_0378.png',binaryImageB,segB,binaryImageR,segR);
plottingSeg('ur_c_s_03a_01_L_0379.png',binaryImageB,segB,binaryImageR,segR);
plottingSeg('ur_c_s_03a_01_L_0380.png',binaryImageB,segB,binaryImageR,segR);
plottingSeg('ur_c_s_03a_01_L_0381.png',binaryImageB,segB,binaryImageR,segR);



