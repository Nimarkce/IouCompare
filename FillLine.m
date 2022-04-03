function [I2] = FillLine(img)
%FillLine fuction returns a (0,1) img, as we suppose the boundary is noted
%by a black line, totally black.
the = 0.001;
I1 = im2bw(img,the);
I2=~imfill(~I1,[1,1]);
end

