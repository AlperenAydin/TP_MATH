
#include "vec2.hpp"

#include <cmath>
#include <cassert>
#include <iostream>




vec2::vec2()
    :x(0.0f),y(0.0f)
{}

vec2::vec2(float const x_param,float const y_param)
    :x(x_param),y(y_param)
{}

vec2& operator+=(vec2& lhs,vec2 const& rhs)
{
    lhs.x+=rhs.x;
    lhs.y+=rhs.y;
    return lhs;
}

vec2& operator-=(vec2& lhs,const vec2& rhs)
{
    lhs.x-=rhs.x;
    lhs.y-=rhs.y;
    return lhs;
}

vec2& operator*=(vec2& v,float const s)
{
    v.x*=s; v.y*=s;
    return v;
}

vec2& operator/=(vec2& v,float const s)
{
    assert(fabs(s)>10e-6);
    v.x/=s; v.y/=s;
    return v;
}

std::ostream& operator<<(std::ostream& sout,vec2 const& v)
{
    sout<<v.x<<","<<v.y;
    return sout;
}

float norm(vec2 const& v)
{
    return std::sqrt(v.x*v.x+v.y*v.y);
}

float dot(vec2 const& v0,vec2 const& v1)
{
    return v0.x*v1.x+v0.y*v1.y;
}

vec2 normalize(vec2 const& v)
{
    vec2 temp=v;
    temp/=norm(v);
    return temp;
}

vec2 operator+(vec2 const& v0,vec2 const& v1)
{
    vec2 temp=v0;
    temp+=v1;
    return temp;
}

vec2 operator-(vec2 const& v0,vec2 const& v1)
{
    vec2 temp=v0;
    temp-=v1;
    return temp;
}

vec2 operator*(vec2 const& v0,float const s)
{
    vec2 temp=v0;
    temp*=s;
    return temp;
}

vec2 operator*(float s,vec2 const& v0)
{
    return v0*s;
}

vec2 operator/(vec2 const& v0,float const s)
{
    vec2 temp=v0;temp/=s;
    return temp;
}


