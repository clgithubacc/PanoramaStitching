mkdir('lib/vlfeat-0.9.20')
addpath(genpath('lib/vlfeat-0.9.20'))
Im = imread('a1.jpg');
Im = rgb2gray(Im);
Im=single(Im);
% Im = im2double(Im);
% get features and descriptors
[f, d] = vl_sift(Im, 'EdgeThresh', 10);
imshow(uint8(Im));
hold on;
plot(f(1,:), f(2,:), 'ro')