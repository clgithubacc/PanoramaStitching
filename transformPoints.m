function [outputArg1,outputArg2] = transformPoints(points, H)
%TRANSFORMPOINTS transform points given H
% points: N*2 matrix, where columns are x1,y1,x2,y2
% H: a 3*3 matrix.
hpoints=[points,ones(size(img1,1),1)]
newpts=(H*img1h')';
newpts=newpts(:,[1 2])./newpts(:,3);
%newpts=[newpts(:,1).*img2xl2 newpts(:,2).*img2yl2];
end

