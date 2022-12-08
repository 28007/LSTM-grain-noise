clear

str = 'C:\Users\Administrator\Desktop\晶粒噪声克服\Adaptive imaging study\Grain noise data';
files = dir(strcat(str, '\*.mat'));

for i =1:size(files)
    file_name = files(i).name;
    datafile = fullfile(str, file_name);
    load(datafile);
    a = exp_data.tx >= exp_data.rx; % 比较tx和rx， true=1
    index = find(a==1); % 提取对应通道的索引编号
    exp_data2 = exp_data;
    exp_data2.time_data = exp_data.time_data(:,index);
    exp_data2.tx = exp_data.tx(index);
    exp_data2.rx = exp_data.rx(index);
    save(strcat('C:\Users\Administrator\Desktop\晶粒噪声克服\Adaptive imaging study\HMC grain noise\',file_name),'exp_data2');
end
