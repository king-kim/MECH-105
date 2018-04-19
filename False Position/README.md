# False Position Function
This algorithm is a MATLAB function file that find the roots of an input function using the false position method
### Inputs
* func - function being evaluated
* xl - lower guess
* xu - upper guess
* es - the desired relative error (default: 0.0001%)
* maxiter - the number of desired iterations (default: 200)
### Outputs
* root - estimated root location
* fx - function evaluated at the root location
* ea - approximate relative error (%)
* iter - number of iterations performed
### Notes
As this is a closed method, the upper and lower guess (inputs: xu & xl) must bracket the root, otherwise the function will display an error.
