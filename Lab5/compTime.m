function compTime(img, T)
notShow = false; %to not show the images
x = size(T, 2);
y = size(T, 1);

%Start a timer
N = 10;

t = cputime;

 for i=1:N  % Make N cycle and average the result in order to have more precision
     NCC(img,T,' black',notShow);
 end
     
%Time elapsed
e = (cputime - t)/N;
X = sprintf(['The computational time for a template ', num2str(x) , 'x' , num2str(y) , ' is %d'], e);
disp(X);


end

