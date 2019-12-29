function binary_im = segthresh(data, bins)
%%% This function segments an image based on thresholding.

%% Show histogram
figure; [h, pixval] = hist(data(:), bins);
bar(pixval, h); title("Histogram of pixel values"); grid on; grid minor;
xlabel("Pixel intensity"); ylabel("Pixel count"); hold on;

%% Threshold estimation
numT = input("Select number of unique classes: ") - 1;
p1 = zeros(1,numT);
p2 = zeros(1,numT);

%Intermax method
T_intrmax = pixval(round(thresh_intermax(h,numT)));
for i = 1:length(T_intrmax)
    p1(i) = line([T_intrmax(i), T_intrmax(i)], ylim, 'LineWidth', 1, 'Color', 'r');
end

%Local minima method
T_lclmin = pixval(round(thresh_localmin(h,numT)));
for i = 1:length(T_lclmin)
    p2(i) = line([T_lclmin(i), T_lclmin(i)], ylim, 'LineWidth', 1, 'Color', 'b');
end

%Add legend
linehandles = [p1 p2];
cols = cell2mat(get(linehandles, 'color')); [~, uidx] = unique(cols, 'rows', 'stable');
legend(linehandles(uidx), {'Midpoint between local maxima', 'Local minima in inter-maxima range'});

%% Thresholding
if(numT == 1)
    X_itrmx = data > T_intrmax;
    figure; imagesc(X_itrmx); colormap(gray()); axis image; colorbar;
    title("Segmentation using Intermax Method");
    
    X_lcmin = data > T_lclmin;
    figure; imagesc(X_lcmin); colormap(gray()); axis image; colorbar;
    title("Segmentation using Local Minima Method");
    
elseif(numT == 2)
    region = input("Select inter-threshold region of interest (1, 2 or 3): ");
    check = false;
    while(check == false)
        switch region
            case 1
                X_itrmx = data < T_intrmax(1);
                figure; imagesc(X_itrmx); colormap(gray()); axis image; colorbar;
                title("Segmentation using Intermax Method");
                
                X_lcmin = data < T_lclmin(1);
                figure; imagesc(X_lcmin); colormap(gray()); axis image; colorbar;
                title("Segmentation using Local Minima Method");
                
                check = true;
            case 2
                X_itrmx = (data > T_intrmax(1)) & (data < T_intrmax(2));
                figure; imagesc(X_itrmx); colormap(gray()); axis image; colorbar;
                title("Segmentation using Intermax Method");
                
                X_lcmin = (data > T_lclmin(1)) & (data < T_lclmin(2));
                figure; imagesc(X_lcmin); colormap(gray()); axis image; colorbar;
                title("Segmentation using Local Minima Method");
                
                check = true;
            case 3
                X_itrmx = data > T_intrmax(2);
                figure; imagesc(X_itrmx); colormap(gray()); axis image; colorbar;
                title("Segmentation using Intermax Method");
                
                X_lcmin = data > T_lclmin(2);
                figure; imagesc(X_lcmin); colormap(gray()); axis image; colorbar;
                title("Segmentation using Local Minima Method");
                
                check = true;
            otherwise
                disp("Invalid selection, please try again.");
        end
    end
end

%% Output selection
check = false;
while(check == false)
    sel = input("Choose between inter-maximum method (1) or local minimum method (2): ");
    switch sel
        case 1
            binary_im = X_itrmx;
            check = true;
        case 2
            binary_im = X_lcmin;
            check = true;
        otherwise
            disp("Invalid selection, please try again.");
    end
end
end