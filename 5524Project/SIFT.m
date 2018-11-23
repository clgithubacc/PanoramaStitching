octaves = 4;
blur_level = 5;
difference_level = 4;
img = imread('img.jpg');
img = rgb2gray(img);
img = im2double(img);
k = sqrt(2);
sigma = 1.6;
G1 = 


first_octaves = [sigma, k*sigma, (k^2)*sigma, (k^3)*sigma, (k^4)*sigma];