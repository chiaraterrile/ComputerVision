function accuracyDet(T,img)
notShow = false;
[mX,mY]=NCC(img,T,' black',notShow);
x = size(T, 2);
y = size(T, 1);
X = sprintf(['The pixel found by a window ', num2str(x), 'x', num2str(y), ' is [', num2str(mX), ',', num2str(mY),']']);
disp(X);
end