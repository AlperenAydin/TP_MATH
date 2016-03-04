#include "vec2_parameterized.hpp"

std::ostream& operator<<(std::ostream& stream,vec2_parameterized const& value)
{
    stream<<value.point<<";"<<value.time;
    return stream;
}
