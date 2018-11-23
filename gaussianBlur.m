function [img] = gaussianBlur (Ig,a)
wx = [.25-.5*a, .25, a, .25, .25-.5*a];
img1=imfilter(Ig,wx);
wy=transpose(wx);
img=imfilter(img1,wy);
end


