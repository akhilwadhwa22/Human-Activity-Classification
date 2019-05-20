clear all; clc;
close all;
N = 125*60;
index = 0:1:N-1;
f = zeros(N,1);
for i=1:1:N
    if rem(index(i),125)==0
        f(i)=1/60;
    end
end
b = f; a = 1;
[F, om] = freqz(b,a,2^15);

w = zeros(N,1);
w(1:125) = 1/125;
[W, om] = freqz(w,1,2^15);

path_name = 'F:\Academic\Sem 2\Machine Learning\Project\data\a09\p1\s';
data = csvread(strcat(path_name,'30.txt'));
for i=2:1:60
    size(data)
    if i<10
        num = strcat('0',int2str(i));
    else
        num = int2str(i);  
    end
    path = strcat(path_name,num,'.txt');
    data = [data;csvread(path)];
end

d = data(:,10);
N = length(d);
d = d - mean(d);

b = d; a=1;
figure; zplane(b,a);

[D, om] = freqz(b,a,2^15);
figure; plot(om/pi, abs(D));

D_F = D.*F;
figure; plot(om/pi, abs(D_F));

D_F_W = cconv(D.*F,W,2^15);
figure; plot(om/pi, abs(D_F_W));