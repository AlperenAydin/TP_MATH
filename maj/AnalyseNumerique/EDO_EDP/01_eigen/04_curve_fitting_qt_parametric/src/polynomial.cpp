
#include "polynomial.hpp"

#include <iomanip>

polynomial::polynomial()
    :data()
{}

polynomial::polynomial(std::initializer_list<vec2> const& param)
    :data(param)
{}


int polynomial::degree() const
{
    if( data.size()==0 )
        return 0;

    return data.size()-1;
}

vec2 polynomial::operator ()(float const t) const
{
    vec2 P;
    float t_power_k = 1.0f;

    int const N = data.size();
    for(int k=0; k<N; ++k)
    {
        P += data[k] * t_power_k;
        t_power_k *= t;
    }

    return P;
}

std::vector<vec2>::const_iterator polynomial::begin() const {return data.begin();}
std::vector<vec2>::const_iterator polynomial::end() const {return data.end();}

void polynomial::push_back(vec2 const& coefficient)
{
    data.push_back(coefficient);
}

std::ostream& operator<<(std::ostream& stream,polynomial const& param)
{
    if( param.degree() < 0 )
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


