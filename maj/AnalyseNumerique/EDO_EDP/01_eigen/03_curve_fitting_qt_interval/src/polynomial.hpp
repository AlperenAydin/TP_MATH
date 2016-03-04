#pragma once

#ifndef POLYNOMIAL_HPP
#define POLYNOMIAL_HPP

#include <vector>
#include <initializer_list>
#include <ostream>

/** Model a polynomial
 *
 * Store the coefficient a[k] in the formula
 *  P(x)=Sum_k a[k] x^k
 *
 */
class polynomial
{
public:

    polynomial();
    polynomial(std::initializer_list<float> const& param);

    /** Get the degree of the polynomial (degree=nbr of coefficient -1)*/
    int degree() const;

    /** evaluate the polynomial P(x) at the given x */
    float operator ()(float x) const;

    /** add a coefficient to the polynomial (increasing power of x) */
    void push_back(float coefficient);


    /** stl compatible iterator */
    std::vector<float>::const_iterator begin() const;
    /** stl compatible iterator */
    std::vector<float>::const_iterator end() const;

    /** Create polynomial from a generic vector */
    template <typename T>
    polynomial(T const& generic_vector)
        :polynomial()
    {
        for(int k=0, N=generic_vector.size(); k<N; ++k)
            push_back(generic_vector[k]);
    }
    /** Allow affectation between a polynomial and a generic vector */
    template <typename T>
    polynomial& operator= (T const& generic_vector)
    {
        *this = polynomial(generic_vector); return *this;
    }

private:

    /** internal data of coefficient */
    std::vector<float> data;
};

/** Print the polynomial */
std::ostream& operator<<(std::ostream& stream,polynomial const& param);



#endif
