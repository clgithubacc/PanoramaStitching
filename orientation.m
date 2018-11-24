function [magnitude,orientation] = orientation(L)
[r,c]=size(L);
magnitude=zeros(r,c);
orientation=zeros(r,c);
for i=2:(r-1)
    for j=2:(c-1)
        magnitude(i,j) = sqrt((L(i+1,j)-L(i-1,j))^2+(L(i,j+1)-L(i,j-1))^2);
        orientation(i,j) = atan2(L(i,j+1)-L(i,j-1),L(i+1,j)-L(i-1,j))*(180/pi);
    end 
end 
end

