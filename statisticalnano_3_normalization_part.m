clear
I=imread('J:\Nano\maghale poorfard\Shingubara\Shingu02-04-315.bmp');
I=rgb2gray(I);
% [d2,d1]=size(I);
d1=100;d2=200;
for i=0:59
    theta=i*pi/180;
    dx=round(d2*sin(theta)+d1*cos(theta));
    yx=1:dx;
    [y1x,k]=min(round([d2*sin(theta),d1*cos(theta)]));
    if k==1
        n1x=d2/cos(theta);
    else
        n1x=d1/sin(theta);
    end
    nx(1:y1x)=yx(1:y1x)*n1x/y1x;
    nx(y1x+1:dx-y1x)=n1x;
    nx(dx-y1x+1:dx)=n1x/y1x*(dx-yx(dx-y1x+1:dx));
    subplot(2,1,1);
    plot(nx); title('X direction');
        
   
    dy=round(d1*sin(theta)+d2*cos(theta));
    yy=1:dy;
    [y1y,k]=min(round([d1*sin(theta),d2*cos(theta)]));
    if k==1
        n1y=d1/cos(theta);
    else
        n1y=d2/sin(theta);
    end
    ny(1:y1y)=yy(1:y1y)*n1y/y1y;
    ny(y1y+1:dy-y1y)=n1y;
    ny(dy-y1y+1:dy)=n1y/y1y*(dy-yy(dy-y1y+1:dy));
    subplot(2,1,2);
    plot(ny); title('Y direction');xlabel(['Angle= ',num2str(i)]);
    pause
end
    