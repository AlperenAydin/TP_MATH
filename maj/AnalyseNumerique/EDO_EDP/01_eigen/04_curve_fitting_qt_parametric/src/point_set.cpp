#include "point_set.hpp"

#include <cassert>


point_set::point_set()
    :data()
{}

int point_set::size() const
{
    return data.size();
}

void point_set::push_back(vec2 const& point)
{
    int const N=size();

    float const threshold=0.01f; //min interval between 2 points
    bool should_append_point=true;

    float t=0.0f; //first point t=0
    if(N>0)
    {
        vec2_parameterized const& previous=data[N-1];
        vec2 const& point_previous=previous.point;

        //distance between current and previous point
        float const delta_t=norm(point-point_previous);
        t=delta_t + previous.time;

        //only insert point if dt>threshold
        if(delta_t<threshold)
            should_append_point=false;
    }

    if(should_append_point)
        data.push_back({point,t});
}


vec2_parameterized& point_set::operator[](int index) {return data.at(index);}
vec2_parameterized const& point_set::operator[](int index) const {return data.at(index);}
vec2_parameterized& point_set::operator()(int index) {return data.at(index);}
vec2_parameterized const& point_set::operator()(int index) const {return data.at(index);}

std::vector<vec2_parameterized>::const_iterator point_set::begin() const
{
    return data.begin();
}
std::vector<vec2_parameterized>::const_iterator point_set::end() const
{
    return data.end();
}
vec2_parameterized const& point_set::front() const
{
    return *data.begin();
}
vec2_parameterized const& point_set::back() const
{
    return *data.rbegin();
}

std::ostream& operator<<(std::ostream& stream,point_set const& value)
{
    stream<<"{ ";
    for(auto const& p : value)
        stream<<"("<<p<<") ";
    stream<<"}";

    return stream;
}
