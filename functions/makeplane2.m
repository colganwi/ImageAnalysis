function clippingPlane = makeplane2(C1,plane,theta,phi,r,flip)
%This function can be used to make a clipping plane for a slice of a 3D
%image.
%
%   clippingPlane = makeplane2(C1,z,x1,y1,z1,r,flip)
%
%Author: William Colgan
%Date: 6/2/17
%Contact: colgan.william@gmail.com

if r==0
    r=0.001;
end

[x,y,z] = size(C1);
clippingPlane = double(ones(x,y));

x1 = r*sin(theta)*cos(phi);
y1 = r*sin(theta)*sin(phi);
z1 = r*cos(theta);

x2 = int16(x/2);
y2 = int16(y/2);
z2 = int16(z/2);
plane = plane - z2 -1;

for i = -x2:x-x2-1
    for j = -y2:y-y2-1
        if flip == 1 && r>0
            if(i*x1+j*y1+plane*z1*4>r*r)
                clippingPlane(i+x2+1,j+y2+1) = 0;
            end
        elseif flip == -1 && r<0
            if(i*x1+j*y1+plane*z1*4>r*r)
                clippingPlane(i+x2+1,j+y2+1) = 0;
            end
        elseif flip == 1 && r<0
            if(i*x1+j*y1+plane*z1*4<r*r)
                clippingPlane(i+x2+1,j+y2+1) = 0;
            end
        else
            if(i*x1+j*y1+plane*z1*4<r*r)
                clippingPlane(i+x2+1,j+y2+1) = 0;
            end
        end
    end
end
end