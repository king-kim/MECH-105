function [L,U,P] = luFactor(A)
% this function implements LU factorization with pivoting for an inputted
% square matrix
% input:
%   A - coefficient matrix
% outputs:
%   L - lower triangular matrix
%   U - upper triangular matrix
%   P - the pivot matrix

if nargin<1||nargin>1 % checks if there is the appropriate number of input variables 
    error('Incorrect number of input variables. See help for description.')
end
[m,n]=size(A); % checks if A is a square matrix
if m~=n
    error ('Matrix A must be a square matrix')
end
format short
L=eye(m,n); % initial L is the identity matrix
P=eye(m,n); % initial P is the identity matrix
U=A; % initial U is the same as A
for k = 1:n-1 
    [maximum,i]=max(abs(U(k:n,k))); % finds max absolute value in column k
    M=i+(k-1);    % M represents the row in which the max absolute value in column k is located
    if M~=k   % checks if pivoting is necessary
        U([k,M],:)=U([M,k],:);  % pivots rows in U 
        P([k,M],:)=P([M,k],:);  % pivots rows in P
    end
    for i = k+1:n
        factor = U(i,k)/U(k,k); % finds the multiplication factor for the forward elimination
        L(i,k)=factor;  % creates lower triangular matrix with the factor values
        U(i,k:n)=(U(i,k:n))-factor.*(U(k,k:n)); % completets forward elimination to create an upper triangular matrix
    end
   L=(P*A)/U;   % creates the pivoted lower triangular matrix
end