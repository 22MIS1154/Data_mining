data = table2array(data);
sa = [];
K = [];
for k = 1:20
    [idx, c, sumd] = kmedoids(data, k);
    sa = [sa sum(sumd)];
    K = [K k];
end

[idx, c, sumd] = kmedoids(data, 5);
gscatter(data(:,1), data(:,2), idx);