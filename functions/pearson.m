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
mean1 = sum(sum(sum(I1)))/sum(sum(sum(cellMask)));
mean2 = sum(sum(sum(I2)))/sum(sum(sum(cellMask)));

%get the covariance of the channels

covariance = sum(sum(sum((I1-mean1).*(I2-mean2).*cellMask)));

%get the standard deveation of each channel
sum1 = sum(sum(sum(((I1-mean1).*cellMask).^2)));
sum2 = sum(sum(sum(((I2-mean2).*cellMask).^2)));

%calcluate the pearson correleation coefficient
colocalization = covariance/sqrt(sum1*sum2);

end

