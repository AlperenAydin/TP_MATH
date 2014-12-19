clear all;hold on;


%M = [1,0 ; 1,1 ; 0,1; 0,-1 ; -1,0];
M = randn (5,2);

C = [(M(:,1).^2) (M(:,1).*M(:,2)) (M(:,2).^2) M(:,1) M(:,2) ones(5,1)];

 ker = null (C);
 

 
 eq_str_a  = [sprintf('%0.2f',ker(1)),'*x.^2+'];
 eq_str_b  = [sprintf('%0.2f',ker(2)),'*x*y+'];
 eq_str_c  = [sprintf('%0.2f',ker(3)),'*y.^2+'];
 eq_str_d  = [sprintf('%0.2f',ker(4)),'*x+'];
 eq_str_e  = [sprintf('%0.2f',ker(5)),'*y+'];
 eq_str_f  = [sprintf('%0.2f',ker(6))] ;
 
 eq_str  = [eq_str_a,eq_str_b,eq_str_c,eq_str_d,eq_str_e,eq_str_f];
 
 plot (M(:,1),M(:,2),'*');
 ezplot (eq_str, [-2,2], [-2,2]);