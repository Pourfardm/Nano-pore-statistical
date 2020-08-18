clear;
close all;
% I=imread('J:\Nano\maghale poorfard\Shingubara\Shingu02-02-20.tif');
% I=imread('J:\Nano\maghale poorfard\Shingubara\Shingu01.tif');
% I=imread('C:\Users\pourfard\Documents\MATLAB\statistical nano code\special pics.jpg');
% % I=imread('C:\Users\pourfard\Pictures\specialpics.jpg');
I=imread('C:\Users\pourfard\Documents\MATLAB\statistical nano code\ab4.tif');
% I=imread('J:\Nano\maghale poorfard\SEM-Arab\2-3-2-.tif');
% I=imread('J:\Nano\maghale poorfard\Shingubara\Shingu02-04-315.bmp');
I=rgb2gray(I);
II=ones(size(I));

for theta=0:59
    nx=sum(imrotate(II,theta));%nx=nx'; %For normalize x
    ny=sum(imrotate(II,theta),2);%ny=ny'; %For normalize y
    nx(nx==0)=1;
    ny(ny==0)=1;
    
    J=imrotate(I,theta); 
    
    subplot(3,3,2);
    imshow(J);title(num2str(theta));xlabel('(b)');
    
    r1=sum(J,2);
    r1c=r1./ny;
    
    subplot(3,3,1);
    v1(theta+1)=var(r1c);
    plot(r1c(end:-1:1),1:length(r1c)); axis tight; title('Normalized Sum y');xlabel('(a)');
    subplot(3,3,3);
    plot(r1(end:-1:1),1:length(r1)); axis tight;   title('Sum y');xlabel('(c)');
    
    r2=sum(J);
    r2c=r2./nx;
    subplot(3,3,4);
    plot(r2c);axis tight; title('Normalized Sum x');xlabel('(d)');
    subplot(3,3,5);
    plot(r2);axis tight; title('Sum x');xlabel('(e)');
    v2(theta+1)=var(r2c);
%     title([num2str(theta),'    ',num2str(v/10e8)]);
%      pause
theta
end
% close all
temp=v2(1:30);
v2_old=v2;
subplot(3,3,7);
plot(v2);title('Variance y');
v2(1:30)=v2(31:60);
v2(31:60)=temp;
v=0.5*(v1/max(v1)+v2/max(v2));%%v=0.5*(v1+v2);
subplot(3,3,8)
plot(v);title('Average variance');
subplot(3,3,9);
plot(v1); title('Variance x');
v_div=v;v2_old=v2_old;v1_div=v1;
save abdollahi_div v_div v1_div v2_old ;
n=5;
filt=hamming(n);filt=filt/sum(filt);
vv=conv(v,filt);
subplot(3,3,6);
vv(1:(n-1)/2)=[];vv(end-(n-3)/2:end)=[]; 
plot(vv);title('Highpass-Average variance');
