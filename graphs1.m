path = uigetdir('/Users/cionalab/Google Drive/William/Image Analysis');
types = {'whole','ventral','dorsal'};
[selection,ok] = listdlg('ListString',types);
for i = 1:size(selection,2)
    r = analyze(path,types{selection(i)});
    overlap = [mean(r.overlap1),mean(r.overlap2),mean(r.overlap3)];
    enrichment = [mean(r.enrichgreen1)/2,mean(r.enrichgreen2)/2,mean(r.enrichgreen3)/2];
    cellicon1(enrichment,strcat(types{selection(i)},' FGFR enrichment'),'firegb')
    cellicon1(overlap,strcat(types{selection(i)},' Rab Overlap'),'fire')
end
clear;