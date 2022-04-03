%需要把constantread.m; f.m; FillLine.m; imgmark.m四个文件和图片放在同一个目录下才能召唤iou.
% These FOUR files( constantread.m; f.m; FillLine.m; imgmark.m ) must be
% put to the same dictionary with the pictures. Then you can CALL iou. 
a=dir('*.png');
[m,n]=size(a);
for i=1:m
    pic(i).pic=imread(a(i).name);
    pic(i).name=a(i).name;
    pic(i).number=i;
    pic(i).stat=1;%no calculated iou
    %pic(i).name=a(i).name;
    [c,b]=size(a(i).name);
 %   if b>=12
 %   st=a(i).name;
 %   pic(i).nametocompare=st(1:12);
 %   else
    pic(i).nametocompare=a(i).name;
    
end
%So we can construct several pics(struct)
%next we are going to get iou[]
i1=1;
for i=1:m
    if (pic(i).stat==1) 
        for j=i:m%find img(j) to compare iou
           % if (pic(i).nametocompare==pic(j).nametocompare)
           if strcmp(pic(i).nametocompare,pic(j).nametocompare)
                 pic(j).stat=0; % having calculated.
                 iou(i1)=imgmark(FillLine(pic(i).pic),FillLine(pic(j).pic));
                 pic(i).peer=j;
                 pic(j).peer=i;
            end
        end
        i1=i1+1;
    end
end  
[m,n]=size(iou);
sum=0;
for i=1:n
    sum=sum+iou(i);
end
acc=sum/n;%准确率
            

            
