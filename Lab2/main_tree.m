close all
clear 
img = imread('tree.png');
figure,image(img),colormap gray(256) , title( 'original image')
figure, imhist(uint8(img),256), title ('histogram of the original image')

%% images with noise

[img_gaussian]= noise(img); %gaussian noise
figure, sgtitle('Adding Gaussian noise')
    subplot(2,2,1), imagesc(img), colormap gray, title('original image')
    subplot(2,2,2),imagesc(img_gaussian),colormap gray,title('Noisy image')
    subplot(2,2,3), imhist(uint8(img),256), ylim([0, 1500]), title(' original image histogram')
    subplot(2,2,4), imhist(uint8(img_gaussian),256), ylim([0, 1500]), title('Noisy image histogram')


[img_salt_pepper]= noise(img); %salt and pepper noise
figure, sgtitle('Adding salt and pepper noise')
    subplot(2,2,1), imagesc(img), colormap gray, title('original image')
    subplot(2,2,2),imagesc(img_salt_pepper),colormap gray,title('Noisy image')
    subplot(2,2,3), imhist(uint8(img),256), ylim([0, 1500]), title(' original image histogram')
    subplot(2,2,4), imhist(uint8(img_salt_pepper),256), ylim([0, 1500]), title('Noisy image histogram')


  %% remove noise with moving average of the image with gaussian noise
  
 [img_average3,K3]= moving_average(img_gaussian, 3 ); % with 3x3 pixels
 figure, sgtitle('Moving average filter 3x3')
    subplot(3,2,1), imagesc(K3), colormap gray, title('Filter image')
    subplot(3,2,2), surf(K3), colormap gray, title('Filter surface')
    subplot(3,2,3), imagesc(img_gaussian), colormap gray, title(' noisy image')
    subplot(3,2,4), imagesc(img_average3), colormap gray, title('Filtered image')
    subplot(3,2,5), imhist(uint8(img_gaussian),256), ylim([0, 1500]), title(' noisy image histogram')
    subplot(3,2,6), imhist(uint8(img_average3),256), ylim([0, 1500]), title('Filtered image histogram') 

 
    [img_average7,K7]=moving_average(img_gaussian, 7 ); % with 7x7 pixels
  figure, sgtitle('Moving average filter 7x7')
    subplot(3,2,1), imagesc(K7), colormap gray, title('Filter image')
    subplot(3,2,2), surf(K7), colormap gray, title('Filter surface')
    subplot(3,2,3), imagesc(img_gaussian), colormap gray, title(' noisy image')
    subplot(3,2,4), imagesc(img_average7), colormap gray, title('Filtered image')
    subplot(3,2,5), imhist(uint8(img_gaussian),256), ylim([0, 1500]), title(' noisy image histogram')
    subplot(3,2,6), imhist(uint8(img_average3),256), ylim([0, 1500]), title('Filtered image histogram') 
    
    %the same thing can be done using the image with salt and peper noise,
    %simply passing it as input in the function moving_average()

%% remove noise with gaussian lpf of the image with gaussian noise

[L3,img_lpf3]= gaussian_lpf (img_gaussian,3); %with 3x3 pixels
 figure, sgtitle('Gaussian lpf 3x3')
    subplot(3,2,1), imagesc(L3), colormap gray, title('Filter image')
    subplot(3,2,2), surf(L3), colormap gray, title('Filter surface')
    subplot(3,2,3), imagesc(img_gaussian), colormap gray, title(' noisy image')
    subplot(3,2,4), imagesc(abs(img_lpf3)), colormap gray, title('Filtered image')
    subplot(3,2,5), imhist(uint8(img_gaussian),256), ylim([0, 1500]), title(' noisy image histogram')
    subplot(3,2,6), imhist(uint8(img_lpf3),256), ylim([0, 1500]), title('Filtered image histogram') 

[L7,img_lpf7]= gaussian_lpf (img_gaussian,7); %with 7x7 pixels
 figure, sgtitle('Gaussian lpf 7x7')
    subplot(3,2,1), imagesc(L7), colormap gray, title('Filter image')
    subplot(3,2,2), surf(L7), colormap gray, title('Filter surface')
    subplot(3,2,3), imagesc(img_gaussian), colormap gray, title(' noisy image')
    subplot(3,2,4), imagesc(abs(img_lpf7)), colormap gray, title('Filtered image')
    subplot(3,2,5), imhist(uint8(img_gaussian),256), ylim([0, 1500]), title(' noisy image histogram')
    subplot(3,2,6), imhist(uint8(img_lpf7),256), ylim([0, 1500]), title('Filtered image histogram') 
    
    %the same thing can be done using the image with salt and peper noise,
    %simply passing it as input in the function gaussian_lpf()
    
%% remove noise with median filter on an image with salt and pepper noise

[img_mf3]= median_filter(img_salt_pepper,3); %using 3x3 pixels
figure, sgtitle('Median filter 3x3 pixels')
    subplot(2,2,1), imagesc(img_salt_pepper), colormap gray, title(' noisy image')
    subplot(2,2,2),imagesc(img_mf3),colormap gray,title('Filtered image')
    subplot(2,2,3), imhist(uint8(img_salt_pepper),256), ylim([0, 1500]), title(' noisy image histogram')
    subplot(2,2,4), imhist(uint8(img_mf3),256), ylim([0, 1500]), title('Filtered image histogram')

    
    [img_mf7]= median_filter(img_salt_pepper,7); %using 7x7 pixels
figure, sgtitle('Median filter 7x7 pixels')
    subplot(2,2,1), imagesc(img_salt_pepper), colormap gray, title(' noisy image')
    subplot(2,2,2),imagesc(img_mf7),colormap gray,title('Filtered image')
    subplot(2,2,3), imhist(uint8(img_salt_pepper),256), ylim([0, 1500]), title(' noisy image histogram')
    subplot(2,2,4), imhist(uint8(img_mf7),256), ylim([0, 1500]), title('Filtered image histogram')
    
    %the same thing can be done using the image with gaussian noise,
    %simply passing it as input in the function median_filter()

%% linear filters

%inaltered image
[I,img_inaltered]=inaltered(img,7);
 figure, sgtitle('Inaltering filter')
    subplot(2,2,1), imagesc(I), colormap gray, title('Filter image')
    subplot(2,2,2), surf(I), colormap gray, title('Filter surface')
    subplot(2,2,3), imagesc(img), colormap gray, title('Original')
    subplot(2,2,4), imagesc(img_inaltered), colormap gray, title('Filtered')
    
%shifted image
[S,img_shifted]=shifted_left(img,7);
 figure, sgtitle('Shifting filter')
    subplot(2,2,1), imagesc(S), colormap gray, title('Filter image')
    subplot(2,2,2), surf(S), colormap gray, title('Filter surface')
    subplot(2,2,3), imagesc(img), colormap gray, title('Original')
    subplot(2,2,4), imagesc(img_shifted), colormap gray, title('Filtered')

%blurred image
[B,img_blurred]=blurred(img,7);
 figure, sgtitle('Blurring filter')
    subplot(2,2,1), imagesc(B), colormap gray, title('Filter image')
    subplot(2,2,2), surf(B), colormap gray, title('Filter surface')
    subplot(2,2,3), imagesc(img), colormap gray, title('Original')
    subplot(2,2,4), imagesc(img_blurred), colormap gray, title('Filtered')
    
%sharpened image
[SH,img_sharpened]=sharpened(img,7);
 figure, sgtitle('Sharpening filter')
    subplot(2,2,1), imagesc(SH), colormap gray, title('Filter image')
    subplot(2,2,2), surf(SH), colormap gray, title('Filter surface')
    subplot(2,2,3), imagesc(img), colormap gray, title('Original')
    subplot(2,2,4), imagesc(img_sharpened), colormap gray, title('Filtered')

 %% fourier transform
 
 % display the magnitude (log) of the transformed image
 img_fft = fftshift(fft2(img));
 figure, imagesc(log(abs(img_fft))), colormap gray, xlabel('wx'), ylabel('wy'), title('log(abs(FFTtransform)) of the original image') 

 %display the magnitude of the transformed low-pass Gaussian filter 
 sigma = 5;
 L = fspecial('gaussian', 101, sigma);
 L_fft = fftshift(fft2(L));
 figure, imagesc(log(abs(L_fft))), colormap gray, xlabel('wx'), ylabel('wy'), title('log(abs(FFTtransform)) of the gaussian filter') 
 
% display the magnitude of the transformed sharpening filter
 SH_fft =fftshift( fft2 (SH));
 figure, imagesc(log(abs(SH_fft))), colormap gray, xlabel('wx'), ylabel('wy'), title('log(abs(FFTtransform)) of the sharpening filter') 

