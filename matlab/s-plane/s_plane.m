% this code written to simulate the value of the transfer function (TF)in
% s-plane as 3D-surface plot. where the value of TF is infinity at the 
% poles coordinates and zero at the zeros coordinates.
clear,clc
close all
syms s unreal           % making (s) as a symbol
a=-10;                  % minimum axis limits (can be edited)
b=10;                   % maximum axis limits (can be edited)
x1=[a:0.2:b];           % real axis
y1=x1*i;                % imaginary axis
[x,y]=meshgrid(x1,y1);  % generating mesh for x and y 
ss=x+y;                 % generate complex plane (s-plane)
n=s+2;                  % numerator of tarnsfer function (can be edited)
d=s.^2+4*s+20;          % denominator of tarnsfer function (can be edited)
nn=subs(n,ss);          % substitute the numerator by ss
dd=subs(d,ss);          % substitute the denominator by ss
f=abs(nn./dd);          % treansfare function

surf(x,y*i,f,'FaceAlpha','interp',...
    'AlphaDataMapping','scaled',...
    'AlphaData',gradient(f),...
    'FaceColor','yellow','EdgeColor','cyan');% generate 3D transparent srface
xlabel('real')
ylabel('imaginary')
axis auto
hold on
xx=[a:b];
yy=xx*0;
plot(xx,yy,'k') %plot x-axis
plot(yy,xx,'k') %plot y-axis

ns=eval(solve(n)); % compute the roots of the numerator as zeros
zeros=ns
ds=eval(solve(d)); % compute the roots of the denominator as poles
poles=ds

r=[ns;ds];
if ~any(imag(r)) % if all poles and zeros are real
    sy=zeros(size(r)); %generate zero matrix with the same size of r
    plot(r,sy,'or','MarkerFaceColor','r')
else
plot(r,'or','MarkerFaceColor','r') % plot imaginary part of roots with respect to real part
end

