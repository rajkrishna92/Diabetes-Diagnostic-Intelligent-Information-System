clear all
clc;

Data1=[63, 6.8 119 152 24.2, 7, 12, 120, 30];
 Data2=[36 8.9 220 350 20.3 7 22 90 20];
Data3=[55 6.5 132.5 270.6 15.3 5.5 27 210 40];

age1=linspace(1,100,40);
  HBA1c2=linspace(3,10,20);
  FBS3=linspace(30,220,40);
  PPBS4=linspace(30,260,40);
  obesity5=linspace(15,40,30);
  slp_hr6=linspace(3,10,40);
  str_lvl7=linspace(5,25,40);
  sen_med8=linspace(5,200,40);
  phy_exr9=linspace(5,120,40);
  
  
% 
 for i=1:20
     for j=1:30
         Data1(2)=HBA1c2(i);
         Data1(5)=obesity5(j);
         [N(i,j),P(i,j),T1(i,j),T2(i,j)]=Diabates(Data1);
     [~,a(i,j)]=max([N(i,j),P(i,j),T1(i,j),T2(i,j)]);    
     end
 end


 
 
