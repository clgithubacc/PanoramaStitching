function [maxMin] = findMaxMin(DoG)
%FINDMAXMIN label min max values given three DoGs
%   Dog is a (x,y,3) matrix
mask=true(3);
allMax=cat(3,imdilate(DoG(:,:,1), mask),imdilate(DoG(:,:,2),...
    mask),imdilate(DoG(:,:,3), mask));
allMin=cat(3,imerode(DoG(:,:,1), mask),imerode(DoG(:,:,2),...
    mask),imerode(DoG(:,:,3), mask));
localMax=max(allMax,[],3);
localMin=min(allMin,[],3);
maxMin=~((localMax-DoG(:,:,2))|(localMin-DoG(:,:,2)))
end

