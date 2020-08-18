clear all;
close all;
clc;
% I=imread('J:\Nano\maghale poorfard\Shingubara\Shingu02-02-20.tif');
I=imread('D:\MATLAB\Nano codes-Project\statistical nano code\Shingubara\Shingu01.tif');
% I=imread('J:\Nano\maghale poorfard\SEM-Arab\2-3-2-.tif');
% I=imread('C:\Users\pourfard\Documents\MATLAB\statistical nano code\sem_generator.tif');
I=rgb2gray(I);
n=31;
filt=hamming(n);filt=filt/sum(filt);
for theta=0:59
    J=imrotate(I,theta); 
    subplot(3,3,2);
    imshow(J);
    r1=sum(J,2);
    r1s=conv(r1,filt);
    r1s(1:(n-1)/2)=[];r1s(end-(n-3)/2:end)=[];
    
    subplot(3,3,1);
%     plot(r1(end:-1:1),1:length(r1));
%     hold on;
%     plot(r1s(end:-1:1),1:length(r1s),'r');
    r1c=r1-r1s;
    v1(theta+1)=var(r1c);
    plot(r1c(end:-1:1),1:length(r1c));axis tight;title('Normalized Sum y');
    
    r2=sum(J);
    r2s=conv(r2,filt);
    r2s(1:(n-1)/2)=[];r2s(end-(n-3)/2:end)=[];
    r2c=r2-r2s;
    subplot(3,3,3);
    plot(r2c);axis tight; title('Normalized Sum x');
    v2(theta+1)=var(r2c);
%     title([num2str(theta)]);%,'    ',num2str(v/10e8)]);
    %      pause;
     theta
end
temp=v2(1:30);
subplot(3,3,4);
plot(v2);axis tight; title('Variance y high-pass filter');
v2(1:30)=v2(31:60);
v2(31:60)=temp;
v=0.5*(v1+v2);
subplot(3,3,6)
plot(v);axis tight; title('Average Variance high-pass filter');
subplot(3,3,5);
plot(v1);axis tight; title('Variance x high-pass filter');
%
% 
% load abdollahi_div;
% v=v_div;v1=v1_div;
% subplot(3,3,7);
% plot(v2_old);title('Variance y length division');axis tight;
% subplot(3,3,8);
% plot(v);title('Variance x length division');axis tight;
% subplot(3,3,9);
% plot(v1); title('Average variance length division');axis tight;


% 