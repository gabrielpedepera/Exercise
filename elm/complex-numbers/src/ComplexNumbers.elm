module ComplexNumbers exposing
    ( Complex
    , abs
    , add
    , conjugate
    , div
    , exp
    , fromPair
    , fromReal
    , imaginary
    , mul
    , real
    , sub
    )


type Complex
    = Complex Float Float


fromPair : ( Float, Float ) -> Complex
fromPair ( r, i ) =
    Complex r i


fromReal : Float -> Complex
fromReal r =
    Complex r 0.0


real : Complex -> Float
real (Complex r _) =
    r


imaginary : Complex -> Float
imaginary (Complex _ i) =
    i


conjugate : Complex -> Complex
conjugate (Complex r i) =
    Complex r -i


abs : Complex -> Float
abs (Complex r i) =
    sqrt ((r * r) + (i * i))


add : Complex -> Complex -> Complex
add (Complex r1 i1) (Complex r2 i2) =
    Complex (r1 + r2) (i1 + i2)


sub : Complex -> Complex -> Complex
sub (Complex r1 i1) (Complex r2 i2) =
    Complex (r1 - r2) (i1 - i2)


mul : Complex -> Complex -> Complex
mul (Complex r1 i1) (Complex r2 i2) =
    Complex (r1 * r2 - i1 * i2) (i1 * r2 + r1 * i2)


rec : Complex -> Complex
rec (Complex r i) =
    Complex (r / (r * r + i * i)) -(i / (r * r + i * i))


div : Complex -> Complex -> Complex
div z1 z2 =
    rec z2 |> mul z1


exp : Complex -> Complex
exp (Complex r i) =
    mul (Complex (e ^ r) 0) (Complex (cos i) (sin i))
