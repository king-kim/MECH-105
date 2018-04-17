function [x,fx,ea,iter] = goldmin(f,xl,xu,es,maxit)
%goldmin: minimization using golden section search
%can use this function to find maximization by mult func by -1
%inputs:
%   f = function name
%   xl, xu = lower and upper guesses
%   es = desired relative error 9default = 0.0001%)
%   maxit = maximum allowable iterations (default = 50)
%ouputs:
%   x = location of min
%   fx = min function value
%   ea = approximate rel error (%)
%   iter = number of iterations

if nargin < 3
    error ('At least 3 inout arguments required')
end
if nargin < 4|isempty(es)
    es = 0.0001;
end
if nargin < 5|isempty(maxit)
    maxit = 50;
end
phi=(1+sqrt(5))/2;
iter=0;
d=(phi-1)*(xu-xl);
x1=xl+d;
x2=xu-d;
f1=(f(x1));
f2=(f(x2));
while (1)
    xint=xu-xl;
    if f1 < f2
        xopt = x1;
        xl = x2;
        x2 = x1;
        f2 = f1;
        x1 = xl+(phi-1)*(xu-xl);
        f1=f(x1);
    else
        xopt = x2;
        xu = x1;
        x1 = x2;
        f1 = f2;
        x2 = xu-(phi-1)*(xu-xl);
        f2=f(x2);
    end
    iter = iter+1;
    if xopt ~= 0
        ea=(2-phi)*abs(xint/xopt)*100;
    end
    if ea <= es | iter>=maxit
        break
    end
end
x=xopt
fx=f(xopt);
fx=double(fx)
        
        
