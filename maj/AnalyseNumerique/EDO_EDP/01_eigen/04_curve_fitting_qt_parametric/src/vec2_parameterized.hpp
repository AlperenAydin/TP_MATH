#pragma once

#ifndef VEC2_PARAMETERIZED_HPP
#define VEC2_PARAMETERIZED_HPP

#include "vec2.hpp"

/** vec2 structure with extra time information
    A point is p=((x,y) ; t)
*/
struct vec2_parameterized
{
    vec2 point;
    float time;
};

/** Print a vec2_parameterized */
std::ostream& operator<<(std::ostream& stream,vec2_parameterized const& value);

#endif
