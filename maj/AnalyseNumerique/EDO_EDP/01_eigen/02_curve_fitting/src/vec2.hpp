
#pragma once

#ifndef VEC2_HPP
#define VEC2_HPP

#include <iostream>


/** A 2D vector */
struct vec2
{
    /** x coordinate */
    float x;
    /** y coordinate */
    float y;

    /** Constructor vec (0,0) */
    vec2();
    /** Constructor vec (x,y) */
    vec2(float x_param,float y_param);

};


/** Norm of a vector */
float norm(vec2 const& v);
/** Scalar product */
float dot(vec2 const& v0,vec2 const& v1);

/** Return a vector of same direction with unit length */
vec2 normalize(vec2 const& v);

/** Print the content of a vector on the command line */
std::ostream& operator<<(std::ostream& sout,vec2 const& m);

/** Vectorial sum */
vec2& operator+=(vec2& lhs,vec2 const& rhs);
/** Vectorial difference */
vec2& operator-=(vec2& lhs,vec2 const& rhs);
/** Multiplication by a scalar */
vec2& operator*=(vec2& v,float s);
/** Division by a scalar */
vec2& operator/=(vec2& v,float s);

/** Vectorial sum */
vec2 operator+(vec2 const& v0,vec2 const& v1);
/** Vectorial difference */
vec2 operator-(vec2 const& v0,vec2 const& v1);
/** Multiplication with a scalar */
vec2 operator*(vec2 const& v0,float s);
/** Multiplication with a scalar (left) */
vec2 operator*(float s,vec2 const& v0);
/** Division by a scalar */
vec2 operator/(vec2 const& v0,float s);




#endif
