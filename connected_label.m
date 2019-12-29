function out = connected_label(image)
%%% Connected Component Labelling
%% Parameters
[M,N] = size(image);    %Row and column dimensions of image im
out = zeros(M,N);       %Initialize output image

%% Label each pixel
label = 0;          %Initialize label
for m = 1:M
    for n = 1:N
        if(image(m,n) == 1)
            label = label + 1;
            out(m,n) = label;
        else
            out(m,n) = 0;
        end
    end
end

%% Label each component
temp = zeros(size(out));
while(sum(sum((temp - out))) ~= 0)
    temp = out;
    %Forward pass
    for m = 2:M-1
        for n = 2:N-1
            if(out(m,n) ~= 0)
                n4 = nonzeros([out(m,n), out(m-1,n), out(m+1,n), out(m,n-1), out(m,n+1)]);
                out(m,n) = min(n4);
            end
        end
    end
    %Backward pass
    for m = M-1:-1:2
        for n = N-1:-1:2
            if(out(m,n) ~= 0)
                n4 = nonzeros([out(m,n), out(m-1,n), out(m+1,n), out(m,n-1), out(m,n+1)]);
                out(m,n) = min(n4);
            end
        end
    end
end
end