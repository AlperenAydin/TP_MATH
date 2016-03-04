
#pragma once
#ifndef WINDOW_HPP
#define WINDOW_HPP

#include <QMainWindow>

//forward declaration
namespace Ui{
class MainWindow;
}
class render_area;

/** Declaration of the window class */
class window: public QMainWindow
{
    Q_OBJECT

public:

    window(QWidget *parent=nullptr);
    ~window();

private slots:

    void action_quit();

private:

    Ui::MainWindow *ui;
    render_area *render;

};

#endif
