function clippingPlane = makeplane2(C1,z,x1,y1,z1,r,flip)
%This function can be used to make a clipping plane for a slice of a 3D
%image.
%
%   clippingPlane = makeplane2(C1,z,x1,y1,z1,r,flip)
%
%Author: William Colgan
%Date: 6/2/17
%Contact: colgan.william@gmail.com
[x,y] = size(C1);
clippingPlane = double(zeros(x,y));
for i = 1:x
    for j = 1:y
        if flip == 1
            if(i*x1+j*y1+z*z1>r)
                clippingPlane(i,j) = 1;
            end
        else
            if(i*x1+j*y1+z*z1<r)
                clippingPlane(i,j) = 1;
            end
        end
    end
end
end