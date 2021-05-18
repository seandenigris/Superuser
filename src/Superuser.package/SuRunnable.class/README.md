I represent a unix-like command. 

I have a ==template== with named or indexed variables, which can be filled with ==arguments==. Subclasses must at minimum provide their own template.
!Arguments
!!String Encoding
Superuser provides a bit of magic for safely representing commonly used object types on the command line. For your custom types, define ==#suForCommand==. Here are the built-in usages:
[[[language=smalltalk
#suForCommand gtImplementors
]]]
!!!Meta-Magic
Alternately, and for more (per command object) control, Magritte element descriptions  can be a great place to store the encoder. Just send ${method:MAElementDescription>>#suEncoder:}$