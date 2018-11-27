addpath(genpath('..'))
correctHomo=load('..\homography.txt');
noisyHomo=load('..\homographyTEST.txt');
%Test RANSAC(pts,numOfRandomPoints,threshold,distance,iterations)
[H numOfInliers]=RANSAC(noisyHomo,4,20,5,1000);
disp('H from noisyHomo');
disp(H);
[H numOfInliers]=RANSAC(correctHomo,4,20,5,1000);
disp('H from correctHomo');
disp(H);