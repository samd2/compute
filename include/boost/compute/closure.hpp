//---------------------------------------------------------------------------//
// Copyright (c) 2013-2014 Kyle Lutz <kyle.r.lutz@gmail.com>
//
// Distributed under the Boost Software License, Version 1.0
// See accompanying file LICENSE_1_0.txt or copy at
// http://www.boost.org/LICENSE_1_0.txt
//
// See http://kylelutz.github.com/compute for more information.
//---------------------------------------------------------------------------//

#ifndef BOOST_COMPUTE_CLOSURE_HPP
#define BOOST_COMPUTE_CLOSURE_HPP

#include <string>
#include <sstream>

#include <boost/config.hpp>
#include <boost/mpl/for_each.hpp>
#include <boost/mpl/transform.hpp>
#include <boost/typeof/typeof.hpp>
#include <boost/static_assert.hpp>
#include <boost/algorithm/string.hpp>
#include <boost/tuple/tuple.hpp>
#include <boost/type_traits/function_traits.hpp>

#include <boost/compute/cl.hpp>
#include <boost/compute/function.hpp>
#include <boost/compute/type_traits/type_name.hpp>

namespace boost {
namespace compute {
namespace detail {

template<class ResultType, class ArgTuple, class CaptureTuple>
class invoked_closure
{
public:
    typedef ResultType result_type;

    BOOST_STATIC_CONSTANT(
        size_t, arity = boost::tuples::length<ArgTuple>::value
    );

    invoked_closure(const std::string &name,
                     const std::string &source,
                     const ArgTuple &args,
                     const CaptureTuple &capture)
        : m_name(name),
          m_source(source),
          m_args(args),
          m_capture(capture)
    {
    }

    std::string name() const
    {
        return m_name;
    }

    std::string source() const
    {
        return m_source;
    }

    const ArgTuple& args() const
    {
        return m_args;
    }

    const CaptureTuple& capture() const
    {
        return m_capture;
    }

private:
    std::string m_name;
    std::string m_source;
    ArgTuple m_args;
    CaptureTuple m_capture;
};

} // end detail namespace

/// \internal_
template<class Signature, class CaptureTuple>
class closure
{
public:
    typedef typename
        boost::function_traits<Signature>::result_type result_type;

    BOOST_STATIC_CONSTANT(
        size_t, arity = boost::function_traits<Signature>::arity
    );

    closure(const std::string &name,
            const CaptureTuple &capture,
            const std::string &source)
        : m_name(name),
          m_source(source),
          m_capture(capture)
    {
    }

    ~closure()
    {
    }

    std::string name() const
    {
        return m_name;
    }

    /// \internal_
    std::string source() const
    {
        return m_source;
    }

    /// \internal_
    void recapture(const CaptureTuple &capture)
    {
        m_capture = capture;
    }

    /// \internal_
    detail::invoked_closure<result_type, boost::tuple<>, CaptureTuple>
    operator()() const
    {
        BOOST_STATIC_ASSERT_MSG(
            arity == 0,
            "Non-nullary closure function invoked with zero arguments"
        );

        return detail::invoked_closure<result_type, boost::tuple<>, CaptureTuple>(
            m_name, m_source, boost::make_tuple(), m_capture
        );
    }

    /// \internal_
    template<class Arg1>
    detail::invoked_closure<result_type, boost::tuple<Arg1>, CaptureTuple>
    operator()(const Arg1 &arg1) const
    {
        BOOST_STATIC_ASSERT_MSG(
            arity == 1,
            "Non-unary closure function invoked with one argument"
        );

        return detail::invoked_closure<result_type, boost::tuple<Arg1>, CaptureTuple>(
            m_name, m_source, boost::make_tuple(arg1), m_capture
        );
    }

    /// \internal_
    template<class Arg1, class Arg2>
    detail::invoked_closure<result_type, boost::tuple<Arg1, Arg2>, CaptureTuple>
    operator()(const Arg1 &arg1, const Arg2 &arg2) const
    {
        BOOST_STATIC_ASSERT_MSG(
            arity == 2,
            "Non-binary closure function invoked with two arguments"
        );

        return detail::invoked_closure<result_type, boost::tuple<Arg1, Arg2>, CaptureTuple>(
            m_name, m_source, boost::make_tuple(arg1, arg2), m_capture
        );
    }

    /// \internal_
    template<class Arg1, class Arg2, class Arg3>
    detail::invoked_closure<result_type, boost::tuple<Arg1, Arg2, Arg3>, CaptureTuple>
    operator()(const Arg1 &arg1, const Arg2 &arg2, const Arg3 &arg3) const
    {
        BOOST_STATIC_ASSERT_MSG(
            arity == 3,
            "Non-ternary closure function invoked with three arguments"
        );

        return detail::invoked_closure<result_type, boost::tuple<Arg1, Arg2, Arg3>, CaptureTuple>(
            m_name, m_source, boost::make_tuple(arg1, arg2, arg3), m_capture
        );
    }

private:
    std::string m_name;
    std::string m_source;
    CaptureTuple m_capture;
};

namespace detail {

struct closure_signature_argument_inserter
{
    closure_signature_argument_inserter(std::stringstream &s_,
                                        const char *capture_string,
                                        size_t last)
        : s(s_)
    {
        n = 0;
        m_last = last;

        size_t capture_string_length = std::strlen(capture_string);
        BOOST_ASSERT(capture_string[0] == '(' &&
                     capture_string[capture_string_length-1] == ')');
        std::string capture_string_(capture_string + 1, capture_string_length - 2);
        boost::split(m_capture_names, capture_string_ , boost::is_any_of(","));
    }

    template<class T>
    void operator()(const T&)
    {
        BOOST_ASSERT(n < m_capture_names.size());

        // remove leading and trailing whitespace from variable name
        boost::trim(m_capture_names[n]);

        s << type_name<T>() << " " << m_capture_names[n];
        if(n+1 < m_last){
            s << ", ";
        }
        n++;
    }

    size_t n;
    size_t m_last;
    std::vector<std::string> m_capture_names;
    std::stringstream &s;
};

template<class Signature, class CaptureTuple>
inline std::string
make_closure_declaration(const std::string &name,
                         const CaptureTuple &capture,
                         const char *capture_string)
{
    typedef typename
        boost::function_traits<Signature>::result_type result_type;
    typedef typename
        boost::function_types::parameter_types<Signature>::type parameter_types;
    typedef typename
        mpl::size<parameter_types>::type arity_type;

    std::stringstream s;
    s << "inline " << type_name<result_type>() << " " << name;
    s << "(";

    // insert function arguments
    signature_argument_inserter i(s, arity_type::value);
    mpl::for_each<
        typename mpl::transform<parameter_types, boost::add_pointer<mpl::_1>
    >::type>(i);
    s << ", ";

    // insert capture arguments
    closure_signature_argument_inserter j(
        s, capture_string, boost::tuples::length<CaptureTuple>::value
    );
    mpl::for_each<CaptureTuple>(j);

    s << ")";
    return s.str();
}

// used by the BOOST_COMPUTE_CLOSURE() macro to create a closure
// function with the given signature, name, capture, and source.
template<class Signature, class CaptureTuple>
inline closure<Signature, CaptureTuple>
make_closure_impl(const std::string &name,
                  const CaptureTuple &capture,
                  const char *capture_string,
                  const std::string &source)
{
    std::stringstream s;
    s << make_closure_declaration<Signature>(name, capture, capture_string);
    s << source;
    return closure<Signature, CaptureTuple>(name, capture, s.str());
}

} // end detail namespace
} // end compute namespace
} // end boost namespace

/// Creates a closure function object with \p name and \p source.
///
/// \param return_type The return type for the function.
/// \param name The name of the function.
/// \param args A list of argument types for the function.
/// \param capture A list of variables to capture.
/// \param source The OpenCL C source code for the function.
///
/// For example, to create a function which checks if a 2D point is
/// contained in a circle of a given radius:
/// \code
/// // radius variable declared in C++
/// float radius = 1.5f;
///
/// // create a closure function which returns true if the 2D point
/// // argument is contained within a circle of the given radius
/// BOOST_COMPUTE_CLOSURE(bool, is_in_circle, (float2_), (radius),
/// {
///     return sqrt(_1.x*_1.x + _1.y*_1.y) < radius;
/// });
///
/// // vector of 2D points
/// boost::compute::vector<float2_> points = ...
///
/// // count number of points in the circle
/// size_t count = boost::compute::count_if(
///     points.begin(), points.end(), is_in_circle, queue
/// );
/// \endcode
///
/// \see BOOST_COMPUTE_FUNCTION()
#ifdef BOOST_COMPUTE_DOXYGEN_INVOKED
#define BOOST_COMPUTE_CLOSURE(return_type, name, args, capture, source)
#else
#define BOOST_COMPUTE_CLOSURE(return_type, name, args, capture, ...) \
    ::boost::compute::closure< \
        return_type args, BOOST_TYPEOF(boost::make_tuple capture) \
    > name = \
        ::boost::compute::detail::make_closure_impl<return_type args>( \
            #name, boost::make_tuple capture, #capture, #__VA_ARGS__ \
        )
#endif

#endif // BOOST_COMPUTE_CLOSURE_HPP