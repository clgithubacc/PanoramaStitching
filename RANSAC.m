function [bestH,bestNumOfInliers] = RANSAC(pts,numOfRandomPoints,threshold,distance,iterations)
%RANSAC Summary of this function goes here
%   Detailed explanation goes here
% Functions used in this file: 
% - computeHomography(points)
debugMode=false;
bestH=zeros(3);
bestNumOfInliers=0;
bestInliers=[];
numOfPts=size(pts,1);
for i=1:iterations
    randPtIndex=randperm(numOfPts,numOfRandomPoints);
    randPts=pts(randPtIndex,:);
    H=computeHomography(randPts);
    transformedPts=transformPoints(pts(:,[1 2]),H);
    ptsDifference=abs(transformedPts-pts(:,[3 4]));
    ptsDifference=sqrt(ptsDifference(:,1).^2+ptsDifference(:,2).^2);
    inlierIndexes=ptsDifference<distance;
    numOfInliers=sum(inlierIndexes,'all');
    %%% Method 1
    if numOfInliers>bestNumOfInliers
        bestH=H;
        bestNumOfInliers=numOfInliers;
        bestInliers=pts(inlierIndexes,:);
    end
    %%% Method 2
%     if numOfInliers>threshold
%         bestH=H;
%         break;
%     elseif numOfInliers>bestNumOfInliers
%         bestH=H;
%         bestNumOfInliers=numOfInliers;
%     end
end
%re-estimate model
if size(bestInliers)==[0 0]
    error('Error in RANSAC(): No inliers for re-estimation.')
else
    bestH=computeHomography(bestInliers);
end
if debugMode
    disp(bestH)
    disp(bestNumOfInliers)
    disp(bestInliers)
end
end