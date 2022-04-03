function [I2] = f(img)
% f returns the img been made to (0,1), which use a threshold provided by
% the system. 
the=graythresh(img);
I2 = im2bw(img,the);
end