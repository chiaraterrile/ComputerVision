function [mX,mY]=NCC(img,T,string,plotImg,str)

C = normxcorr2(T, img);%Normalized 2-D cross-correlation

[mY, mX] = find(C == max(C(:)));
Tx = size(T, 1);
Ty = size(T, 2);

%Account for the padding that normxcorr2 adds
mX = mX - Tx/2;
mY = mY - Ty/2;

%Compute the coordinates of the top left vertex (to plot the rectangle)
minX = mX - Tx/2;
minY = mY - Ty/2;

text = ('template of the car');
newStr = insertAfter(text,"the",string);
text2 = ('normalized cross correlation ( car)');
newStr2 = insertAfter(text2,"(",string);

if(plotImg)
    figure, sgtitle(str)
    subplot (221),imagesc(img),colormap gray, title ('original image')
    subplot(222),imagesc(T),colormap gray,title (newStr)
    subplot(223),imagesc(C),colormap gray , title (newStr2)
    subplot(224),imagesc(img),colormap gray,title('Detected object ')
    hold on
    plot(mX,mY,'*r')
    rectangle('Position',[minX, minY, Tx, Ty],'EdgeColor',[1,0,0])
end

end