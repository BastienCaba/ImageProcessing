function data = seeRGBandHSV(X)
%%% This function displays image in RGB and HSV spaces
figure("Name", "Top: red, green and blue channels; Bottom: hue, saturation and value channels");
names = ["Red Channel (R)", "Blue Channel (B)", "Green Channel (G)", "Hue Channel (H)", "Saturation Channel (S)", "Value Channel (V)"];

%% Show RBG channels
for i = 1:3
    subplot(2,3,i); imagesc(X(:,:,i)); axis image;
    colormap(gray(256)); colorbar; title(names(i));
end

%% Show HSV channels
Y = rgb2hsv(X);
for i = 4:6
    subplot(2,3,i); imagesc(Y(:,:,i-3)); axis image;
    colormap(gray(256)); colorbar; title(names(i));
end

%% Extract preferred channel
check = false;
while(check == false)
    sel = input("Channel selection (R, G, B, H, S or V): ", 's');
    switch sel
        case 'R'
            data = double(X(:,:,1));
            check = true;
        case 'G'
            data = double(X(:,:,2));
            check = true;
        case 'B'
            data = double(X(:,:,3));
            check = true;
        case 'H'
            data = double(Y(:,:,1));
            check = true;
        case 'S'
            data = double(Y(:,:,2));
            check = true;
        case 'V'
            data = double(Y(:,:,3));
            check = true;
        otherwise
            disp("Invalid selection, please try again.");
    end
end
end