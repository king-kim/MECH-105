function [I] = Simpson(x,y)
% This function performs The Composite Simpson's 1/3 Rule to numerically
% evaluate the integral of the vector of function values 'y' with respect
% to 'x'.
% If there are an odd number of intervals, it uses the trapezoidal rule for
% the last interval.
% Input variables:
%   x - vector of experimentally found function values 'x' where 'x' is the independent variable
%       **the values of 'x' must be equally spaced**
%   y - vector of experimentally found fuction values 'y' where 'y' is the dependent variable
% Output variable:
%   I - integral estimate

% converts x to be a row vector if inputted as a column vector
if isrow(x) ~= 1 
    x=x';
end
% converts y to be a row vector if inputted as a column vector
if isrow(y) ~= 1
    y=y';
end
if length (x) ~= length (y) % checks that x & y have the same dimensions
    error ('x & y must have the same dimensions')
end
% checks to ensure x is equally spaced
dx=diff(x);
d=eps(dx);
if range(d) ~= 0
    error ('x is not equally spaced')
end
% checks if trapezoidal rule is needed
if mod(length(x),2) == 0
    % odd number of intervals therefore the trapezoid rule is needed
    warning ('The trapezoidal rule had to be used on the last interval')
    % implements trapezoid rule on last interval
    l=length(x);
    I_trap=((x(1,l)-x(1,l-1))/2)*(y(1,l-1)+y(1,l));
    % redefines the x & y vectors to eliminate the last interval
    n=length(x)-2;
    b=max(x(1:l-1));
    a=min(x(1:l-1));
    y=[y(1,1:l-1)];
else
    % even number of intervals therefore no trapezoid rule needed
    n=length(x)-1;
    b=max(x);
    a=min(x);
    I_trap=0;
end
% Composite Simpson's 1/3 Rule Formula
I=((b-a)/(3*n))*(y(1,1)+(4*sum(y(1,2:2:end)))+(2*sum(y(1,3:2:n)))+y(1,n+1));
% Adds composite simpson's 1/3 & trapazoid rule together if trapezoid rule was used
I=I+I_trap;
end

