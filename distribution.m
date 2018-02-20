

path = uigetdir('/Users/cionalab/Google Drive/William/Image Analysis');
types = {'whole','ventral','dorsal'};
[selection,ok] = listdlg('ListString',types);
for i = 1:size(selection,2)
    r = analyze(path,types{selection(i)});
    overlap = [mean(r.overlap1)/.75,mean(r.overlap2)/.75,mean(r.overlap3)/.75];
    enrichment = [mean(r.enrichgreen1)/1.8,mean(r.enrichgreen2)/1.8,mean(r.enrichgreen3)/1.8];
    cellicon1(enrichment,strcat(types{selection(i)},' FGFR enrichment'),'green')
    cellicon1(overlap,strcat(types{selection(i)},' Rab Overlap'),'orange')
end
clear; 