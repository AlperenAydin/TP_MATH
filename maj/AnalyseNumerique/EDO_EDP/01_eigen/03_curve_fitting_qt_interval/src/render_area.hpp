#pragma once

#ifndef RENDER_AREA_HPP
#define RENDER_AREA_HPP


#include <QWidget>
#include <QTimer>
#include <QTime>
#include <list>

#include "polynomial.hpp"
#include "point_set.hpp"
#include "vec2.hpp"


//forward declaration of QLabel
class QLabel;



class render_area : public QWidget
{
    Q_OBJECT
public:

    render_area(QWidget *parent = 0);
    ~render_area();



protected:
    /** Actual drawing function */
    void paintEvent(QPaintEvent *event);

    /** Function called when the mouse is pressed */
    void mousePressEvent(QMouseEvent *event);
    /** Function called when the mouse is moved */
    void mouseMoveEvent(QMouseEvent *event);

private: //functions

    /** Add a new point to the point_set and update the polynomial */
    void add_new_point(vec2 const& new_point);

private: //attributes

    /** the set of all the points */
    point_set points;
    /** the fitted polynomial */
    polynomial curve;


    /** Left-most point */
    float x_left;
    /** Right-most point */
    float x_right;

};

#endif
