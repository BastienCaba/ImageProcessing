function minID = thresh_localmin(h, numT)
%%% Automatic thresholding based on local minima
%% Find local maxima
lclmax_idx = islocalmax([0 h 0]);
locmax = sort(h(lclmax_idx(2:end-1)), 'descend');   %Local maxima
maxID = find(ismember(h,locmax(1:numT+1)));         %Position of numT largest maxima

%% Find local minima between local maxima
minID = zeros(1,numT);
for i = 1:numT
    hrange = h(maxID(i):maxID(i+1));                %Intermax range
    minID(i) = find(hrange == min(hrange));         %Local minima in intermax range
end
minID = minID + maxID(1:numT) - 1;
end