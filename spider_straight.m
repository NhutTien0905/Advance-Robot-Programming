clc
clear all
close all
%%
%% Thong so
n = 50;
radius = 3;
centero = [10 10];
h = 1.5;
angle = [0 60 120 180 -120 -60];
base =      [cos(0) sin(0);
                cos(pi/3) sin(pi/3);
                cos(2*pi/3) sin(2*pi/3);
                cos(pi) sin(pi);
                cos(4*pi/3) sin(4*pi/3);
                cos(5*pi/3) sin(5*pi/3);]
length1 = 1.2;
length2 = 1.5;
mbase = 300;
mleg = 150/6;
%%
%% Vi tri bat dau
%%
    center = centero;
    for i=1:6 
        servo1(i,:) = [radius*base(i,:)+center h];
    end
    centerservo1 = servo1(:,1:2);

    for i=1:6
        servo2(i,:) = [length1*base(i,:)+centerservo1(i,:) h];
    end

    for i=1:6
        toe(i,:) = [servo2(i,1:2) servo2(i,3)-length2];
    end
    %% Tinh tru
    bear = [];
    for i=1:6
        if (toe(i,3)==0)
            bear = [bear; toe(i,:)];
        end
    end
    %% Tinh trong tam
    centerx = [0 0 0];
    for i=1:6
        for j=1:3
            centerx(1,j) = centerx(1,j)+servo1(i,j)*mbase/6+servo2(i,j)*mleg/2+toe(i,j)*mleg/2;
        end
    end
    centerx = centerx/(mbase+mleg*6);
    %% Ve
    
    plot3([servo1(:,1);servo1(1,1)],[servo1(:,2);servo1(1,2)],[servo1(:,3);servo1(1,3)],'o-','MarkerSize',3,'MarkerFaceColor','r','LineWidth',1)
    hold on
    plot3(center(1,1),center(1,2),h,'*','MarkerSize',7,'MarkerFaceColor','r')

    for i=1:6
        hold on
        plot3([servo1(i,1);servo2(i,1)],[servo1(i,2);servo2(i,2)],[servo1(i,3);servo2(i,3)],'o-r','MarkerSize',3,'MarkerFaceColor','r','LineWidth',1)
        grid on
    end
    for i=1:6
        hold on
        plot3([toe(i,1);servo2(i,1)],[toe(i,2);servo2(i,2)],[toe(i,3);servo2(i,3)],'o-c','MarkerSize',3,'MarkerFaceColor','r','LineWidth',1)
        grid on
    end
    hold on
    p1 = plot3([bear(:,1);bear(1,1)],[bear(:,2);bear(1,2)],[bear(:,3);bear(1,3)],'--k','LineWidth',1,'DisplayName','Duong tru');
    hold on
    p3 = plot3(centerx(1,1),centerx(1,2),centerx(1,3),'v','MarkerSize',7,'MarkerFaceColor','r','DisplayName','Trong tam');
    legend([p1,p3]);
    axis([5 15 5 30 0 2]);
    set(gca, 'DataAspectRatio',[1 1 1])
    pause(.5);
    hold off
%% move
for y=0:20
    
%% Step1
for i=0:5:30
        angle2 = angle(1,2)/2-i;
        alpha = pi*angle2/180;
        if (i<=15)
            beta = (i*2)*pi/180;
        else
            beta = (60-i*2)*pi/180;
        end
        k=2;
            %anglea = angle(1,i)-alpha;
            
            servo2(k,1) = servo1(k,1)+length1*sin(alpha);
            servo2(k,2) = servo1(k,2)+length1*cos(alpha);
            servo2(k,3) = servo1(k,3);
        
                toe(k,:) = servo2(k,:);
            toe(k,1) = toe(k,1)+length2*sin(beta)*sin(alpha);
            toe(k,2) = toe(k,2)+length2*sin(beta)*cos(alpha);
            toe(k,3) = toe(k,3)-length2*cos(beta);
        k=4
            angle4 = angle(1,4)/2-i;
            alpha = -pi*angle4/180;
            servo2(k,1) = servo1(k,1)+length1*sin(alpha);
            servo2(k,2) = servo1(k,2)+length1*cos(alpha);
            servo2(k,3) = servo1(k,3);
        
                toe(k,:) = servo2(k,:);
            toe(k,1) = toe(k,1)+length2*sin(beta)*sin(alpha);
            toe(k,2) = toe(k,2)+length2*sin(beta)*cos(alpha);
            toe(k,3) = toe(k,3)-length2*cos(beta);
        k=6
            angle6 = angle(1,6)/2-i-180;
            alpha = pi*angle6/180;
            servo2(k,1) = servo1(k,1)+length1*sin(alpha);
            servo2(k,2) = servo1(k,2)+length1*cos(alpha);
            servo2(k,3) = servo1(k,3);
        
                toe(k,:) = servo2(k,:);
            toe(k,1) = toe(k,1)+length2*sin(beta)*sin(alpha);
            toe(k,2) = toe(k,2)+length2*sin(beta)*cos(alpha);
            toe(k,3) = toe(k,3)-length2*cos(beta);
         bear = [];
    for i=1:6
        if (toe(i,3)<0.05)
            bear = [bear; toe(i,:)];
        end
    end
    %% Tinh trong tam
    centerx = [0 0 0];
    for i=1:6
        for j=1:3
            centerx(1,j) = centerx(1,j)+servo1(i,j)*mbase/6+servo2(i,j)*mleg/2+toe(i,j)*mleg/2;
        end
    end
    centerx = centerx/(mbase+mleg*6);
    %% Ve
    
    plot3([servo1(:,1);servo1(1,1)],[servo1(:,2);servo1(1,2)],[servo1(:,3);servo1(1,3)],'o-','MarkerSize',3,'MarkerFaceColor','r','LineWidth',1)
    hold on
    plot3(center(1,1),center(1,2),h,'*','MarkerSize',7,'MarkerFaceColor','b')

    for i=1:6
        hold on
        plot3([servo1(i,1);servo2(i,1)],[servo1(i,2);servo2(i,2)],[servo1(i,3);servo2(i,3)],'o-r','MarkerSize',3,'MarkerFaceColor','b','LineWidth',1)
        grid on
    end
    for i=1:6
        hold on
        plot3([toe(i,1);servo2(i,1)],[toe(i,2);servo2(i,2)],[toe(i,3);servo2(i,3)],'o-c','MarkerSize',3,'MarkerFaceColor','b','LineWidth',1)
        grid on
    end
    hold on
    p1 = plot3([bear(:,1);bear(1,1)],[bear(:,2);bear(1,2)],[bear(:,3);bear(1,3)],'--k','LineWidth',1,'DisplayName','Duong tru');
    hold on
    p3 = plot3(centerx(1,1),centerx(1,2),centerx(1,3),'v','MarkerSize',7,'MarkerFaceColor','c','DisplayName','Trong tam');
    legend([p1,p3]);
    axis([5 15 5 30 0 2]);
    set(gca, 'DataAspectRatio',[1 1 1])
    pause(.0001);
    hold off
end
%% Step 2
center = center+[0 0.2];
    
for i=1:6 
        servo1(i,:) = [radius*base(i,:)+center h];
    end
    centerservo1 = servo1(:,1:2);

    for i=1:6
        servo2(i,:) = [length1*base(i,:)+centerservo1(i,:) h];
    end

    for i=1:6
        toe(i,:) = [servo2(i,1:2) servo2(i,3)-length2];
    end
    %% Tinh tru
    bear = [];
    for i=1:6
        if (toe(i,3)==0)
            bear = [bear; toe(i,:)];
        end
    end
    %% Tinh trong tam
    centerx = [0 0 0];
    for i=1:6
        for j=1:3
            centerx(1,j) = centerx(1,j)+servo1(i,j)*mbase/6+servo2(i,j)*mleg/2+toe(i,j)*mleg/2;
        end
    end
    centerx = centerx/(mbase+mleg*6);
    %% Ve
    
    plot3([servo1(:,1);servo1(1,1)],[servo1(:,2);servo1(1,2)],[servo1(:,3);servo1(1,3)],'o-','MarkerSize',3,'MarkerFaceColor','r','LineWidth',1)
    hold on
    plot3(center(1,1),center(1,2),h,'*','MarkerSize',7,'MarkerFaceColor','b')

    for i=1:6
        hold on
        plot3([servo1(i,1);servo2(i,1)],[servo1(i,2);servo2(i,2)],[servo1(i,3);servo2(i,3)],'o-r','MarkerSize',3,'MarkerFaceColor','b','LineWidth',1)
        grid on
    end
    for i=1:6
        hold on
        plot3([toe(i,1);servo2(i,1)],[toe(i,2);servo2(i,2)],[toe(i,3);servo2(i,3)],'o-c','MarkerSize',3,'MarkerFaceColor','b','LineWidth',1)
        grid on
    end
    hold on
    p1 = plot3([bear(:,1);bear(1,1)],[bear(:,2);bear(1,2)],[bear(:,3);bear(1,3)],'--k','LineWidth',1,'DisplayName','Duong tru');
    hold on
    p3 = plot3(centerx(1,1),centerx(1,2),centerx(1,3),'v','MarkerSize',7,'MarkerFaceColor','c','DisplayName','Trong tam');
    legend([p1,p3]);
    axis([5 15 5 30 0 2]);
    set(gca, 'DataAspectRatio',[1 1 1])
    pause(.0001);
    hold off

%% Step3
for i=0:5:30
        angle3 = angle(1,1)/2-i+30;
        alpha = -pi*angle3/180;
        if (i<=15)
            beta = (i*2)*pi/180;
        else
            beta = (60-i*2)*pi/180;
        end
        k=3;
            %anglea = angle(1,i)-alpha;
            
            servo2(k,1) = servo1(k,1)+length1*sin(alpha);
            servo2(k,2) = servo1(k,2)+length1*cos(alpha);
            servo2(k,3) = servo1(k,3);
        
                toe(k,:) = servo2(k,:);
            toe(k,1) = toe(k,1)+length2*sin(beta)*sin(alpha);
            toe(k,2) = toe(k,2)+length2*sin(beta)*cos(alpha);
            toe(k,3) = toe(k,3)-length2*cos(beta);
        k=5
            angle5 = angle(1,5)/2-i+210;
            alpha = -pi*angle5/180;
            servo2(k,1) = servo1(k,1)+length1*sin(alpha);
            servo2(k,2) = servo1(k,2)+length1*cos(alpha);
            servo2(k,3) = servo1(k,3);
        
                toe(k,:) = servo2(k,:);
            toe(k,1) = toe(k,1)+length2*sin(beta)*sin(alpha);
            toe(k,2) = toe(k,2)+length2*sin(beta)*cos(alpha);
            toe(k,3) = toe(k,3)-length2*cos(beta);
        k=1
            angle1 = angle(1,1)/2-i+90;
            alpha = pi*angle1/180;
            servo2(k,1) = servo1(k,1)+length1*sin(alpha);
            servo2(k,2) = servo1(k,2)+length1*cos(alpha);
            servo2(k,3) = servo1(k,3);
        
                toe(k,:) = servo2(k,:);
            toe(k,1) = toe(k,1)+length2*sin(beta)*sin(alpha);
            toe(k,2) = toe(k,2)+length2*sin(beta)*cos(alpha);
            toe(k,3) = toe(k,3)-length2*cos(beta);
         bear = [];
    for i=1:6
        if (toe(i,3)<0.05)
            bear = [bear; toe(i,:)];
        end
    end
    %% Tinh trong tam
    centerx = [0 0 0];
    for i=1:6
        for j=1:3
            centerx(1,j) = centerx(1,j)+servo1(i,j)*mbase/6+servo2(i,j)*mleg/2+toe(i,j)*mleg/2;
        end
    end
    centerx = centerx/(mbase+mleg*6);
    %% Ve
    
    plot3([servo1(:,1);servo1(1,1)],[servo1(:,2);servo1(1,2)],[servo1(:,3);servo1(1,3)],'o-','MarkerSize',3,'MarkerFaceColor','r','LineWidth',1)
    hold on
    plot3(center(1,1),center(1,2),h,'*','MarkerSize',7,'MarkerFaceColor','b')

    for i=1:6
        hold on
        plot3([servo1(i,1);servo2(i,1)],[servo1(i,2);servo2(i,2)],[servo1(i,3);servo2(i,3)],'o-r','MarkerSize',3,'MarkerFaceColor','b','LineWidth',1)
        grid on
    end
    for i=1:6
        hold on
        plot3([toe(i,1);servo2(i,1)],[toe(i,2);servo2(i,2)],[toe(i,3);servo2(i,3)],'o-c','MarkerSize',3,'MarkerFaceColor','b','LineWidth',1)
        grid on
    end
    hold on
    p1 = plot3([bear(:,1);bear(1,1)],[bear(:,2);bear(1,2)],[bear(:,3);bear(1,3)],'--k','LineWidth',1,'DisplayName','Duong tru');
    hold on
    p3 = plot3(centerx(1,1),centerx(1,2),centerx(1,3),'v','MarkerSize',7,'MarkerFaceColor','c','DisplayName','Trong tam');
    legend([p1,p3]);
    axis([5 15 5 30 0 2]);
    set(gca, 'DataAspectRatio',[1 1 1])
    pause(.0001);
    hold off
end
%% Step 2
center = center+[0 0.2];
    
for i=1:6 
        servo1(i,:) = [radius*base(i,:)+center h];
    end
    centerservo1 = servo1(:,1:2);

    for i=1:6
        servo2(i,:) = [length1*base(i,:)+centerservo1(i,:) h];
    end

    for i=1:6
        toe(i,:) = [servo2(i,1:2) servo2(i,3)-length2];
    end
    %% Tinh tru
    bear = [];
    for i=1:6
        if (toe(i,3)==0)
            bear = [bear; toe(i,:)];
        end
    end
    %% Tinh trong tam
    centerx = [0 0 0];
    for i=1:6
        for j=1:3
            centerx(1,j) = centerx(1,j)+servo1(i,j)*mbase/6+servo2(i,j)*mleg/2+toe(i,j)*mleg/2;
        end
    end
    centerx = centerx/(mbase+mleg*6);
    %% Ve
    
    plot3([servo1(:,1);servo1(1,1)],[servo1(:,2);servo1(1,2)],[servo1(:,3);servo1(1,3)],'o-','MarkerSize',3,'MarkerFaceColor','r','LineWidth',1)
    hold on
    plot3(center(1,1),center(1,2),h,'*','MarkerSize',7,'MarkerFaceColor','b')

    for i=1:6
        hold on
        plot3([servo1(i,1);servo2(i,1)],[servo1(i,2);servo2(i,2)],[servo1(i,3);servo2(i,3)],'o-r','MarkerSize',3,'MarkerFaceColor','b','LineWidth',1)
        grid on
    end
    for i=1:6
        hold on
        plot3([toe(i,1);servo2(i,1)],[toe(i,2);servo2(i,2)],[toe(i,3);servo2(i,3)],'o-c','MarkerSize',3,'MarkerFaceColor','b','LineWidth',1)
        grid on
    end
    hold on
    p1 = plot3([bear(:,1);bear(1,1)],[bear(:,2);bear(1,2)],[bear(:,3);bear(1,3)],'--k','LineWidth',1,'DisplayName','Duong tru');
    hold on
    p3 = plot3(centerx(1,1),centerx(1,2),centerx(1,3),'v','MarkerSize',7,'MarkerFaceColor','c','DisplayName','Trong tam');
    legend([p1,p3]);
    axis([5 15 5 30 0 2]);
    set(gca, 'DataAspectRatio',[1 1 1])
    pause(.0001);
    hold off

end