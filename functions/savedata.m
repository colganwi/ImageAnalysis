function savedata(filename,colocalization,vesstats1,vesstats2)
%This funciton save the data to an excel file.
%
%   savedata(filename,colocalization,vestats1,vestats2)
%
%Author: William Colgan
%Date: 4/11/17
%Contact: colgan.william@gmail.com

C = strsplit(filename,'.');
filename = C{1,1};
T = table(colocalization);
% writetable(T,strcat('data/analysis_',filename,'.xls'),'Sheet',1,'Range','A1');
% T = struct2table(vesstats1);
% writetable(T,strcat('data/analysis_',filename,'.xls'),'Sheet',2,'Range','A1');
% T = struct2table(vesstats2);
% writetable(T,strcat('data/analysis_',filename,'.xls'),'Sheet',3,'Range','A1');
end

