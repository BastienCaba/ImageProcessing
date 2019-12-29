function T = threshold(datA, datB)
%%% This function automatically finds a class-separating threshold
Pa = length(datA);   %Prior probability for class A
Pb = length(datB);   %Prior probability for class B

%% Computes threshold assuming Gaussian data distributions
T = (mean(datA) + mean(datB))/2 + ((sigma^2)/(mean(datA)-mean(datB)))*log(Pb/Pa);
end