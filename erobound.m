function boundary = erobound(im)
%%% This function extracts the boundary of an object from a binary image.
s = strel('disk',2);        %Structuring element (disk)
ero_im = imerode(im,s);     %Erode the image by structuring element
boundary = im - ero_im;     %Boundary extraction
end