
octaves = 4;
blur_level = 5;
difference_level = 4;
img = imread('img.jpg');

img = rgb2gray(img);
img = im2double(img);
k = sqrt(2);
sigma = 1.6;

first_octaves = [sigma, k*sigma, (k^2)*sigma, (k^3)*sigma, (k^4)*sigma];
second_octaves = [(k^2)*sigma, (k^3)*sigma, (k^4)*sigma, (k^5)*sigma, (k^6)*sigma ];
third_octaves = [(k^4)*sigma, (k^5)*sigma, (k^6)*sigma, (k^7)*sigma, (k^8)*sigma ];
fourth_octaves = [(k^6)*sigma, (k^7)*sigma, (k^8)*sigma, (k^9)*sigma, (k^10)*sigma ];

G1 = construct_octave(blur_level,img,first_octaves); 
img2 = reduce(img);
G2 = construct_octave(blur_level,img2,second_octaves);
img3 = reduce(img2);
G3 = construct_octave(blur_level,img3, third_octaves);
img4 = reduce(img3);
G4 = construct_octave(blur_level,img4, fourth_octaves);

L1 = DoG(G1);
L2 = DoG(G2);
L3 = DoG(G3);
L4 = DoG(G4);

figure;
for i=1:5
    subplot(3,2,i), imshow(G1(:,:,i),[])
end

pause;

figure;
for i=1:5
    subplot(3,2,i), imshow(G2(:,:,i),[])
end

pause;

figure;
for i=1:5
    subplot(3,2,i), imshow(G3(:,:,i),[])
end

pause;

figure;
for i=1:5
    subplot(3,2,i), imshow(G4(:,:,i),[])
end
close all;
