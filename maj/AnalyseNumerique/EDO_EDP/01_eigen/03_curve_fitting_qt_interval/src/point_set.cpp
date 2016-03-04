#include "point_set.hpp"


point_set::point_set()
    :data()
{}
point_set::point_set(std::initializer_list<vec2> const& param)
    :data(param)
{}

int point_set::size() const
{
    return data.size();
}

void point_set::push_back(vec2 const& param)
{
    data.push_back(param);
}

vec2 const& point_set::front() const
{
    return *data.begin();
}
vec2 const& point_set::back() const
{
    return *data.rbegin();
}

vec2& point_set::operator[](int index)
{
    return data.at(index);
}

vec2 const& point_set::operator[](int index) const
{
    return data.at(index);
}
vec2& point_set::operator()(int index)
{
    return data.at(index);
}

vec2 const& point_set::operator()(int index) const
{
    return data.at(index);
}

std::vector<vec2>::const_iterator point_set::begin() const {return data.cbegin();}
std::vector<vec2>::const_iterator point_set::end() const {return data.cend();}

std::ostream& operator<<(std::ostream& stream,point_set const& value)
{
    stream<<"{ ";
    for(auto const& p : value)
        stream<<"("<<p<<") ";
    stream<<"}";

    return stream;
}
