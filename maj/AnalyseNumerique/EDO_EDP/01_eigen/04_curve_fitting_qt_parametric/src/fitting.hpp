#pragma once

#ifndef FITTING_HPP
#define FITTING_HPP

// forward declaration
class point_set;
class polynomial;

/** Fit a polynomial of given degree to the set of points */
polynomial fitting(point_set const& points,int degree);

#endif
