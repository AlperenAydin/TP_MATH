#pragma once

#ifndef POLYNOMIAL_HPP
#define POLYNOMIAL_HPP

#include <vector>
#include <initializer_list>
#include <ostream>

#include "vec2.hpp"

/** Model a polynomial
 *
 * Store the coefficient a[k] in the formula
 *  P(t)=Sum_k a[k] t^k
 *
 */
class polynomial
{
public:

    polynomial();
    polynomial(std::initializer_list<vec2> const& param);

    /** Get the degree of the polynomial (degree=nbr of coefficient -1)*/
    int degree() const;

    /** evaluate the polynomial P(t) at the given x */
    vec2 operator ()(float t) const;

    /** add a coefficient to the polynomial (increasing power of x) */
    void push_back(vec2 const& coefficient);


    /** stl compatible iterator */
    std::vector<vec2>::const_iterator begin() const;
    /** stl compatible iterator */
    std::vector<vec2>::const_iterator end() const;

    /** Create polynomial from a generic vector */
    template <typename T>
    polynomial(T const& generic_vector)
        :polynomial()
    {
        for(int k=0, N=generic_vector.size(); k<N; ++k)
            push_back(generic_vector[k]);
    }
    template <typename T>
    polynomial(T const& generic_vector_x, T const& generic_vector_y)
        :polynomial()
    {
        for(int k=0, N=generic_vector_x.size(); k<N; ++k)
            push_back({generic_vector_x[k],generic_vector_y[k]});
    }
    /** Allow affectation between a polynomial and a generic vector */
    template <typename T>
    polynomial& operator= (T const& generic_vector)
    {
        *this = polynomial(generic_vector); return *this;
    }

private:

    /** internal data of coefficient */
    std::vector<vec2> data;
};

/** Print the polynomial */
std::ostream& operator<<(std::ostream& stream,polynomial const& param);



#endif
