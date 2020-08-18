clear all;
close all;
clc;
% I=imread('J:\Nano\maghale poorfard\Shingubara\Shingu02-02-20.tif');
% I=imread('J:\Nano\maghale poorfard\Shingubara\Shingu02-04-315.bmp');
% I=imread('C:\Users\pourfard\Documents\MATLAB\statistical nano code\special pics.jpg');
% I=imread('C:\Users\pourfard\Pictures\specialpics.jpg');
I=imread('C:\Users\pourfard\Documents\MATLAB\statistical nano code\ab3.tif');
% I=imread('J:\Nano\maghale poorfard\SEM-Arab\2-3-2-.tif');
% I=imread('C:\Users\pourfard\Pictures\44105921-ibd_biz_thumb.jpg');
% I=imread('C:\Users\pourfard\Documents\MATLAB\statistical nano code\sem_generator.tif');
I=rgb2gray(I);
n=75;
filt=hamming(n);filt=filt/sum(filt);
for theta=0:60
    J=imrotate(I,theta); 
    subplot(2,3,2);
    imshow(J); title('Original pics');
    xlabel(['Theta= ',num2str(theta)]);
    
    r1=sum(J,2);  % Sum of the rows
    r1s=conv(r1,filt);
    r1s(1:(n-1)/2)=[];r1s(end-(n-3)/2:end)=[]; %Eliminating the extra border of convolution
    subplot(2,3,1);
%     plot(r1(end:-1:1),1:length(r1));
%     hold on;
%     plot(r1s(end:-1:1),1:length(r1s),'r');
    r1c=r1-r1s;
    v1(theta+1)=var(r1c);
    plot(r1c(end:-1:1),1:length(r1c)); axis tight; title('Sum y with hamming filter');
    r2=sum(J);  % Sum of the columns
    r2s=conv(r2,filt);
    r2s(1:(n-1)/2)=[];r2s(end-(n-3)/2:end)=[];
    r2c=r2-r2s;
    subplot(2,3,5);
    plot(r2c); axis tight; title('Sum x with hamming filter');
    v2(theta+1)=var(r2c);
%      pause;
     theta
end


% v2_new=mean(reshape(v2,3,60));


temp=v2(1:30);
subplot(2,3,6);
plot(v2); title('Variance y high-pass filter');axis tight;
v2(1:30)=v2(31:60);
v2(31:60)=temp;
v=0.5*(v1+v2);
subplot(2,3,4)
% plot(v);title('Average variance high-pass filter');axis tight;
subplot(2,3,3);
plot(v1); title('Variance x high-pass filter');axis tight;

n=5;
filt=hamming(n);filt=filt/sum(filt);
vv=conv(v,filt);
subplot(2,3,4);
vv(1:(n-1)/2)=[];vv(end-(n-3)/2:end)=[]; 
plot(vv);title('Average variance high-pass filter');axis tight;

% 