function [ root,fx,ea,iter ] = bisect(func,xl,xu,es,maxit)
% this function finds the roots of an input function using the bisection method
% inputs:
%   func = name of function
%   xl, xu = lower and upper brackets
%   es = desired relative error (default=0.0001%)
%   maxit = maximum allowable iterations (default=50)
% outputs:
%   root = real root
%   fx = function value at root
%   ea = approx relative error (%)
%   iter = number of iterations performed

if nargin<3 % checks if there is the minimum number of input variables 
    error('At least 3 input arguments required. See help for description.')
end
if nargin<4|isempty(es) % if an es value is not specified, es is set to the default 0.0001%
    es=0.0001;
end
if nargin<5|isempty(maxit)  % if a maxit value is not specified, maxit is set to the default 50
    maxit=50;
end
test = func(xl)*func(xu);
if test>0   % checks to make sure there is a sign change within the specified interval
    error('No sign change in interval')
end
% initializes output variables
iter=0; 
xr=xl;
ea=100;
while (1) 
    xrold=xr; 
    xr=(xl+xu)/2;   % estimates that the root is in the middle of the interval
    iter=iter+1;    % counts number of loop iterations
    if xr ~= 0
        ea=abs((xr-xrold)/xr)*100;  % calculates approx relative error (%) for the iteration
    end
test = func(xl)*func(xr); 
if test < 0 % if test is negative, there exists a sign change between xl & xr
    xu = xr;    % therefore, xl will stay as the lower limit, but xr will become the new upper limit 
elseif test > 0 % if test is positive, there doesn't exist a sign change between xl & xr, meaning the sign change must exist between xr & xu
    xl=xr;  % therefore, xu will stay the upper limit, but xr will become the new lower limit
else
    ea = 0; % if test=0, this means there exists a root at xr
end
if ea <= es | iter >= maxit % this stopps the loop once the approx relative error is less than or equal to the desired relative error or the iterations are greater than or equal to the max allowable iterations
    break
end
end
root=xr;   
fx = func (xr);


