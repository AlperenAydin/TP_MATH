#include "fitting.hpp"

#include "point_set.hpp"
#include "polynomial.hpp"

#include <Eigen/Dense>


static void initialize_matrices(Eigen::MatrixXf& A , Eigen::VectorXf& b , int const N);



polynomial fitting(point_set const& points,int const degree)
{
    int const N = degree+1;

    //make sure there is enough points
    if(points.size()<N)
        return polynomial();

    //initialize matrix
    Eigen::MatrixXf A;
    Eigen::VectorXf b;

    // Initialization
    initialize_matrices(A, b, N);

    // Fill matrices
    // *********************** //
    //  Remplir matrices A et vecteur b
    //    avec les valeurs appropriees.
    // *********************** //

    for(int k = 0; k < N; k++)
    {
        for (int i = 0; i < points.size(); i++)
        {
            float xi = points[i].x;
            float yi = points[i].y;
            b(k) += pow(xi,k)*yi;
        }
    }

    for(int k = 0; k < N; k++ )
    {
        for(int j = 0; j< N; j++)
        {
            for (int i = 0; i < points.size(); i++)
            {
                A(k,j) += pow(points[i].x, j+k);
            }
        }
    }
    // Solve system matrix
    // *********************** //
    //  Demander la resolution du systeme
    //    lineaire.
    //
    //  Calculer solution = least_square(A,b)
    //   (utiliser fullPivLu par exemple comme solver.
    //    Stockez la solution dans une Eigen::VectorXf avant
    //    de le convertir en polynome).
    //
    // *********************** //

    Eigen::VectorXf p = A.fullPivLu().solve(b);

    return polynomial(p);
}



static void initialize_matrices(Eigen::MatrixXf& A,
                                Eigen::VectorXf& b,
                                int const N)
{
    //A has a size of NxN
    A.resize(N,N);
    //b is a vector of length N
    b.resize(N);

    //set all values to 0
    for(int k=0 ; k<N ; ++k)
        b(k) = 0.0f;

    for(int kx=0 ; kx<N ; ++kx)
        for(int ky=0 ; ky<N ; ++ky)
            A(kx,ky) = 0.0f;
}


