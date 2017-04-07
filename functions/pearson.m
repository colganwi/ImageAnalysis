function colocalization = pearson(C1,C2,cellMask)
%This function calculates the pearson correleation coefficient for the
%region in the binary cellMask.
%
%   colocalization = pearson(C1,C2,cellMask)
%
%Author: William Colgan
%Date: 2/14/17
%Contact: colgan.william@gmail.com

%Apply the mask to each channel
I1 = C1.*cellMask;
I2 = C2.*cellMask;

%get the mean for each channel
mean1 = mean(mean(mean(I1)));
mean2 = mean(mean(mean(I2)));

%get the covariance of the channels
covariance = sum(sum(sum((I1-mean1).*(I2-mean2).*cellMask)));

%get the standard deveation of each channel
stdev1 = sqrt(sum(sum(sum(((I1-mean1).^2).*cellMask))));
stdev2 = sqrt(sum(sum(sum(((I2-mean2).^2).*cellMask))));

%calcluate the pearson correleation coefficient
colocalization = covariance/(stdev1*stdev2);

end

