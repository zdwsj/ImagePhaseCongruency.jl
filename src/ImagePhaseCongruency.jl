#=----------------------------------------------------------------------------

Image Phase Congruency

Phase based feature detection and image enhancement.

Copyright (c) 2015-2018 Peter Kovesi
peterkovesi.com

MIT License:

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


PK June 2015      Original porting from MATLAB to Julia
   November 2017  Julia 0.6
   October 2018   Julia 0.7/1.0
----------------------------------------------------------------------------=#
"""
**Image Phase Congruency**

Phase based feature detection and image enhancement

Peter Kovesi  

[peterkovesi.com](http://peterkovesi.com)

"""
module ImagePhaseCongruency

include("phasecongruency.jl")  # Orientations to sort out
include("frequencyfilt.jl")  
include("greytrans.jl")   # fillnan - use distance transform
include("syntheticimages.jl")  

include("edgelink.jl")   # Needs testing
include("lut.jl")        # thinning to fix and speedup

# include("misc.jl")      # has a basic interp2 implementation
# include("spatial.jl")   # only nonmaxsup to convert
# include("utilities.jl") # not needed use ImageProjectiveGeometry

end 

#=
To Do:

BenchmarkTools

------

rename greytrans.jl

hythresh:  Check connected components in Images
fillnan:  Check distance transform in Images

nonmaxsup: Convert (though Images has something)
edgelink etc

edgelink.m edge linking function that forms lists of connected edge
points from a binary edge image. Needs findendsjunctions below.

filledgegaps.m Fills small gaps in a binary edge map image. Can be
useful to apply prior to edge linking. Needs findisolatedpixels.m and
findendsjunctions.m

drawedgelist.m plots out a set of edge lists generated by edgelink or
lineseg.

edgelist2image.m transfers edgelist data back into a 2D image array.

lineseg.m forms straight line segments fitted with a specified
tolerance to the lists of connected edge points.

maxlinedev.m is also used by lineseg.m to calculate deviations of the
edge lists from the fitted segments.

cleanedgelist.m cleans up a set of edge lists generated by edgelink or
lineseg so that isolated edges and spurs that are shorter than a
minimum length are removed. There are some issues with this code and
it can be memory intensive.

=#