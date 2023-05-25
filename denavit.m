n = input("Number of joints: ");
syms l t an d l1 l2 l3 l4 t1 t2 t3 t4;
T = eye(4);
for i = 1:n
    t(i) = input("theta:");
    l(i) = input("l:");
    an(i) = input("alpha:");
    d(i) = input("d:");
    A = [
        cos(t(i)) -sin(t(i))*cos(an(i)) sin(t(i))*sin(an(i)) l(i)*cos(t(i));
        sin(t(i)) cos(t(i))*cos(an(i)) cos(t(i))*sin(an(i)) l(i)*sin(t(i));
        0 sin(an(i)) cos(an(i)) d(i);
        0 0 0 1
        ]
    T = T*A;
end
r = simplify(T)
