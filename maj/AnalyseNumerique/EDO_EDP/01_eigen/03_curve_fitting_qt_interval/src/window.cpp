
#include "window.hpp"

#include "render_area.hpp"
#include "ui_mainwindow.h"

#include <iostream>

window::window(QWidget *parent)
    :QMainWindow(parent),ui(new Ui::MainWindow),render(new render_area)
{
    ui->setupUi(this);

    ui->layout_scene->addWidget(render);

    //Connection with signals
    connect(ui->quit,SIGNAL(clicked()),this,SLOT(action_quit()));

}


window::~window()
{}

void window::action_quit()
{
    close();
}


