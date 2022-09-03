function out=utility
Age=[5	4	3	2	1;2	3	5	3	2;4	3	2	2	1;1	2	3	4	5];
HBA1c=[3	5	4	2	1;1	2	5	3	2;1	2	4	4	5;1	2	3	4	5];
FBS=[2	3	5	2	1;1	2	4	5	4;1	2	3	4	5;1	2	4	4	5];
PPBS=[2	3	5	2	1;1	2	4	5	4;1	2	4	4	5;1	2	3	4	5];
Obesity=[5	3	2	1;3	4	5	4;4	4	3	2;2	3	4	5];
slp_hr=[4	3	5	2;1	2	3	4;2	3	4	3;1	2	3	5];
str_lvl=[5	4	2	1;2	3	5	4;4	4	3	2;1	3	4	5];
sen_med=[5	4	3	2	1;2	3	4	4	5;3	4	5	4	3;1	2	3	4	5];
phy_exr=[1	2	3	4	5;4	3	2	1	1;1	1	2	3	5;5	4	3	2	1];

W=[0.0889 0.2 0.1778 0.1111 0.1556 0.0667 0.0444 0.0222 0.1333];

a=[1:5];
b=[1:4];
comb=(combvec(a,a,a,a,b,b,b,a,a))';

for i=1
    temp=[Age(:,comb(i,1)),...
    HBA1c(:,comb(i,2)),...
    FBS(:,comb(i,3)),...
    PPBS(:,comb(i,4)),...
    Obesity(:,comb(i,5)),...
    slp_hr(:,comb(i,6)),...
    str_lvl(:,comb(i,7)),...
    sen_med(:,comb(i,8)),...
    phy_exr(:,comb(i,9))];

U(:,i)=temp*W';
end

% u1=U(1,:);
% u2=U(2,:);
% u3=U(3,:);
% u4=U(4,:);

% max(max(U))
% min(min(U))

a=polyfit([1.0667, 5], [1, 100], 1);

nor_U=a(1)*U+a(2);
out=round(nor_U);
end

