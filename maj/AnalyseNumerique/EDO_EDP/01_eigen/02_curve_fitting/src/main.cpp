
#include "point_set.hpp"
#include "polynomial.hpp"
#include "fitting.hpp"

#include <iomanip>

#include <iostream>


int main()
{
    //setup limited precision for float printing
    std::cout << std::setprecision(2) << std::fixed;

    //fill points
    point_set points = {{0.1f,0.1f},
                        {0.5f,0.5f},
                        {0.9f,0.1f}};

    //print points
    std::cout << "Input points : " << points<<std::endl;

    //fit polynomial
    polynomial P = fitting(points,2);

    std::cout << "Solution : " << P << std::endl;

    std::cout << "Check : " << std::endl;
    for(auto const& p : points)
    {
        float const x = p.x;
        float const y = p.y;
        float const value = P(x);

        std::cout<<"P("<<x<<") = "<<value<<" ; y="<<y<<" ; error="<<y-value<<std::endl;
    }

    return 0;

}
