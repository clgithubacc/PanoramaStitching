function [G] = construct_octave(level,img,sigmas)
G(:,:,1) = imgaussfilt(img, sigmas(1));
for i=2:level
    G(:,:,i) = imgaussfilt(G(:,:,i-1),sigmas(i));
end 
end

