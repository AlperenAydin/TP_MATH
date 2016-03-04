#pragma once

#ifndef POINT_SET_HPP
#define POINT_SET_HPP

#include <vector>
#include <initializer_list>
#include <ostream>

#include "vec2.hpp"

/** A set of points in 2D */
class point_set
{
public:

    point_set();
    point_set(std::initializer_list<vec2> const& param);

    /** The number of points in the set */
    int size() const;
    /** Add a point */
    void push_back(vec2 const& param);

    /** Get/Set point with syntax point_set[k] */
    vec2& operator[](int index);
    /** Get point with syntax point_set[k] */
    vec2 const& operator[](int index) const;
    /** Get/Set point with syntax point_set(k) */
    vec2& operator()(int index);
    /** Get point with syntax point_set(k) */
    vec2 const& operator()(int index) const;

    /** stl compatible: get first element */
    vec2 const& front() const;
    /** stl compatible: get last element */
    vec2 const& back() const;
    /** stl compatible iterator */
    std::vector<vec2>::const_iterator begin() const;
    /** stl compatible iterator */
    std::vector<vec2>::const_iterator end() const;

private:
    /** Internal data storing all the points */
    std::vector<vec2> data;
};

/** Print a point set */
std::ostream& operator<<(std::ostream& stream,point_set const& value);

#endif
