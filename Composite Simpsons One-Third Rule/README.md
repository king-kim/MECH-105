This algorithm is a MATLAB function file that performs the composite Simpson's 1/3 rule to numerically evaluate the integral of the vector of function values 'y' with respect to the vector of function values 'x'.

_Note: Since the composite Simpson's 1/3 rule only works with an even number of evenly spaced intervals, if there are an odd number of intervals the function implements the trapezoidal rule on the last interval._
## Inputs
* x - vector of experimentally found function values 'x' where 'x' is the independent variable     
  _Note: The values of 'x' must be equally spaced_  
* y - vector of experimentally found function values 'y' where 'y' is the dependent variables
## Output 
* I - integral estimate
## Posible Errors
* Inputted vectors 'x' & 'y' must have the same dimensions, otherwise the function will display an error 
* Vector 'x' must have equally spaced values, otherwise the function will display an error
