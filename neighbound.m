function boundary = neighbound(im)
%%% This function extracts the boundary of an object from a binary image.
boundary = zeros(size(im));     %Boundary image
[M,N] = size(im);               %Original image dimensions

%Pixel is boundary if exactly half of its neighbours are object
for m = 2:M-1
    for n = 2:N-1
        if(im(m,n) == 1)
            n4 = [im(m-1,n), im(m+1,n), im(m,n-1), im(m,n+1)];
            boundary(m,n) = (sum(n4) <= 3);
        end
    end
end
end