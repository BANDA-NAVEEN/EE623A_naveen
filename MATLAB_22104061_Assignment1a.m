%Banda Naveen (22104061) Matlab assignment 1a-plotting theroritical and 
%simulated graphs of Pfa vs Edb and Pd vs Edb
clc;
clear all;
close all;
e_db=-30:5:20; %range of Edb
e=10.^(e_db/10); % converting range of Edb into normal E values
%calucalting Theroritical Pfa and Pd using the Q-function
x=sqrt(e)*sqrt(5);
p=x/2;
pf=qfunc(p);%theoritical_Pf =Q(sqrt(5*e)/2)
pd=1-qfunc(p);%theritical_Pd =1-Q(sqrt(5*e)/2)
%Evalution of simulated Pfa and pd
for j=1:length(e)%for loop will untill the range of E values
    n=sqrt(e(j))/2;%Threshold value n=sqrt(E)/2
    a=zeros(1,10000);
    b=zeros(1,10000);
    for i=1:10000%this is for 10000 iterations of comparision with threshold
       y_samples=normrnd(0,1,[1,5]);%generating gaussian samples for Pfa with mean 0
       x_samples=normrnd(sqrt(e(j)),1,[1,5]);%generating gaussian samples for Pd with mean sqrt(E)
       s1=sum(y_samples)/5;%sufficient_stastic of Pfa
       s=sum(x_samples)/5;%sufficient_stastic of Pd 
       if s1>=n%sufficient_stastic of Pfa comparsion with threshold
            a(i)=1;%if true placing 1 in array
       end
       if s>=n%sufficient_stastic of Pd comparsion with threshold
            b(i)=1;%if true placing 1 in array
       end
    end
    a1=sum(a);%no of that sufficient_stastic of Pfa true
    b1=sum(b);%no of that sufficient_stastic of Pd true
    pf1(j)=a1/10000;%pf for each Edb point
    pd1(j)=b1/10000;%pd for each Edb point
end
%Plotting the threotical and simulated plots of Pfa vs Edb and Pd vs Edb
subplot(1,2,1)
plot(e_db,pf,'r')
grid on;
hold on
plot(e_db,pf1,'b')
xlabel('Edb')
ylabel('probability of false of alarm(Pfa)')
title('Theoretical and simulated Pfa vs Edb')
legend('Theoretical','Simulated')
subplot(1,2,2)
plot(e_db,pd,'r')
grid on;
hold on
plot(e_db,pd1,'b')
xlabel('Edb')
ylabel('probability of Detection(Pd)')
title('Theoretical and simulated Pd vs Edb')
legend('Theoretical','Simulated')