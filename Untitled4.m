octaves = 4;
blur_level = 5;
difference_level = 4;
img = imread('a1.jpg');

img = rgb2gray(img);
img = im2double(img);
k = sqrt(2);
sigma = sqrt(2);

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
pts=findMaxMin(L1(:,:,(1:3)),0.001);
[arows1,acols1]=find(pts);
pts=findMaxMin(L1(:,:,(2:4)),0.001);
[arows2,acols2]=find(pts);

octaves = 4;
blur_level = 5;
difference_level = 4;
img = imread('a2.jpg');

img = rgb2gray(img);
img = im2double(img);
k = sqrt(2);
sigma = sqrt(2);

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
pts=findMaxMin(L1(:,:,(1:3)),0.001);
[brows1,bcols1]=find(pts);
pts=findMaxMin(L1(:,:,(2:4)),0.001);
[brows2,bcols2]=find(pts);


img1 = imread('a1.jpg');
f1=figure;
imshow(img1);
hold on
plot(acols1, arows1, 'ro')
plot(acols2, arows2, 'go')
hold off
pause;

f2=figure;
imshow(img);
hold on
plot(bcols1, brows1, 'ro')
plot(bcols2, brows2, 'go')
hold off
pause;