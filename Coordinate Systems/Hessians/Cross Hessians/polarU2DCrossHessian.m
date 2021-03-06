function H=polarU2DCrossHessian(uList,systemType)
%%POLARU2DCROSSHESSIAN Given the direction cosine value u in 2D, obtain the
%              second derivative of the polar azimuth angle with respect to
%              u.
%
%INPUTS: uList A 1XnumPoints (for only u) or a 2XnumPoints (if full unit
%              vectors are given) set of direction cosines in 2D.
%   systemType An optional parameter specifying the axis from which the
%              angles are measured. Possible values are
%              0 (The default if omitted or an empty matrix is passed) The
%                azimuth angle is counterclockwise from the x axis.
%              1 The azimuth angle is measured clockwise from the y axis.
%
%OUTPUTS: H A 1XnumPoints set of second derivatives of the azimuth angle
%           with respect to u evaluated at the given u values.
%
%EXAMPLE:
%Here, we verify that the derivatives returned by this function are about
%equal to those returned via numeric differentiation (forward
%differencing).
% points=[0.1,0.2,-0.2,0,-0.9];%u points
% systemType=0;
% epsVal=1e-9;
% 
% J=polarU2DCrossGrad(points,systemType);
% J1=polarU2DCrossGrad(points+epsVal,systemType);
% HNumDiff=(J1-J)/epsVal;
% H=polarU2DCrossHessian(points,systemType);
% 
% max(abs(HNumDiff-H))
%One will see that the difference is on the order of 5e-7, which is a good
%agreement.
%
%June 2017 David F. Crouse, Naval Research Laboratory, Washington D.C.
%(UNCLASSIFIED) DISTRIBUTION STATEMENT A. Approved for public release.

if(nargin<2||isempty(systemType))
    systemType=0; 
end

hasV=size(uList,1)>1;

N=size(uList,2);

H=zeros(1,N);
for curPoint=1:N
    u=uList(1,curPoint);
    
    if(hasV)
        v=uList(2,curPoint);
    else
        v=sqrt(1-u^2);
    end

    switch(systemType)
        case 0
            H(curPoint)=-u/v^3;
        case 1
            H(curPoint)=u/v^3;
        otherwise
            error('Invalid system type specified.')
    end
end
end

%LICENSE:
%
%The source code is in the public domain and not licensed or under
%copyright. The information and software may be used freely by the public.
%As required by 17 U.S.C. 403, third parties producing copyrighted works
%consisting predominantly of the material produced by U.S. government
%agencies must provide notice with such work(s) identifying the U.S.
%Government material incorporated and stating that such material is not
%subject to copyright protection.
%
%Derived works shall not identify themselves in a manner that implies an
%endorsement by or an affiliation with the Naval Research Laboratory.
%
%RECIPIENT BEARS ALL RISK RELATING TO QUALITY AND PERFORMANCE OF THE
%SOFTWARE AND ANY RELATED MATERIALS, AND AGREES TO INDEMNIFY THE NAVAL
%RESEARCH LABORATORY FOR ALL THIRD-PARTY CLAIMS RESULTING FROM THE ACTIONS
%OF RECIPIENT IN THE USE OF THE SOFTWARE.
