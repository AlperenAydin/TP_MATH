#include "fitting.hpp"

#include "point_set.hpp"
#include "polynomial.hpp"

#include <Eigen/Dense>

static void initialize_matrices(Eigen::MatrixXf& A,
                                Eigen::VectorXf& bx,
                                Eigen::VectorXf& by,
                                int const N);


polynomial fitting(point_set const& points,int degree)
{
    int const N=degree+1;

    //make sure there is enough points
    if(points.size()<N)
        return polynomial(); //empty polynomial


    //initialize matrix
    Eigen::MatrixXf A;
    Eigen::VectorXf bx,by;

    // Initialization
    initialize_matrices(A,bx,by,N);

    // Fill matrices
    // *********************** //
    //
    //  Remplir matrices A et vecteur bx,by
    //    avec les valeurs appropriees.
    //
    // *********************** //

    for(int k = 0; k < N; k++)
    {
        for(int i = 0; i < points.size(); i++)
        {
            float xi = points[i].point.x;
            float yi = points[i].point.y;
            float ti = points[i].time;
            bx(k) += pow(ti,k)*xi;
            by(k) += pow(ti,k)*yi;
        }
    }

    for(int k = 0; k < N; k++ )
    {
        for(int j = 0; j< N; j++)
        {
            for (int i = 0; i < points.size(); i++)
            {
                A(k,j) += pow(points[i].time, j+k);
            }
        }
    }

    // Solve system matrix
    // *********************** //
    //  Demander la resolution du systeme
    //    lineaire.
    //
    //  Calculer solution_x = least_square(A,bx)
    //           solution_y = least_square(A,by)
    //
    //  Puis remplir un polynome avec
    //    les valeurs de la solution {bx,by}.
    //
    // *********************** //

    Eigen::VectorXf px = A.fullPivLu().solve(bx);
    Eigen::VectorXf py = A.fullPivLu().solve(by);


    return polynomial(px,py);
}

static void initialize_matrices(Eigen::MatrixXf& A,
                                Eigen::VectorXf& bx,
                                Eigen::VectorXf& by,
                                int const N)
{
    //A has a size of NxN
    A.resize(N,N);

    //bx,by are vector of length N
    bx.resize(N);
    by.resize(N);

    for(int k=0; k<N; ++k)
    {
        bx(k) = 0.0f;
        by(k) = 0.0f;
    }

    for(int kx=0; kx<N; ++kx)
        for(int ky=0; ky<N; ++ky)
            A(kx,ky) = 0.0f;
}



