l1=5;
l2=5;
range=2.5;
step=1;
xg1=15;
xg2=6;
t=1;
while true
    for a = -range:step:range
        kx1=[0 5*sin(atan(a/8)+acos(sqrt(a*a+64)/10))];
        ky1=[0 5*cos(atan(a/8)+acos(sqrt(a*a+64)/10))];
        k1=plot(kx1,ky1);
        hold on
        kx2=[5*sin(atan(a/8)+acos(sqrt(a*a+64)/10)),a];
        ky2=[5*cos(atan(a/8)+acos(sqrt(a*a+64)/10)),8];
        k2=plot(kx2,ky2);
        hold on
        kx3=[-5 -5+5*sin(atan(a/8)-acos(sqrt(a*a+64)/10))];
        ky3=[0 5*cos(atan(a/8)-acos(sqrt(a*a+64)/10))];
        k3=plot(kx3,ky3);
        hold on
        kx4=[-5+5*sin(atan(a/8)-acos(sqrt(a*a+64)/10)),a-5];
        ky4=[5*cos(atan(a/8)-acos(sqrt(a*a+64)/10)),8];
        k4=plot(kx4,ky4);
        hold on
        k5=rectangle('Position',[a-5 8 5 10]);
        hold on
        k6=rectangle('Position',[-5 20 5 6]);
        hold on
        kx7=[a a+5*sin(atan(a/8)+acos(sqrt(a*a+64)/10))];
        ky7=[18 18+5*cos(atan(a/8)+acos(sqrt(a*a+64)/10))];
        k7=plot(kx7,ky7);
        hold on
        kx8=[a+5*sin(atan(a/8)+acos(sqrt(a*a+64)/10)),0];
        ky8=[18+5*cos(atan(a/8)+acos(sqrt(a*a+64)/10)),26];
        k8=plot(kx8,ky8);
        hold on
        kx9=[a-5 a-5+5*sin(atan(a/8)-acos(sqrt(a*a+64)/10))];
        ky9=[18 18+5*cos(atan(a/8)-acos(sqrt(a*a+64)/10))];
        k9=plot(kx9,ky9);
        hold on
        kx10=[a-5+5*sin(atan(a/8)-acos(sqrt(a*a+64)/10)),-5];
        ky10=[18+5*cos(atan(a/8)-acos(sqrt(a*a+64)/10)),26];
        k10=plot(kx10,ky10);
        kx11=[a-xg1 a-xg2];
        ky11=[t*a+3 t*a+12];
        k11=plot(kx11,ky11);        
        axis([-15 10 -2 35]);
        pause(0.3);
        delete(k1);
        delete(k2);
        delete(k3);
        delete(k4);
        delete(k5);
        delete(k7);
        delete(k8);
        delete(k9);
        delete(k10);
        delete(k11);
    end
    xg1=5-xg1;
    xg2=5-xg2;
    range=-range;
    step=-step;
    t=-t;
end
