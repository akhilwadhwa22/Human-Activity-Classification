clear all; clc;
close all;
N = 125*60;
index = -(N-1):1:0;
f = zeros(N,1);

for i=1:1:N
    if rem(index(i),125)==0
        f(i)=1/60;
    end
end

figure; stem(index,f);
xlim([-(N+1),1]);
ylim([0,2/60]);

b = f; a = 1;
figure; zplane(b,a);

[F, om] = freqz(b,a,2^15);
figure; plot(om/pi, abs(F));


w = zeros(N,1);
w(1:125) = 1/125;
a = 1;
figure; zplane(w,a);
[W, om] = freqz(w,1,2^15);
figure; plot(om/pi, abs(W));
index = index + N;
figure; plot(index+N,w);