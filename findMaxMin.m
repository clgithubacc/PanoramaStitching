function [maxMinValues] = findMaxMin(DoG,threshold)
%FINDMAXMIN label min max values given three DoGs
%   Dog is a (x,y,3) matrix

%important variables:
maskSize=3; %mask size (square mask) for checking min/max
sigma=1; %sigma for gauss blur in point removal
r=10; % value of r for point removal
[rnum, cnum,~]=size(DoG);


middleLayer=DoG(:,:,2);
mask=true(maskSize);
allMax=cat(3,imdilate(DoG(:,:,1), mask),imdilate(DoG(:,:,2),...
    mask),imdilate(DoG(:,:,3), mask));
allMin=cat(3,imerode(DoG(:,:,1), mask),imerode(DoG(:,:,2),...
    mask),imerode(DoG(:,:,3), mask));
localMax=max(allMax,[],3);
localMin=min(allMin,[],3);
nonKeyPts=logical(((localMax-middleLayer)&(localMin-middleLayer)));
maxMinValues=middleLayer;
maxMinValues(nonKeyPts)=0;
%Remove points given hard threshold
maxMinValues(abs(maxMinValues)<threshold)=0;
%maxMin=~((localMax-DoG(:,:,2))|(localMin-DoG(:,:,2)));

%Remove non-corner points
G1=fspecial('gaussian',2*ceil(3*sigma)+1, sigma);
sigma2=0.7;
G2=fspecial('gaussian',2*ceil(3*sigma2)+1, sigma2);
[Gx,Gy] = gradient(G2);
a=0.05;
Dx=imfilter(middleLayer,Gx,'replicate');
Dx2=Dx.^2;
Dy=imfilter(middleLayer,Gy,'replicate');
Dy2=Dy.^2;
DxDy=Dy.*Dx;
aPlusB=Dx2+Dy2;
ab=Dx2.*Dy2-(DxDy.^2);
TrDivDet=(aPlusB.^2)./ab;
TrDivDet(TrDivDet>=(((r+1)^2)/r))=0;
maxMinValues(~(maxMinValues&TrDivDet))=0;
end

