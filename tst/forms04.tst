# Forms, chapter 5
#
# DO NOT EDIT THIS FILE - EDIT EXAMPLES IN THE SOURCE INSTEAD!
#
# This file has been generated by AutoDoc. It contains examples extracted from
# the package documentation. Each example is preceded by a comment which gives
# the name of a GAPDoc XML file and a line range from which the example were
# taken. Note that the XML file in turn may have been generated by AutoDoc
# from some other input.
#
gap> START_TEST( "forms04.tst");

# doc/morphisms.xml:600-620
gap> gf := GF(3);
GF(3)
gap> gram := [
> [0,0,0,1,0,0], 
> [0,0,0,0,1,0],
> [0,0,0,0,0,1],
> [-1,0,0,0,0,0],
> [0,-1,0,0,0,0],
> [0,0,-1,0,0,0]] * One(gf);;
gap> form := BilinearFormByMatrix( gram, gf );
< bilinear form >
gap> b := BaseChangeToCanonical( form );;
gap> Display( b * gram * TransposedMat(b) );
 . 1 . . . .
 2 . . . . .
 . . . 1 . .
 . . 2 . . .
 . . . . . 1
 . . . . 2 .

# doc/morphisms.xml:632-659
gap> gl:=GL(3,3);
GL(3,3)
gap> go:=GO(3,3);
GO(0,3,3)
gap> form := PreservedSesquilinearForms(go)[1]; 
< bilinear form >
gap> gram := GramMatrix( form );  
[ [ 0*Z(3), Z(3), 0*Z(3) ], [ Z(3), 0*Z(3), 0*Z(3) ], 
  [ 0*Z(3), 0*Z(3), Z(3)^0 ] ]
gap> b := BaseChangeToCanonical(form);;
gap> hom := BaseChangeHomomorphism(b, GF(3));
^[ [ 0*Z(3), Z(3)^0, 0*Z(3) ], [ Z(3), Z(3), Z(3)^0 ], 
  [ Z(3)^0, Z(3), 0*Z(3) ] ]
gap> newgo := Image(hom, go); 
Group(
[ 
  [ [ Z(3)^0, Z(3)^0, 0*Z(3) ], [ 0*Z(3), Z(3), 0*Z(3) ], 
      [ Z(3), Z(3)^0, Z(3) ] ], 
  [ [ Z(3)^0, Z(3), 0*Z(3) ], [ Z(3), Z(3), Z(3)^0 ], 
      [ 0*Z(3), Z(3)^0, 0*Z(3) ] ] ])
gap> gens := GeneratorsOfGroup(newgo);;
gap> canonical := b * gram * TransposedMat(b);
[ [ Z(3)^0, 0*Z(3), 0*Z(3) ], [ 0*Z(3), 0*Z(3), Z(3) ], 
  [ 0*Z(3), Z(3), 0*Z(3) ] ]
gap> ForAll(gens, y -> y * canonical * TransposedMat(y) = canonical);
true

# doc/morphisms.xml:673-702
gap> mat := [ [ Z(8) , 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2) ], 
> [ 0*Z(2), Z(2)^0, Z(2^3)^5, 0*Z(2), 0*Z(2) ], 
> [ 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2) ], 
> [ 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0 ], 
> [ 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2), 0*Z(2) ] ];;
gap> form := QuadraticFormByMatrix(mat,GF(8));
< quadratic form >
gap> iso := IsometricCanonicalForm(form);
< parabolic quadratic form >
gap> Display(form);
Parabolic quadratic form
Gram Matrix:
z = Z(8)
 z^1   .   .   .   .
   .   1 z^5   .   .
   .   .   .   .   .
   .   .   .   .   1
   .   .   .   .   .
Witt Index: 2
gap> Display(iso);
Parabolic quadratic form
Gram Matrix:
 1 . . . .
 . . 1 . .
 . . . . .
 . . . . 1
 . . . . .
Witt Index: 2

# doc/morphisms.xml:719-736
gap> gram := [ [ 0*Z(3), Z(3)^0, 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3) ], 
>   [ Z(3)^0, 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3) ], 
>   [ 0*Z(3), 0*Z(3), 0*Z(3), Z(3)^0, 0*Z(3), 0*Z(3) ], 
>   [ 0*Z(3), 0*Z(3), Z(3)^0, 0*Z(3), 0*Z(3), 0*Z(3) ], 
>   [ 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3), Z(3)^0 ], 
>   [ 0*Z(3), 0*Z(3), 0*Z(3), 0*Z(3), Z(3)^0, 0*Z(3) ] ];;
gap> form := BilinearFormByMatrix( gram, GF(3) );
< bilinear form >
gap> m := [ [ Z(3)^0, Z(3)^0, Z(3), 0*Z(3), Z(3)^0, Z(3) ], 
>   [ Z(3), Z(3), Z(3)^0, 0*Z(3), Z(3)^0, Z(3) ], 
>   [ 0*Z(3), Z(3), 0*Z(3), Z(3), 0*Z(3), 0*Z(3) ], 
>   [ 0*Z(3), Z(3), Z(3)^0, Z(3), Z(3), Z(3) ], 
>   [ Z(3)^0, Z(3)^0, Z(3), Z(3), Z(3)^0, Z(3)^0 ], 
>   [ Z(3)^0, 0*Z(3), Z(3), Z(3)^0, Z(3), Z(3) ] ];;
gap> ScalarOfSimilarity( m, form );
Z(3)

# doc/morphisms.xml:749-786
gap> mat := [[0,0,1,0,0],[0,0,0,0,0],[-1,0,0,0,0],[0,0,0,0,0],[0,0,0,0,0]]*Z(7)^0;
[ [ 0*Z(7), 0*Z(7), Z(7)^0, 0*Z(7), 0*Z(7) ], 
  [ 0*Z(7), 0*Z(7), 0*Z(7), 0*Z(7), 0*Z(7) ], 
  [ Z(7)^3, 0*Z(7), 0*Z(7), 0*Z(7), 0*Z(7) ], 
  [ 0*Z(7), 0*Z(7), 0*Z(7), 0*Z(7), 0*Z(7) ], 
  [ 0*Z(7), 0*Z(7), 0*Z(7), 0*Z(7), 0*Z(7) ] ]
gap> form := BilinearFormByMatrix(mat,GF(7));
< bilinear form >
gap> WittIndex(form);
1
gap> RadicalOfForm(form);
<vector space over GF(7), with 3 generators>
gap> Dimension(last);
3
gap> mat := IdentityMat(6,GF(5));
[ [ Z(5)^0, 0*Z(5), 0*Z(5), 0*Z(5), 0*Z(5), 0*Z(5) ], 
  [ 0*Z(5), Z(5)^0, 0*Z(5), 0*Z(5), 0*Z(5), 0*Z(5) ], 
  [ 0*Z(5), 0*Z(5), Z(5)^0, 0*Z(5), 0*Z(5), 0*Z(5) ], 
  [ 0*Z(5), 0*Z(5), 0*Z(5), Z(5)^0, 0*Z(5), 0*Z(5) ], 
  [ 0*Z(5), 0*Z(5), 0*Z(5), 0*Z(5), Z(5)^0, 0*Z(5) ], 
  [ 0*Z(5), 0*Z(5), 0*Z(5), 0*Z(5), 0*Z(5), Z(5)^0 ] ]
gap> form := QuadraticFormByMatrix(mat,GF(5));
< quadratic form >
gap> WittIndex(form);
3
gap> mat := IdentityMat(6,GF(7));
[ [ Z(7)^0, 0*Z(7), 0*Z(7), 0*Z(7), 0*Z(7), 0*Z(7) ], 
  [ 0*Z(7), Z(7)^0, 0*Z(7), 0*Z(7), 0*Z(7), 0*Z(7) ], 
  [ 0*Z(7), 0*Z(7), Z(7)^0, 0*Z(7), 0*Z(7), 0*Z(7) ], 
  [ 0*Z(7), 0*Z(7), 0*Z(7), Z(7)^0, 0*Z(7), 0*Z(7) ], 
  [ 0*Z(7), 0*Z(7), 0*Z(7), 0*Z(7), Z(7)^0, 0*Z(7) ], 
  [ 0*Z(7), 0*Z(7), 0*Z(7), 0*Z(7), 0*Z(7), Z(7)^0 ] ]
gap> form := QuadraticFormByMatrix(mat,GF(7));
< quadratic form >
gap> WittIndex(form);
2

# doc/morphisms.xml:859-917
gap> mat := [[0,0,0,-1],[0,0,3,0],[0,-3,0,0],[1,0,0,0]]*Z(25)^0;
[ [ 0*Z(5), 0*Z(5), 0*Z(5), Z(5)^2 ], [ 0*Z(5), 0*Z(5), Z(5)^3, 0*Z(5) ], 
  [ 0*Z(5), Z(5), 0*Z(5), 0*Z(5) ], [ Z(5)^0, 0*Z(5), 0*Z(5), 0*Z(5) ] ]
gap> form := BilinearFormByMatrix(mat,GF(25));
< bilinear form >
gap> IsDegenerateForm(form);
false
gap> TypeOfForm(form);
0
gap> mat := IdentityMat(3,GF(7));
[ [ Z(7)^0, 0*Z(7), 0*Z(7) ], [ 0*Z(7), Z(7)^0, 0*Z(7) ], 
  [ 0*Z(7), 0*Z(7), Z(7)^0 ] ]
gap> form := QuadraticFormByMatrix(mat,GF(7));
< quadratic form >
gap> IsSingularForm(form);
false
gap> TypeOfForm(form);
0
gap> mat := [[0,1,0,0],[-1,0,0,0],[0,0,0,0],[0,0,0,0]]*Z(5)^0;
[ [ 0*Z(5), Z(5)^0, 0*Z(5), 0*Z(5) ], [ Z(5)^2, 0*Z(5), 0*Z(5), 0*Z(5) ], 
  [ 0*Z(5), 0*Z(5), 0*Z(5), 0*Z(5) ], [ 0*Z(5), 0*Z(5), 0*Z(5), 0*Z(5) ] ]
gap> form := BilinearFormByMatrix(mat,GF(5));
< bilinear form >
gap> IsDegenerateForm(form);
true
gap> TypeOfForm(form);
0
gap> mat := [[1,0,0,0],[0,1,0,0],[0,0,0,1],[0,0,1,0]]*Z(7)^0;
[ [ Z(7)^0, 0*Z(7), 0*Z(7), 0*Z(7) ], [ 0*Z(7), Z(7)^0, 0*Z(7), 0*Z(7) ], 
  [ 0*Z(7), 0*Z(7), 0*Z(7), Z(7)^0 ], [ 0*Z(7), 0*Z(7), Z(7)^0, 0*Z(7) ] ]
gap> form := BilinearFormByMatrix(mat,GF(7));
< bilinear form >
gap> IsDegenerateForm(form);
false
gap> TypeOfForm(form);
-1
gap> mat := IdentityMat(3,GF(9));
[ [ Z(3)^0, 0*Z(3), 0*Z(3) ], [ 0*Z(3), Z(3)^0, 0*Z(3) ], 
  [ 0*Z(3), 0*Z(3), Z(3)^0 ] ]
gap> form := HermitianFormByMatrix(mat,GF(9));
< hermitian form >
gap> IsDegenerateForm(form);
false
gap> TypeOfForm(form);
-1/2
gap> mat := [[0,0,0,1],[0,1,0,0],[0,0,1,0],[1,0,0,0]]*Z(8)^0;
[ [ 0*Z(2), 0*Z(2), 0*Z(2), Z(2)^0 ], [ 0*Z(2), Z(2)^0, 0*Z(2), 0*Z(2) ], 
  [ 0*Z(2), 0*Z(2), Z(2)^0, 0*Z(2) ], [ Z(2)^0, 0*Z(2), 0*Z(2), 0*Z(2) ] ]
gap> form := BilinearFormByMatrix(mat,GF(8));
< bilinear form >
gap> IsDegenerateForm(form);
false
gap> TypeOfForm(form);
Error, <f> is a pseudo form and has no defined type called from
<function "unknown">( <arguments> )
 called from read-eval loop at line 30 of *stdin*
you can 'return;' to continue

#
gap> STOP_TEST("forms04.tst", 1 );