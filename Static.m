clear all;
clc;
step=1;
step2=20;
D0=[300.0,500.0,800.0,1000.0,1500.0,2000.0,2500.0,3000.0,3500.0,4000.0,5000.0,6000.0,6500.0,7000.0,7500.0,8000.0];
for i=1:16
    X1(i)=vpa(pi*((D0(i)/2)^2)-pi*(((D0(i)-40)/2)^2),6);
end
X=double(X1);
MD=7.82e-6;    %密度
NODE1X=0;NODE1Y=0;NODE2X=0;NODE2Y=20000;
NODE3X=0;NODE3Y=40000;NODE4X=0;NODE4Y=60000;
NODE5X=12000;NODE5Y=60000;NODE6X=12000;NODE6Y=40000;
NODE7X=12000;NODE7Y=20000;NODE8X=12000;NODE8Y=0;
NODE9X=6000;NODE9Y0=50000;NODE10X=6000;NODE10Y0=30000;
NODE11X=6000;NODE11Y0=10000;
L1=20000;   L2=20000;   L3=20000;   L4=12000;
L5=20000;   L6=20000;   L7=20000;
L8=((NODE9X-NODE4X)^2+(NODE9Y0-NODE4Y)^2)^(1/2);
L9=((NODE9X-NODE5X)^2+(NODE9Y0-NODE5Y)^2)^(1/2);           
L10=((NODE9X-NODE3X)^2+(NODE9Y0-NODE3Y)^2)^(1/2);
L11=((NODE9X-NODE6X)^2+(NODE9Y0-NODE6Y)^2)^(1/2);          
L12=12000;
L13=((NODE10X-NODE3X)^2+(NODE10Y0-NODE3Y)^2)^(1/2);        
L14=((NODE10X-NODE6X)^2+(NODE10Y0-NODE6Y)^2)^(1/2);
L15=((NODE10X-NODE2X)^2+(NODE10Y0-NODE2Y)^2)^(1/2);        
L16=((NODE10X-NODE7X)^2+(NODE10Y0-NODE7Y)^2)^(1/2);
L17=12000;                                                  
L18=((NODE11X-NODE2X)^2+(NODE11Y0-NODE2Y)^2)^(1/2);
L19=((NODE11X-NODE7X)^2+(NODE11Y0-NODE7Y)^2)^(1/2);        
L20=((NODE11X-NODE1X)^2+(NODE11Y0-NODE1Y)^2)^(1/2);
L21=((NODE11X-NODE8X)^2+(NODE11Y0-NODE8Y)^2)^(1/2);        
L22=((NODE7X-NODE4X)^2+(NODE7Y-NODE4Y)^2)^(1/2);
L23=((NODE2X-NODE5X)^2+(NODE2Y-NODE5Y)^2)^(1/2);           
L24=((NODE8X-NODE3X)^2+(NODE8Y-NODE3Y)^2)^(1/2);
L25=((NODE1X-NODE6X)^2+(NODE1Y-NODE6Y)^2)^(1/2);           L26=(12000^2+60000^2)^(1/2);
L27=(12000^2+60000^2)^(1/2);

x0=[X(10),X(8),X(6),X(6),X(6),X(8),X(10),X(6),X(6),X(6),X(6),X(6),X(6),X(6),X(6),X(6),X(6),X(6),X(6),X(6),X(6),X(4),X(4),X(4),X(4),X(4),X(4)];     %初始生长点
Fx0=(x0(1)*L1+x0(2)*L2+x0(3)*L3+x0(4)*L4+x0(5)*L5+x0(6)*L6+x0(7)*L7+x0(8)*L8+x0(9)*L9+x0(10)*L10+x0(11)*L11+x0(12)*L12+x0(13)*L13+x0(14)*L14+...
x0(15)*L15+x0(16)*L16+x0(17)*L17+x0(18)*L18+x0(19)*L19+x0(20)*L20+x0(21)*L21+x0(22)*L22+x0(23)*L23+x0(24)*L24+x0(25)*L25+x0(26)*L26+x0(27)*L27)*MD;  %初始生长点函数值
lh=0;             %%计算后Sm的长度
Sm={};           %%放集合的参数
overtime=1;
Fmin=0;          %%最小值
Xmin=[];         %%最小值对应坐标
iii=1;
while overtime>0
    NODE1X=0;NODE1Y=0;NODE2X=0;NODE2Y=20000;
    NODE3X=0;NODE3Y=40000;NODE4X=0;NODE4Y=60000;
    NODE5X=12000;NODE5Y=60000;NODE6X=12000;NODE6Y=40000;
    NODE7X=12000;NODE7Y=20000;NODE8X=12000;NODE8Y=0;
    NODE9X=6000;NODE9Y=NODE9Y0;NODE10X=6000;NODE10Y=NODE10Y0;
    NODE11X=6000;NODE11Y=NODE11Y0;
    L1=20000;   L2=20000;   L3=20000;   L4=12000;
    L5=20000;   L6=20000;   L7=20000;
    L8=((NODE9X-NODE4X)^2+(NODE9Y-NODE4Y)^2)^(1/2);
L9=((NODE9X-NODE5X)^2+(NODE9Y-NODE5Y)^2)^(1/2);           
L10=((NODE9X-NODE3X)^2+(NODE9Y-NODE3Y)^2)^(1/2);
L11=((NODE9X-NODE6X)^2+(NODE9Y-NODE6Y)^2)^(1/2);          
L12=12000;
L13=((NODE10X-NODE3X)^2+(NODE10Y-NODE3Y)^2)^(1/2);        
L14=((NODE10X-NODE6X)^2+(NODE10Y-NODE6Y)^2)^(1/2);
L15=((NODE10X-NODE2X)^2+(NODE10Y-NODE2Y)^2)^(1/2);        
L16=((NODE10X-NODE7X)^2+(NODE10Y-NODE7Y)^2)^(1/2);
L17=12000;                                                  
L18=((NODE11X-NODE2X)^2+(NODE11Y-NODE2Y)^2)^(1/2);
L19=((NODE11X-NODE7X)^2+(NODE11Y-NODE7Y)^2)^(1/2);        
L20=((NODE11X-NODE1X)^2+(NODE11Y-NODE1Y)^2)^(1/2);
L21=((NODE11X-NODE8X)^2+(NODE11Y-NODE8Y)^2)^(1/2);        
L22=((NODE7X-NODE4X)^2+(NODE7Y-NODE4Y)^2)^(1/2);
L23=((NODE2X-NODE5X)^2+(NODE2Y-NODE5Y)^2)^(1/2);          
L24=((NODE8X-NODE3X)^2+(NODE8Y-NODE3Y)^2)^(1/2);
    L25=((NODE1X-NODE6X)^2+(NODE1Y-NODE6Y)^2)^(1/2);          L26=(12000^2+60000^2)^(1/2);
    L27=(12000^2+60000^2)^(1/2);
    Fx0=(x0(1)*L1+x0(2)*L2+x0(3)*L3+x0(4)*L4+x0(5)*L5+x0(6)*L6+x0(7)*L7+x0(8)*L8+x0(9)*L9+x0(10)*L10+x0(11)*L11+x0(12)*L12+x0(13)*L13+x0(14)*L14+...
x0(15)*L15+x0(16)*L16+x0(17)*L17+x0(18)*L18+x0(19)*L19+x0(20)*L20+x0(21)*L21+x0(22)*L22+x0(23)*L23+x0(24)*L24+x0(25)*L25+x0(26)*L26+x0(27)*L27)*MD;  %初始生长点函数值
    WZ=[];
    for i=1:16
        for j=1:27
            if x0(j)==X(i)
                WZ(j)=i;
            end
        end
    end
    if NODE9Y0>50000&&NODE9Y0<60000
        NODE9y=[NODE9Y0+step2,NODE9Y0-step2];
    elseif NODE9Y0==50000
        NODE9y=[NODE9Y0+step2];
    else
        NODE9y=NODE9Y0;
    end
    if NODE10Y0>30000&&NODE10Y0<40000
        NODE10y=[NODE10Y0+step2,NODE10Y0-step2];
    elseif NODE10Y0==30000
        NODE10y=[NODE10Y0+step2];
    else
        NODE10y=NODE10Y0;
    end
    if NODE11Y0>10000&&NODE11Y0<20000
        NODE11y=[NODE11Y0+step2,NODE11Y0-step2];
    elseif NODE11Y0==10000
        NODE11y=[NODE11Y0+step2];
    else
        NODE11y=NODE11Y0;
    end
    ind=fullfact([length(NODE9y) length(NODE10y) length(NODE11y)]);
    NODE1=[reshape(NODE9y(ind(:,1)),[],1) reshape(NODE10y(ind(:,2)),[],1) reshape(NODE11y(ind(:,3)),[],1)];
    S={};
    lt=length(WZ);
    for i=1:27
        if WZ(i)==1
            x0(i)=X(WZ(i));
            S{1,i}=x0;
            x0(i)=X(WZ(i));
        else
            x0(i)=X(WZ(i)-step);
            S{1,i}=x0;
            x0(i)=X(WZ(i));
        end
    end
    S(cellfun(@isempty,S))=[];
    SN=[];
    CD=length(S);
    CD1=size(NODE1,1);
    for j=1:CD1
        for i=1:CD
            SN{i+j*27}=[S{1,i},NODE1(j,:)];
        end
    end
    SN(cellfun(@isempty,SN))=[];
    pF=[];
    LSN=length(SN);
    for i=1:LSN
        NODE1X=0;NODE1Y=0;NODE2X=0;NODE2Y=20000;
        NODE3X=0;NODE3Y=40000;NODE4X=0;NODE4Y=60000;
        NODE5X=12000;NODE5Y=60000;NODE6X=12000;NODE6Y=40000;
        NODE7X=12000;NODE7Y=20000;NODE8X=12000;NODE8Y=0;
        NODE9X=6000;NODE9Y=SN{1,i}(1,28);NODE10X=6000;NODE10Y=SN{1,i}(1,29);
        NODE11X=6000;NODE11Y=SN{1,i}(1,30);
        L1=20000;   L2=20000;   L3=20000;   L4=12000;
        L5=20000;   L6=20000;   L7=20000;
        L8=((NODE9X-NODE4X)^2+(NODE9Y-NODE4Y)^2)^(1/2);
        L9=((NODE9X-NODE5X)^2+(NODE9Y-NODE5Y)^2)^(1/2);
        L10=((NODE9X-NODE3X)^2+(NODE9Y-NODE3Y)^2)^(1/2);
        L11=((NODE9X-NODE6X)^2+(NODE9Y-NODE6Y)^2)^(1/2);          
L12=12000;
        L13=((NODE10X-NODE3X)^2+(NODE10Y-NODE3Y)^2)^(1/2); 
L14=((NODE10X-NODE6X)^2+(NODE10Y-NODE6Y)^2)^(1/2);
        L15=((NODE10X-NODE2X)^2+(NODE10Y-NODE2Y)^2)^(1/2);
        L16=((NODE10X-NODE7X)^2+(NODE10Y-NODE7Y)^2)^(1/2);
        L17=12000;                                          
        L18=((NODE11X-NODE2X)^2+(NODE11Y-NODE2Y)^2)^(1/2);
        L19=((NODE11X-NODE7X)^2+(NODE11Y-NODE7Y)^2)^(1/2);
        L20=((NODE11X-NODE1X)^2+(NODE11Y-NODE1Y)^2)^(1/2);
        L21=((NODE11X-NODE8X)^2+(NODE11Y-NODE8Y)^2)^(1/2);
        L22=((NODE7X-NODE4X)^2+(NODE7Y-NODE4Y)^2)^(1/2);
        L23=((NODE2X-NODE5X)^2+(NODE2Y-NODE5Y)^2)^(1/2);
        L24=((NODE8X-NODE3X)^2+(NODE8Y-NODE3Y)^2)^(1/2);
        L25=((NODE1X-NODE6X)^2+(NODE1Y-NODE6Y)^2)^(1/2);          L26=(12000^2+60000^2)^(1/2);
        L27=(12000^2+60000^2)^(1/2);
pF(i)=(SN{1,i}(1,1)*L1+SN{1,i}(1,2)*L2+SN{1,i}(1,3)*L3+SN{1,i}(1,4)*L4+SN{1,i}(1,5)*L5+SN{1,i}(1,6)*L6+SN{1,i}(1,7)*L7+SN{1,i}(1,8)*L8+SN{1,i}(1,9)*L9+SN{1,i}(1,10)*L10+SN{1,i}(1,11)*L11+SN{1,i}(1,12)*L12+...
+SN{1,i}(1,13)*L13+SN{1,i}(1,14)*L14+SN{1,i}(1,15)*L15+SN{1,i}(1,16)*L16+SN{1,i}(1,17)*L17+SN{1,i}(1,18)*L18+SN{1,i}(1,19)*L19+SN{1,i}(1,20)*L20+SN{1,i}(1,21)*L21+SN{1,i}(1,22)*L22+SN{1,i}(1,23)*L23+...
+SN{1,i}(1,24)*L24+SN{1,i}(1,25)*L25+SN{1,i}(1,26)*L26+SN{1,i}(1,27)*L27)*MD;
        if pF(i)>=Fx0
            SN{1,i}=[];       
        end
    end
       SN(cellfun(@isempty,SN))=[];
       if iii>1
        Sm{jj}=[];                      %把l位置上的数设为空集，之后在删除空集q
        Sm(cellfun(@isempty,Sm))=[];     %取非空集合
    end
CS=length(SN);
for i=1:CS
xa=[SN{1,i}(1,1),SN{1,i}(1,2),SN{1,i}(1,3),SN{1,i}(1,4),SN{1,i}(1,5),SN{1,i}(1,6),SN{1,i}(1,7),SN{1,i}(1,8),SN{1,i}(1,9),SN{1,i}(1,10),SN{1,i}(1,11),SN{1,i}(1,12),SN{1,i}(1,13),SN{1,i}(1,14),SN{1,i}(1,15),SN{1,i}(1,16),SN{1,i}(1,17),SN{1,i}(1,18),SN{1,i}(1,19),SN{1,i}(1,20),SN{1,i}(1,21),SN{1,i}(1,22),SN{1,i}(1,23),SN{1,i}(1,24),SN{1,i}(1,25),SN{1,i}(1,26),SN{1,i}(1,27)];
abab=(xa+400*pi)/(20*pi);
XA(i,:)=abab;
XAN(i,:)=[SN{1,i}(1,28),SN{1,i}(1,29),SN{1,i}(1,30)];
end    
fid=fopen('E:\ pipe\static\27\0503\size1.txt','w+');      %%读取MTOA文件
fprintf(fid,'%d\n',CS);                            %%将变量xa写入MTOA文件
fclose(fid);     fprintf(fid,'n',XA);
dlmwrite('E:\pipe\static\27\0503\MTOA.txt',XA,'delimiter',' ','precision', '%7.1f')      %%将变量xa写入MTOA文件
dlmwrite('E:\ pipe\static\27\0503\MA.txt',XAN,'delimiter',' ','precision', '%0.2f')
:\"ProgramFiles"\"ANSYSInc"\v211\ansys\bin\winx64\MAPDL.exe 
E:\pipe\static\27\0503\dataread.mac 
E:\ pipe\static\27\0503\output1.out
Q_output=[];
Q_output=importdata('E:\myself\research\huolinlin\MandA\AREAandNODE\2022\pipe\static\27\0503\weiyi.txt');
S_output=importdata('E:\myself\research\huolinlin\MandA\AREAandNODE\2022\pipe\static\27\0503\stress.txt');
for i=1:CS
  for po=1:22
     if abs( Q_output(i,po))>50.000001  %%%%判断结点位移是否满足约束条件(abs取绝对值)
       SN{i}=[];                    %%%将不满足约束条件的生长点剔除
      end
   end
end
for i=1:CS
  if abs(S_output(i,1))>=1000          %%%%判断单元应力是否满足约束条件
    SN{i}=[];                      %%%将不满足约束条件的生长点剔除
  end
end
SN(cellfun(@isempty,SN))=[];
LALALA=length(SN);
Sm=[Sm,SN];
Sm(cellfun(@isempty,Sm))=[];
lp=length(Sm);
F8=[];
for k=1:lp                           % l就是最大值是多少
    NODE1X=0;NODE1Y=0;NODE2X=0;NODE2Y=20000;
    NODE3X=0;NODE3Y=40000;NODE4X=0;NODE4Y=60000;
    NODE5X=12000;NODE5Y=60000;NODE6X=12000;NODE6Y=40000;
    NODE7X=12000;NODE7Y=20000;NODE8X=12000;NODE8Y=0;
    NODE9X=6000;NODE9Y=Sm{1,k}(1,28);NODE10X=6000;NODE10Y=Sm{1,k}(1,29);
    NODE11X=6000;NODE11Y=Sm{1,k}(1,30);
    L1=20000;   L2=20000;   L3=20000;   L4=12000;
    L5=20000;   L6=20000;   L7=20000;
    L8=((NODE9X-NODE4X)^2+(NODE9Y-NODE4Y)^2)^(1/2);
L9=((NODE9X-NODE5X)^2+(NODE9Y-NODE5Y)^2)^(1/2);           
L10=((NODE9X-NODE3X)^2+(NODE9Y-NODE3Y)^2)^(1/2);
L11=((NODE9X-NODE6X)^2+(NODE9Y-NODE6Y)^2)^(1/2);          
L12=12000;
L13=((NODE10X-NODE3X)^2+(NODE10Y-NODE3Y)^2)^(1/2);        
L14=((NODE10X-NODE6X)^2+(NODE10Y-NODE6Y)^2)^(1/2);
L15=((NODE10X-NODE2X)^2+(NODE10Y-NODE2Y)^2)^(1/2);        
L16=((NODE10X-NODE7X)^2+(NODE10Y-NODE7Y)^2)^(1/2);
L17=12000;                                                  
L18=((NODE11X-NODE2X)^2+(NODE11Y-NODE2Y)^2)^(1/2);
    L19=((NODE11X-NODE7X)^2+(NODE11Y-NODE7Y)^2)^(1/2);        
L20=((NODE11X-NODE1X)^2+(NODE11Y-NODE1Y)^2)^(1/2);
L21=((NODE11X-NODE8X)^2+(NODE11Y-NODE8Y)^2)^(1/2);        
L22=((NODE7X-NODE4X)^2+(NODE7Y-NODE4Y)^2)^(1/2);
L23=((NODE2X-NODE5X)^2+(NODE2Y-NODE5Y)^2)^(1/2);          
L24=((NODE8X-NODE3X)^2+(NODE8Y-NODE3Y)^2)^(1/2);
    L25=((NODE1X-NODE6X)^2+(NODE1Y-NODE6Y)^2)^(1/2);          L26=(12000^2+60000^2)^(1/2);
    L27=(12000^2+60000^2)^(1/2);
F8(k)=(Sm{1,k}(1,1)*L1+Sm{1,k}(1,2)*L2+Sm{1,k}(1,3)*L3+Sm{1,k}(1,4)*L4+Sm{1,k}(1,5)*L5+Sm{1,k}(1,6)*L6+Sm{1,k}(1,7)*L7+Sm{1,k}(1,8)*L8+Sm{1,k}(1,9)*L9+Sm{1,k}(1,10)*L10+Sm{1,k}(1,11)*L11+Sm{1,k}(1,12)*L12+...
+Sm{1,k}(1,13)*L13+Sm{1,k}(1,14)*L14+Sm{1,k}(1,15)*L15+Sm{1,k}(1,16)*L16+Sm{1,k}(1,17)*L17+Sm{1,k}(1,18)*L18+Sm{1,k}(1,19)*L19+Sm{1,k}(1,20)*L20+Sm{1,k}(1,21)*L21+Sm{1,k}(1,22)*L22+Sm{1,k}(1,23)*L23+...
+Sm{1,k}(1,24)*L24+Sm{1,k}(1,25)*L25+Sm{1,k}(1,26)*L26+Sm{1,k}(1,27)*L27)*MD;
end
for j=1:lp
   if F8(j)>Fx0
        Sm{j}=[];          
   end
end
Sm(cellfun(@isempty,Sm))=[];    %取非空集合
if(isempty(Sm)==1)             %判断是否为空集合
  break;
else
  l=length(Sm);
  FF=[];
  for ij=1:l
    NODE1X=0;NODE1Y=0;NODE2X=0;NODE2Y=20000;
    NODE3X=0;NODE3Y=40000;NODE4X=0;NODE4Y=60000;
    NODE5X=12000;NODE5Y=60000;NODE6X=12000;NODE6Y=40000;
    NODE7X=12000;NODE7Y=20000;NODE8X=12000;NODE8Y=0;
NODE9X=6000;NODE9Y=Sm{1,ij}(1,28);NODE10X=6000;NODE10Y=Sm{1,ij}(1,29);
    NODE11X=6000;NODE11Y=Sm{1,ij}(1,30);
    L1=20000;   L2=20000;   L3=20000;   L4=12000;
    L5=20000;   L6=20000;   L7=20000;
    L8=((NODE9X-NODE4X)^2+(NODE9Y-NODE4Y)^2)^(1/2);
L9=((NODE9X-NODE5X)^2+(NODE9Y-NODE5Y)^2)^(1/2);           
L10=((NODE9X-NODE3X)^2+(NODE9Y-NODE3Y)^2)^(1/2);
L11=((NODE9X-NODE6X)^2+(NODE9Y-NODE6Y)^2)^(1/2);          
L12=12000;
L13=((NODE10X-NODE3X)^2+(NODE10Y-NODE3Y)^2)^(1/2);        
L14=((NODE10X-NODE6X)^2+(NODE10Y-NODE6Y)^2)^(1/2);
L15=((NODE10X-NODE2X)^2+(NODE10Y-NODE2Y)^2)^(1/2);        
L16=((NODE10X-NODE7X)^2+(NODE10Y-NODE7Y)^2)^(1/2);
L17=12000;                                                  
L18=((NODE11X-NODE2X)^2+(NODE11Y-NODE2Y)^2)^(1/2);
L19=((NODE11X-NODE7X)^2+(NODE11Y-NODE7Y)^2)^(1/2);        
L20=((NODE11X-NODE1X)^2+(NODE11Y-NODE1Y)^2)^(1/2);
L21=((NODE11X-NODE8X)^2+(NODE11Y-NODE8Y)^2)^(1/2);        
L22=((NODE7X-NODE4X)^2+(NODE7Y-NODE4Y)^2)^(1/2);
L23=((NODE2X-NODE5X)^2+(NODE2Y-NODE5Y)^2)^(1/2);          
L24=((NODE8X-NODE3X)^2+(NODE8Y-NODE3Y)^2)^(1/2);
    L25=((NODE1X-NODE6X)^2+(NODE1Y-NODE6Y)^2)^(1/2);          L26=(12000^2+60000^2)^(1/2);
    L27=(12000^2+60000^2)^(1/2);
FF(ij)=(Sm{1,ij}(1,1)*L1+Sm{1,ij}(1,2)*L2+Sm{1,ij}(1,3)*L3+Sm{1,ij}(1,4)*L4+Sm{1,ij}(1,5)*L5+Sm{1,ij}(1,6)*L6+Sm{1,ij}(1,7)*L7+Sm{1,ij}(1,8)*L8+Sm{1,ij}(1,9)*L9+Sm{1,ij}(1,10)*L10+Sm{1,ij}(1,11)*L11+Sm{1,ij}(1,12)*L12+...
+Sm{1,ij}(1,13)*L13+Sm{1,ij}(1,14)*L14+Sm{1,ij}(1,15)*L15+Sm{1,ij}(1,16)*L16+Sm{1,ij}(1,17)*L17+Sm{1,ij}(1,18)*L18+Sm{1,ij}(1,19)*L19+Sm{1,ij}(1,20)*L20+Sm{1,ij}(1,21)*L21+Sm{1,ij}(1,22)*L22+Sm{1,ij}(1,23)*L23+...
+Sm{1,ij}(1,24)*L24+Sm{1,ij}(1,25)*L25+Sm{1,ij}(1,26)*L26+Sm{1,ij}(1,27)*L27)*MD;
end
[value,position]=min(FF);           %获取Fsum数组中最小值的数值和位置
Fmin=value;                      %%最小值
Xmin=Sm{position};               %%最小值对应截面组合
xixi=(Xmin+400*pi)/(20*pi)
plot(iii,Fmin,'*');
hold on;
[FF,id]=sort(FF);
Sm=Sm(id);
if l>=500
   for il=501:l
      Sm{il}=[];                 %取前200个生长点
   end
end
Sm(cellfun(@isempty,Sm))=[];
lSm=length(Sm);
Pm=[];
pm=0;
for ii=1:lSm                 %%%计算分子分母
pj=Fx0-FF(ii);             %%分子
for kk=1:lSm
pm=pm+Fx0-FF(kk);   
end
Pm(ii)=pj/pm;
        pm=0;
end
tr=rand(1,1)*1;                  %随机生成一个0-1之间的数
sum=0;
for jj=1:lSm
   sum=sum+Pm(jj);
   if tr<=sum
     xn0=Sm{jj};
   break;
   end
x0=xn0(:,1:27);
NODE9Y0=xn0(1,28);
NODE10Y0=xn0(1,29);
NODE11Y0=xn0(1,30);
lh=length(Sm);
end
overtime=lh;
iii=iii+1;
end
Fmin;
Xmin;
FZ=[Xmin(1,1)*L1+Xmin(1,2)*L2+Xmin(1,3)*L3+Xmin(1,5)*L5+Xmin(1,6)*L6+Xmin(1,7)*L7]*MD*2+Xmin(1,5)*L5*MD*4+[Xmin(1,8)*L8+Xmin(1,9)*L9+Xmin(1,10)*L10+Xmin(1,11)*L11+Xmin(1,12)*L12+Xmin(1,13)*L13+Xmin(1,14)*L14+Xmin(1,15)*L15+Xmin(1,16)*L16+Xmin(1,17)*L17+Xmin(1,18)*L18+Xmin(1,19)*L19+Xmin(1,20)*L20+Xmin(1,21)*L21]*MD*4
xixi; 