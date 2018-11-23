function [L] = DoG(G)
[~,~,level]=size(G);
for i=2:level
    L(:,:,i-1)=G(:,:,i)-G(:,:,i-1);
end
end

