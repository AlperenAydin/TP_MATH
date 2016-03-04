
#include "render_area.hpp"
#include "fitting.hpp"

#include <QPainter>
#include <QMouseEvent>
#include <QLabel>


#include <iostream>



render_area::render_area(QWidget *parent)
    :QWidget(parent),points(),curve()
{
    setBackgroundRole(QPalette::Base);
    setAutoFillBackground(true);
}

render_area::~render_area()
{}



void render_area::paintEvent(QPaintEvent*)
{
    //Initialize painters
    QPainter painter(this);
    painter.setRenderHint(QPainter::Antialiasing, true);

    QPen pen;
    pen.setWidth(3.0);
    pen.setColor(Qt::blue);
    painter.setPen(pen);

    QBrush brush = painter.brush();
    brush.setColor(Qt::gray);
    brush.setStyle(Qt::SolidPattern);
    painter.setBrush(brush);

    //screen size
    float const w=width();
    float const h=height();

    //*******************************//
    // draw all the points
    //*******************************//
    for(auto const& value : points)
    {
        vec2 const& p=value.point;
        painter.drawPoint(p.x*w,p.y*h);
    }



    //*******************************//
    // draw all the polynomial
    //*******************************//
    pen.setWidth(2.0);
    pen.setColor(Qt::red);
    painter.setPen(pen);

    //check if there is a computed polynomial
    if(curve.degree()>0)
    {
        int const N_sample=200;
        float const t_max=points.back().time;

        for(int k=0;k<N_sample-1;++k)
        {
            float const L=N_sample-1;
            float const t0= (k+0) / L * t_max;
            float const t1= (k+1) / L * t_max;

            vec2 const& p0=curve(t0);
            vec2 const& p1=curve(t1);

            painter.drawLine(p0.x*w,p0.y*h,
                             p1.x*w,p1.y*h);
        }

    }

}




void render_area::mouseMoveEvent(QMouseEvent *event)
{
    float const w=width();
    float const h=height();
    vec2 const click=vec2(event->x()/w,event->y()/h);

    add_new_point(click);

    repaint();
}

void render_area::mousePressEvent(QMouseEvent *event)
{
    float const w=width();
    float const h=height();
    vec2 const click=vec2(event->x()/w,event->y()/h);

    add_new_point(click);

    repaint();
}

void render_area::add_new_point(vec2 const& new_point)
{
    //add point to the set
    points.push_back(new_point);

    //compute the fitting
    curve=fitting(points,7);

}



