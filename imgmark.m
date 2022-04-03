function [iou]=imgmark(img1,img2)
%The function returns the iou of img1 and img2
%In the funciton, we think the white point(1) is the predicted cell
%nucili.If not, you should consider change it in the main fuction.
%this function must get params in (0,1)!
inter=0;
union1=0;
union2=0;
k=0;
[m0,n0]=size(img1);
[m1,n1]=size(img2);
if m0==m1&&n0==n1
for i=1:m0
    for j=1:n0
        if (img1(i,j)==1)&&(img2(i,j)==1)
            inter=inter+1;%white point is viewed as the right one.
        else if img1(i,j)==1 
            union1=union1+1;
            else if  img2(i,j)==1
                    union2=union2+1;
                else k=k+1;
                end
            end
        end
   
    end
end
iou=inter/(union1+union2+inter);
end
end


            