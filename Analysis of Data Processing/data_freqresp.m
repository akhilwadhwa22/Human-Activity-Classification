close all
path_name = 'F:\Academic\Sem 2\Machine Learning\Project\data\a09\p1\s';
data = csvread(strcat(path_name,'01.txt'));
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
index = 0:1:N-1;

b = d; a=1;
figure; zplane(b,a);

[D, om] = freqz(b,a,2^15);
figure; plot(om/pi, abs(D));

sig = zeros(125,1);
s = zeros(N,1);
for i=1:1:N
    ind = rem(index(i),125)+1;
    sig(ind)= sig(ind) + d(i)/60;
end
for i=1:1:N
    if rem(index(i),125) == 0
        s(i) = sig(index(i)/125+1);
    end
end
figure; plot(index,d); hold on;
plot(index,s);