path = uigetdir('/Users/cionalab/Google Drive/William/Image Analysis');
addpath(path);
types = {'whole','ventral','dorsal'};
[selection,ok] = listdlg('ListString',types);
for i = 1:size(selection,2)
    results = analyze(path,types{selection(i)});
    writetable(struct2table(results),strcat(path,'/',types{selection(i)},' analysis.xls'));
end
clear;