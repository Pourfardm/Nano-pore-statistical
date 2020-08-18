close all;
clc;
clear all;
% I=imread('J:\Nano\maghale poorfard\Shingubara\Shingu02-01-45.bmp');
% I=imread('J:\Nano\maghale poorfard\Shingubara\Shingu02-02-20.tif');
% I=imread('J:\Nano\maghale poorfard\Shingubara\Shingu01.tif');
I=imread('D:\MATLAB\Nano codes-Project\statistical nano cod\sem_generator.tif');
I=rgb2gray(I);
h=subplot(2,2,2);
imshow(I); title('Original pics'); xlabel('(b)');
t=get(h,'position');
r1=sum(I,2); % Sum of the rows
subplot(2,2,1);
plot(r1(end:-1:1),1:length(r1)); axis tight; title('Sum y'); xlabel('(a)');

r2=sum(I); % Sum of the columns
hh=subplot(2,2,4);
r=get(hh,'position')
% axis([t(1)+.2 t(2) r(3) r(4)])
plot(r2);axis tight;title('Sum x');xlabel('(c)');



% axes('Position', [.34, .58, .8, .34]);
% imshow(I)

