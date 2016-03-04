
#include "render_area.hpp"
#include "fitting.hpp"

#include <QPainter>
#include <QMouseEvent>
#include <QLabel>


#include <iostream>



render_area::render_area(QWidget *parent)
    :QWidget(parent),points(),curve(),x_left(-1.0f),x_right(-1.0f)
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
    pen.setWidth(2.0);
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
    for(auto const& p : points)
        painter.drawPoint(p.x*w,p.y*h);



    //*******************************//
    // draw all the polynomial
    //*******************************//
    pen.setWidth(1.0);
    pen.setColor(Qt::red);
    painter.setPen(pen);

    //check if there is a computed polynomial
    if(curve.degree()>0)
    {
        //draw the polynomial as a set of lines
        int const N_sample=100;
        for(int k=0;k<N_sample-1;++k)
        {
            //Algorithm
            //  Compute y0=P(x0), y1=P(x1)
            //   where x1=x0+dx
            //  Draw the line [(x0,y0);(x1,y1)]

            float u0= k/static_cast<float>(N_sample-1);
            float u1=(k+1)/static_cast<float>(N_sample-1);

            float x0=x_left+u0*(x_right-x_left);
            float x1=x_left+u1*(x_right-x_left);

            float y0=curve(x0);
            float y1=curve(x1);

            painter.drawLine(x0*w,y0*h,
                             x1*w,y1*h);
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
    curve=fitting(points,50);

    //boundaries
    float const x_current=new_point.x;
    if(points.size()==1)
    {
        x_left  = x_current;
        x_right = x_current;
    }
    else
    {
        if(x_current<x_left)
            x_left  = x_current;
        if(x_current>x_right)
            x_right = x_current;
    }


}



