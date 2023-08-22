%Banda Naveen (22104061) Matlab assignment 1b-plotting theroritical and 
%simulated graphs of ROCs of Pfa vs Pd of diiferent E_db values and varying Threshold;
clc;
clear all;
e_db=-10:5:10;
e=10.^(e_db/10);
n=0.1:0.01:20;%range of threshold
for i=1:length(e)%for loop will untill the range of E values
    a=zeros(length(n),10000);
    b=zeros(length(n),10000);
    for k=1:10000%this is for 10000 iterations of comparision with threshold
        y_samples=normrnd(0,1,[1,5]);%generating gaussian samples for Pfa with mean 0
        x_samples=normrnd(sqrt(e(i)),1,[1,5]);%generating gaussian samples for Pd with mean sqrt(E)
        s1=sum(y_samples)/5;%sufficient_stastic of Pfa
        s=sum(x_samples)/5;%sufficient_stastic of Pd 
        for j=1:length(n)%this is for comparing sufficient_statstic over a range of threshold
            if s1>=n(j)%sufficient_stastic of Pfa comparsion with threshold
                a(j,k)=1;
            end
            if s>=n(j)%sufficient_stastic of Pd comparsion with threshold
                b(j,k)=1;
            end
        end 
    end
    pf1=sum(a,2)/10000;%no of that sufficient_stastic of Pfa true over 10000 iterations
    pd1=sum(b,2)/10000;%no of that sufficient_stastic of Pd true over 10000 iterations
    plot(pf1,pd1)% plotting simulated ROC for each value of E
    grid on;
    hold on;
    x=sqrt(5)*n;
    pf=qfunc(x);%theoritical_Pfa
    y=n-sqrt(e(i));
    z=sqrt(5)*y;
    pd=qfunc(z);%theoritical_Pd
    plot(pf,pd)% plotting theroritical ROC for each value of E
    hold on;
    grid on;
    xlabel('probability of false of alarm(Pfa)')
    ylabel('probability of detection(Pd)')
    title('Theoretical and simulated ROC(Pfa vs Pd) by varying the E and threshold values')
    legend('Theoretical','Simulated')
end

