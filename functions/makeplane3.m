function clippingPlane = makeplane3(C1,x1,y1,z1,r,flip)
%This function calculates the pearson value intensity of 4 regions,
%
%   colocalization = pearson(C1,C2,cellMask)
%
%Author: William Colgan
%Date: 2/14/17
%Contact: colgan.william@gmail.com
[x,y,z] = size(C1);
clippingPlane = double(zeros(x,y,z));
for i = 1:x
    for j = 1:y
        for k = 1:z
            if flip == 1
                if(i*x1+j*y1+k*z1>r)
                    clippingPlane(i,j,k) = 1;
                end
            else
                if(i*x1+j*y1+k*z1<r)
                    clippingPlane(i,j,k) = 1;
                end
            end
        end
    end
end
end