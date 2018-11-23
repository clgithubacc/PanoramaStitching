function [reduced] = reduce(img)
   s=size(img);
   reduced=zeros( uint8(s(1)/2) , uint8(s(2)/2) );
   for r=1:s(1)
       for c=1:s(2)
           if rem(r,2)==1 && rem(c,2)==1
               reduced(uint8(r/2),uint8(c/2))=img(r,c);
           end 
       end   
       
   end
   
end 