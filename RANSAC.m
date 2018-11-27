function [bestH,highestInliers] = RANSAC(pts,numOfRandomPoints,threshold,distance,iterations)
%RANSAC Summary of this function goes here
%   Detailed explanation goes here
% Functions used in this file: 
% - computeHomography(points)

bestH=zeros(3);
highestInliers=0;
numOfPts=size(pts,1);
for i=1:iterations
    randPtIndex=randperm(numOfPts,numOfRandomPoints);
    randPts=pts(randPtIndex,:);
    H=computeHomography(randPts);
    transformedPts=transformPoints(pts(:,[1 2],H));
    ptsDifference=abs(transformedPts-pts(:,[3 4]));
    numOfInliers=sum(ptsDifference<distance,'all');
    if numOfInliers>threshold
        bestH=H;
        break;
    elseif numOfInliers>highestInliers
        bestH=H;
        highestInliers=numOfInliers;
    end
end
end