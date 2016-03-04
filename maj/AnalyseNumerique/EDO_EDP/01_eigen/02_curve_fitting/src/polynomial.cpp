
#include "polynomial.hpp"

#include <iomanip>

polynomial::polynomial()
    :data()
{}

polynomial::polynomial(std::initializer_list<float> const& param)
    :data(param)
{}


int polynomial::degree() const
{
    if( data.size()==0 )
        return 0;

    return data.size()-1;
}

float polynomial::operator ()(float const x) const
{
    float P = 0.0f;
    float x_power_k = 1.0f;

    int const N = data.size();
    for(int k=0; k<N; ++k)
    {
        P += data[k]*x_power_k;
        x_power_k *= x;
    }

    return P;
}

std::vector<float>::const_iterator polynomial::begin() const {return data.begin();}
std::vector<float>::const_iterator polynomial::end() const {return data.end();}

void polynomial::push_back(float coefficient)
{
    data.push_back(coefficient);
}

std::ostream& operator<<(std::ostream& stream,polynomial const& param)
{
    if( param.degree() <= 0 )
        stream << "null polynomial";

    int const degree_max = param.degree();
    int d=0;
    for(auto const& ak : param)
    {
        stream << ak << " x^" <<d;
        if( d < degree_max )
            stream << " + ";
        d++;
    }
    return stream;
}


