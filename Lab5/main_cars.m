clear all 
close all

%% Template matching

img = rgb2gray(imread('ur_c_s_03a_01_L_0376.png')); 
img2 = rgb2gray(imread('ur_c_s_03a_01_L_0377.png'));
img3 = rgb2gray(imread('ur_c_s_03a_01_L_0378.png'));
img4 = rgb2gray(imread('ur_c_s_03a_01_L_0379.png'));
img5 = rgb2gray(imread('ur_c_s_03a_01_L_0380.png'));
img6 = rgb2gray(imread('ur_c_s_03a_01_L_0381.png'));

imgShow = true; % to show the images

% template of the red and black car
T_redS=img(350:430,680:770);
T_blackS = img(350:430,560:650);

NCC(img,T_redS,' red',imgShow,'frame 1');
NCC(img,T_blackS,' black',imgShow,'frame 1');
NCC(img2,T_redS,' red',imgShow,'frame 2');
NCC(img2,T_blackS,' black',imgShow,'frame 2');
NCC(img3,T_redS,' red',imgShow,'frame 3');
NCC(img3,T_blackS,' black',imgShow,'frame 3');
NCC(img4,T_redS,' red',imgShow,'frame 4');
NCC(img4,T_blackS,' black',imgShow,'frame 4');
NCC(img5,T_redS,' red',imgShow,'frame 5');
NCC(img5,T_blackS,' black',imgShow,'Frame 5');
NCC(img6,T_redS,' red',imgShow,'Frame 6');
NCC(img6,T_blackS,' black',imgShow,'Frame 6');

%% Computational times

% new templates with different sizes of the window (centered around the dark car )
T_blackM = img(300:480,510:700);
T_blackL = img(250:530,460:750);

NCC(img,T_blackS,' black',imgShow,'Small');
NCC(img,T_blackM,' black',imgShow,'Medium');
NCC(img,T_blackL,' black',imgShow,'Large');

compTime(img, T_blackS);
compTime(img, T_blackM);
compTime(img, T_blackL);

%% Accuracy of detection

accuracyDet(T_blackS,img);
accuracyDet(T_blackM,img);
accuracyDet(T_blackL,img);

%% Comparison with Lab4

T_comp = img (390:400,575:595);
compTime(img, T_comp);
