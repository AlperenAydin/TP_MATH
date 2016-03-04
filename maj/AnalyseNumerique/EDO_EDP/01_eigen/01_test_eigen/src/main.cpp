#include <Eigen/Dense>

#include <iostream>

int main()
{
	Eigen::Matrix2d a;

	a<<1.0f,2.0f,
	   3.0f,4.0f;

	Eigen::Matrix2d b=a.inverse();

    std::cout << "Matrix a" << std::endl;
	std::cout << a << std::endl<<std::endl;

    std::cout << "Matrix b = a.inverse()" << std::endl;
	std::cout << b << std::endl<<std::endl;

    
	Eigen::EigenSolver<Eigen::Matrix2d> c(a);

    std::cout << "Eigenvalues of a" << std::endl;
	std::cout << c.eigenvalues() << std::endl<<std::endl;;

    std::cout << "Eigenvectors of a" << std::endl;
	std::cout << c.eigenvectors() << std::endl<<std::endl;;

	return 0;
}