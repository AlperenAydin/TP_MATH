#pragma once

#ifndef POINT_SET_HPP
#define POINT_SET_HPP


#include "vec2_parameterized.hpp"

#include <vector>
#include <initializer_list>
#include <ostream>


/** A set of parameterized points in 2D */
class point_set
{
public:

    point_set();
    point_set(std::initializer_list<vec2_parameterized> const& param);

    /** The number of points in the set */
    int size() const;
    /** Add a point
     *  The point is actually added only if its distance to the
     *   previous one is greater than a minimal threshold.
    */
    void push_back(vec2 const& point);

    /** Get/Set point with syntax point_set[k] */
    vec2_parameterized& operator[](int index);
    /** Get point with syntax point_set[k] */
    vec2_parameterized const& operator[](int index) const;
    /** Get/Set point with syntax point_set(k) */
    vec2_parameterized& operator()(int index);
    /** Get point with syntax point_set(k) */
    vec2_parameterized const& operator()(int index) const;

    /** stl compatible: get first element */
    vec2_parameterized const& front() const;
    /** stl compatible: get last element */
    vec2_parameterized const& back() const;

    /** stl compatible iterator */
    std::vector<vec2_parameterized>::const_iterator begin() const;
    /** stl compatible iterator */
    std::vector<vec2_parameterized>::const_iterator end() const;

private:
    /** Internal data storing all the points */
    std::vector<vec2_parameterized> data;
};

/** Print a point set */
std::ostream& operator<<(std::ostream& stream,point_set const& value);

#endif
