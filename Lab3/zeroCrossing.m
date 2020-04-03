function [edges]=zeroCrossing (img_conv,th)
 
[r , c] = size(img_conv);
edges = zeros(r, c);

%% Scan columns for zero-crossing
for k = 1:r %For each row
    for i = 1:c-1 %Check the zero-crossing between two adjacent columns
        if( (img_conv(k, i) < 0 && img_conv(k, i+1) > 0) || (img_conv(k, i) > 0 && img_conv(k, i+1) < 0) )
            %Check the threshold
            if( abs(img_conv(k, i) - img_conv(k, i+1)) > th)
                edges(k, i) = 1;
            end
        %It is really unlikely that the value of a pixel is exactly zero but let's
        %check also for the cases {+0-} and {-0+}
        elseif (img_conv(k, i) == 0 && (imgFiltered(k, i-1) * imgFiltered(k, i+1) < 0))
            if ( abs(imgFiltered(k, i-1) - imgFiltered(k, i+1)) / 2 > threshold)
                edges(k,i) = 1;
            end
        end
    end
end

%% Scan rows for zero-crossing
for k = 1:c %For each column
    for i = 1:r-1 %Check the zero-crossing between two adjacent rows
        if( (img_conv(i, k) < 0 && img_conv(i+1, k) > 0) || (img_conv(i, k) > 0 && img_conv(i+1, k) < 0) )
            %Check the threshold
            if( abs(img_conv(i, k) - img_conv(i+1, k)) > th)
                edges(i, k) = 1;
            end
        %It is really unlikely that the value of a pixel is exactly zero but let's
        %check also for the cases {+0-} and {-0+}
        elseif (img_conv(i, k) == 0 && (imgFiltered(i-1, k) * imgFiltered(i+1, k) < 0))
            if ( abs(imgFiltered(i-1, k) - imgFiltered(i+1, k)) / 2 > threshold)
                edges(i,k) = 1;
            end
        end
    end
end


end