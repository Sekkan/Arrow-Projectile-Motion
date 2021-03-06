 clear 
 close all
 
 %Sets up intial conditions
  Alpha= 2;                %Angle with the bow
  Vx = 45*cosd(Alpha);     %Horizontal velocity [m/s]          
  Vy = 45*sind(Alpha);     %Vertical velocity [m/s]
  V = sqrt(Vx^2 + Vy^2);   %Determines V by combining v of both axes 
  G = 9.80665;             %m/s^2 Acceleration due to Gravity       
  DC = 0.94;               %Drag coefficient
  Area = 0.00004;          %m^2 cross section area of an arrow
  Mass = 0.0227;           %Kg mass of an arrow
  x(1) = 0;                %intial x postion
  y(1) = 1.5;              %inital y postion
  xf(1) = 0;               %inital xf postion
  yf(1) = 0;               %intial yf postion
  AP = 1.3;                %kg/m^3 Air Density @ Sea  Level
  D = AP*DC*Area/2;        %constant needed for drag calculations created    
  t(1) = 0;                %sets intial time
  dt = 0.01;               %s set the intervals at which time will be evalutated
  i = 1;                   %sets counter/index
  
 alpha= 2;
               
 
 %Starts a loop for Projectile Motion with Drag    
    while min(y)>= 1.5;                                          
       t = t + dt;                                               
       i = i + 1;                                                
       xf(i) = xf(i-1)+ Vx.*dt;                                  
       AxD = - ( D / Mass ) * V * Vx;                            
       AyD = -G - ( D / Mass ) * V * Vy;                         
       Vx_new = Vx + AxD * dt;                                       
       Vy_new = Vy + AyD * dt;                                       
       x(i) = x(i-1) + Vx_new * dt + 0.5 * AxD * dt^2;               
       y(i) = y(i-1) + Vy_new * dt + 0.5 * AyD * dt^2;         
       Vx = Vx_new;
       Vy = Vy_new;
   end;

 plot(x,y,'b'), hold on;               %plots the Projectile Motion with Drag
 plot(xf,y,'r'), hold off;             %plots the Projectile Motion without Drag
 xlabel('Horizontal Distance (m)');    %labels the x axis "Horizontal Distance (m)"
 ylabel('Vertical Distance (m)');      %Labels the y axis "Vertical Distance (m)"
 title('Projectile Motion Paths');     %Gives a Title "Projectile Motion Paths"
 axis([0 15 0 5]); 
