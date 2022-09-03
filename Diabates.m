function [a,nor,pre,t1,t2,a1,b,c,d]=Diabates(D)

%input-------case1------------------
a=cell([9 1]);

a{1}=Age(D(1));
a{2}=HBA1c(D(2));
a{3}=FBS(D(3));
a{4}=PPBS(D(4));
a{5}=obesity(D(5));
a{6}=sl_hr(D(6));
a{7}=st_level(D(7));
a{8}=se_med(D(8));
a{9}=phy_exr(D(9));
for i=1:length(a)
    [x(i,1) x(i,2)]=max(a{i});
end

W=[0.0889 0.2 0.1778 0.1111 0.1556 0.0667 0.0444 0.0222 0.1333];

M=combvec(a{1},a{2},a{3},a{4},a{5},a{6},a{7},a{8},a{9});
val=(M'*W')';

load('Utility_matrix.mat','U');
%U=utility;
%cond_U=U(:,D);
nor=[U(1,:);val;U(1,:)./max(max(U));min(val,U(1,:)./max(max(U)))];
a1=max(nor(4,:));

pre=[U(2,:);val;U(2,:)./max(max(U));min(val,U(2,:)./max(max(U)))];
b=max(pre(4,:));

t1=[U(3,:);val;U(3,:)./max(max(U));min(val,U(3,:)./max(max(U)))];
c=max(t1(4,:));

t2=[U(4,:);val;U(4,:)./max(max(U));min(val,U(4,:)./max(max(U)))];
d=max(t2(4,:));



%1age function
function a=Age(x)
Y=sigmf(x,[-0.25 18]);
MA=gaussmf(x,[15 32.5]);
A=gaussmf(x,[15 52.5]);
VA=gaussmf(x,[15 72.5]);
O=sigmf(x,[0.25 80]);
a=[Y,MA,A,VA,O];
end



%2HBA1c function
function b=HBA1c(x)
L=sigmf(x,[-1.5 5]);
N=gaussmf(x,[1.5 5.5]);
P=gaussmf(x,[1.5 6.25]);
H=gaussmf(x,[1.5 7.25]);
VH=sigmf(x,[1.5 8]);
b=[L,N,P,H,VH];
end

%3FBS function
function b=FBS(x)
VL=sigmf(x,[-0.1,40]);
L=gaussmf(x,[25,50]);
N=gaussmf(x,[25,85]);
H=gaussmf(x,[35,152.5]);
VH=sigmf(x,[0.1,200]);
b=[VL,L,N,H,VH];
end


%4PPBS function
function c=PPBS(x)
VL=sigmf(x,[-0.1,40]);
L=gaussmf(x,[25,50]);
N=gaussmf(x,[25,102.5]);
H=gaussmf(x,[35,195]);
VH=sigmf(x,[0.1,250]);
c=[VL,L,N,H,VH];
end


%5Obesity function
function c=obesity(x)
N=sigmf(x,[-0.4,25]);
OW=gaussmf(x,[6,27.5]);
OB=gaussmf(x,[6,35]);
E=sigmf(x,[0.4,40]);
c=[N,OW,OB,E];
end
%6sleeping hours 
function d=sl_hr(x)
VL=sigmf(x,[-1.5,4]);
L=gaussmf(x,[1.5,5]);
N=gaussmf(x,[1.5,7]);
H=sigmf(x,[1.5,8]);
d=[VL,L,N,H];
end
%7Stress level 
function d=st_level(x)
L=sigmf(x,[-1,7]);
M=gaussmf(x,[4.5,10]);
A=gaussmf(x,[4.5,17]);
HA=sigmf(x,[1,20]);
d=[L,M,A,HA];
end

%8 Sensivity of medical examination 
function d=se_med(x)
W=sigmf(x,[-0.5,7]);
F=gaussmf(x,[5,11]);
M=gaussmf(x,[5,22.5]);
HY=gaussmf(x,[50,104]);
Y=sigmf(x,[0.1,180]);
d=[W,F,M,HY,Y];
end

%9 physical exercise  
function d=phy_exr(x)
LE=sigmf(x,[-0.4,10]);
SE=gaussmf(x,[9,19]);
VE=gaussmf(x,[9,37.5]);
VVE=gaussmf(x,[9,57.5]);
EE=sigmf(x,[0.4,65]);
d=[LE,SE,VE,VVE,EE];
end

%------------------------------------------------------------------

% function out=OUTPUT(x)
%         Normal=100+(-90/5759990)*(x-10);
%         Brady=trimf(x,[1 2880000 5760000])*100+10;
%         Tachy=10+(90/5759999)*(x-1);
%        out=[Normal Brady Tachy];
% end




%  temp=1;
%   for i=1:9
%      temp=length(a{i})*temp;
%      av=round(a{i},4);
%      non_zero_value{i}=av(av>0);
%      non_zero_ind{i}=find(av);  
%   end
%    
%  tot_str=temp;
%  tot_str_case=prod(cellfun('length',non_zero_ind));
%  non_zero_ind{1}.*(non_zero_value{1}./5)
%  non_zero_value{1}
 
 
 
 
 
 
 
% av=zeros([9 1]);
%  for i=1:9
%        if  (find(a{i})>=1)
%           ind(i)=find(a{i});
%           av(i)=a{i}(ind(i));
%        else
%            ind(i)=1;
%            av(i)=nan;
%        end
%  end
%  
%  av
% len=ones([11 1]);
% temp=1;
% temp1=0;
%     for i=1:10
%         temp=length(a{i})*temp;
%         len(i)=temp;
%         temp1=(ind(i)-1)*(tot_str/len(i))+temp1;
%     end
%     case_str_no=temp1+ind(11);
%     
% U=round(OUTPUT(case_str_no));
% U1=[min(av) U(1)]; 
% U2=[min(av) U(2)];
% U3=[min(av) U(3)];
% 
% UM1=[U(1)/max(U) U(1)];
% UM2=[U(2)/max(U) U(2)];
% UM3=[U(3)/max(U) U(3)];
% 
% UO1=[min(U1(1),UM1(1)),U(1)];
% UO2=[min(U2(1),UM2(1)),U(2)];
% UO3=[min(U3(1),UM3(1)),U(3)];
% 
% X=[UO1(1),UO2(1),UO3(1)];
% Y=["Normal","Brady","Tachy"]
% output=[X;Y]
% 
% 

end
