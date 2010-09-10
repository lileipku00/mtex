function x = axisDistribution(odf,h,varargin)
% 
%
%
%% Input
%  odf - @ODF
%  h   - @vector3d
%
%% Flags
%  EVEN       - calculate even portion only
%  FOURIER    - use NFSOFT based algorithm
%
%% Output
%  x   - values of the axis distribution
%
%% See also

% angle discretisation
omega = linspace(-pi,pi,100);

% define a grid for quadrature
h = repmat(h(:),1,length(omega));
omega = repmat(omega,size(h,1),1);
S3G = orientation('axis',h,'angle',omega,odf(1).CS,odf(1).SS);

f = eval(odf,S3G,varargin{:});

x = mean(f,2);
