function minID = thresh_intermax(h, numT)
%%% Automatic thresholding based on midpoint between local maxima
lclmax_idx = islocalmax([0 h 0]);
locmax = sort(h(lclmax_idx(2:end-1)), 'descend');   %Local maxima
maxID = find(ismember(h,locmax(1:numT+1)));         %Position of numT largest maxima
minID = maxID(1:end-1) + diff(maxID)/2;             %Position of midpoints btwn maxima
end