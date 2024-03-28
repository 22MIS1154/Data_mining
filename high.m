%Step 1--Import Dataset

%Step 2--Take only the AnnualIncome & Spedingscore columns(4 & 5)
data=data(:,2:3);
%Step 3--Perform Data Preprocessing
%Checking null value is present or not
sum(ismissing(data))
%Standardization
data.x=(data.x-mean(data.x))/std(data.x);
data.y=(data.y-mean(data.y))/std(data.y);
%Convert the data from table to array 
data=table2array(data);
treefigure1=linkage(data,'ward');
g=unique(treefigure1(:,3));
m=sort(g);
mk=(m>=1);
m=m(mk);
figure;
pause(5);
for i=1:length(m)
subplot(1,2,1);
H=dendrogram(treefigure1,'ColorThreshold',m(i));
set(H,'LineWidth',3)
c=cluster(treefigure1,'cutoff',m(i),'Criterion','distance');
subplot(1,2,2);
gscatter(data(:,1),data(:,2),c);
if(i==1)
pause(1);
else
    pause(0.6);
end
if(i~=length(m))
clf
end
end