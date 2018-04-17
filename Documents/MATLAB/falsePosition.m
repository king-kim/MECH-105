function [ root,fx,ea,iter ] = falsePosition(func,xl,xu,es,maxiter)
% this function finds the roots of an input function using the bisection method
% inputs:
%   func - function being evaluated
%   xl - lower guess
%   xu - upper guess
%   es - the desired relative error (defaults to 0.0001%)
%   maxiter - the number of iterations desired (defaults to 200)
% outputs:
%   root - the estimated root location
%   fx - the function evaluated at the root location
%   ea - the approximate relative error (%)
%   iter - how many iterations were performed

if nargin<3 % checks if there is the minimum number of input variables 
    error('At least 3 input arguments required. See help for description.')
end
if nargin<4||isempty(es) % if an es value is not specified, es is set to the default 0.0001%
    es = 0.0001;
end
if nargin<5||isempty(maxiter)  % if a maxit value is not specified, maxiter is set to the default 200
    maxiter = 200;
end
test1 = func(xl)*func(xu);
if test1 > 0   % checks to make sure there is a sign change within the specified interval
    error('No sign change in interval')
end
% initializes output variables
iter = 0; 
root = xl;
ea = 100;
while ea >= es && iter <= maxiter  % this ends the loop when parameters es or maxiter are satisfied
    oldroot=root; 
    root = xu-((func(xu)*(xl-xu))/(func(xl)-func(xu)));   % estimates the root using the false position formula
    iter = iter+1;    % counts number of loop iterations
    if root ~= 0
        ea = abs((root-oldroot)/root)*100;  % calculates approx relative error (%) for the iteration
    end
test = func(xl)*func(root); 
if test < 0 % if test is negative, there exists a sign change between xl & xr
    xu = root;    % therefore, xl will stay as the lower limit, but xr will become the new upper limit 
elseif test > 0 % if test is positive, there doesn't exist a sign change between xl & xr, meaning the sign change must exist between xr & xu
    xl = root;  % therefore, xu will stay the upper limit, but xr will become the new lower limit
else
    ea = 0; % if test=0, this means there exists a root at xr
end
end   
% displays output variable values
root = double(root)
fx = double(func (root))
ea = double (ea)
iter
end