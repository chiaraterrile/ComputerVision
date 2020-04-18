function imgScale(img,string)
figure, sgtitle(string)
subplot(3,4,1),imagesc(img),colormap gray, title ('original image')
[h,w]=size(img);
sigma=1;%standard deviation of LoG
n=10;%number of scales
scale_space = zeros(h,w,n);

for ii=1:n
    filt_size =  2*ceil(3*sigma)+1; % filter size
    LoG       =  sigma^2 * fspecial('log', filt_size, sigma); %scale-normalized Laplacian of Gaussian filter
    imFiltered = imfilter(img, LoG, 'same', 'replicate');
    scale_space(:,:,ii)=abs(imFiltered);
    str=['scale: ',num2str(sigma)];
    subplot(3,4,ii+1),imagesc(imFiltered),colormap gray, title (str)
    radii(ii)=sigma;
    sigma=1.5*sigma;
end

end