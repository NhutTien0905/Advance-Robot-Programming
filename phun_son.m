r = 100; b = 10; p = 5;
l1 = 100; l2 = 100;
for t = 0:0.01*pi:20*pi
    x = (r-b)*cos(t);
    y = (r-b)*sin(t);
    z = p*t;
    t1 = atan2(-x,y);
    l1 = z;
    l2 = sqrt(x^2+y^2);
    px = -l2*sin(t1);
    py = l2*cos(t1);
    pz = l1;
    subplot(1,2,1)
    t1 = t1*180/pi;
    plot(t,t1,"*",t,l1,"-^",t,l2,"--");hold on
    subplot(1,2,2)
    plot3(px,py,pz,"*");
    hold on

end
   