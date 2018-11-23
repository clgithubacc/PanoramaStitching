% a=[1 2 3;
%    4 5 6;
%    7 8 9];
% q=rand(3000);
% tic
% localMinImage = imerode(q, true(3));
% localMaxImage = imdilate(q, true(3));
% toc
tt=cat(3,rand(3),rand(3),rand(3));
tt
max(tt,[],3)