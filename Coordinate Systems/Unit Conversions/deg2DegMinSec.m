function [deg,min,sec]=deg2DegMinSec(deg)
%%DEG2DEGMINSEC Convert angular degrees to a representation in integer
%               degrees, arcminutes, and decimal arcseconds. This can be
%               useful for displaying angular quantities in a user-frieldy
%               manner.
%
%INPUTS: deg A scalar or matrix of angles degrees.
%
%OUTPUTS: deg The integer part of the input deg.
%         min The integer number of arcminutes in deg.
%         sec A decimal number of arcseconds.
%
%If a negative number of degrees is entered, then degrees, arcminutes and
%arcseconds will all come back negative.
%
%There are 60 arcminutes per degree and 60 arcseconds per arcminute.
%
%October 2014 David F. Crouse, Naval Research Laboratory, Washington D.C.
%(UNCLASSIFIED) DISTRIBUTION STATEMENT A. Approved for public release.

    fracPart=deg-fix(deg);%Get rid of integer degrees.
    deg=fix(deg);
    min=fix(fracPart*60);
    fracPart=fracPart-(min/60);%Get rid of integer minutes.
    sec=60*60*fracPart;
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
