function [info,X,map] = dicom_open(filename)
%%% This function opens and visualises DICOM 3.0 files
%% Parameter definitions
repeat = 10;    %Number of video loops
fps = 15;       %Frames per second

%% Open file
info = dicominfo(filename);     %Header extraction
[X,map] = dicomread(filename);  %Data extraction

%% Visalise file
montage(X,map);
movie(immovie(X,map),repeat,fps);
end