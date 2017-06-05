function C1 = removebackground(C1,cellMask,thresh)
%This function removes the background in a 3D image within the cell.
%
%   C1 = removebackground(C1,cellMask,thresh) 
%
%Author: William Colgan
%Date: 6/5/17
%Contact: colgan.william@gmail.com

C1 = C1.*cellMask;
v = sum(sum(sum(cellMask)));
average = sum(sum(sum(C1)))/v;
C1(C1<average*thresh) = 0;
