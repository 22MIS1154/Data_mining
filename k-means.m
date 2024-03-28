data=table2array(data);
%Claculate the optimised k value using elbow curve
sa=[];
%K=[];
for k=1:20
[idx, c ,sumd]=kmeans(data,k);
sa=[sa sum(sumd)];
%K=[K k];
end
idx=kmeans(data,6);
gscatter(data(:,1),data(:,2),idx);