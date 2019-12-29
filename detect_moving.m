function blood = detect_moving(X,map)
%%% This function computes proportion of moving blood per frame
%% Parameter extraction
M = length(X(1,:,:,:));     %Extract no. rows
N = length(X(:,1,:,:));     %Extract no. columns
L = size(X,4);              %Extract no. frames

%% Moving blood proportion
gray_idx = find((map(:,1) == map(:,2)) & (map(:,2) == map(:,3)));
blood = zeros(1,L);         %Proportion of moving blood per frame

for i = 1:L
    frame = X(:,:,1,i);
    backgnd = ismember(frame,gray_idx);
    blood(i) = 100*sum(sum(not(backgnd)))/(M*N);
end
end