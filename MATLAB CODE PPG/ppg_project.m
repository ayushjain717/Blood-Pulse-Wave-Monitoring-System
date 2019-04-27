clear all
%% Input Parameters
T = 100;
passo = 1;
t=1;
x=0;

% % For testing the gui % %
j_max = 6;
signal = randn(j_max,1000);
%%%%%%%%%%%%%%%%%%%%%%%%%%%

% % While taking input from the arduino % %
% a = arduino('COM10', 'uno');
%%%%%%%%%%%%%%%%%%%%%%%%%%%

tic

%% Creating a new display
newFig = figure;
set(newFig,'name','Pulse Plethysmograph','numbertitle','off','color', 'k','menubar','none','toolbar','none') ;
suptitle({'\fontsize{30} \color{Yellow}Heart Rate Monitor - Pulse Plethysmograph'});

%% Display image of heart
subP1 = subplot(2,3,3); 
img = imread('normal_heart_rate.png');
imshow(img);

%% Creating a stop pushbutton
%toggle button to stop the simulation
stop = uicontrol('style','toggle','string','close','background','r');
set(stop,'style','pushbutton','string','close','callback','close(gcf)');

%% Reading the sensor input and plotting the plethysmogram
for j = 1:j_max
    for i = 1:100
        if get(stop,'value') == 1
            break;
        end

        % % While taking input from the arduino % %
        % b = readVoltage(a,'A1');
        %%%%%%%%%%%%%%%%%%%%%%%%%%
        
        % % For testing the gui % %
        b = signal(j,i);
        %%%%%%%%%%%%%%%%
        
        x = [x,b];
        pause(0.01);
        subplot(2,3,[1 2 4 5]);
        plot(x,'g');
        ax = gca;
        set(gca,'Color','black')
        ax.GridColor = 'y';
        ylim([0,4])

        %pay attention to this command %
        axis([T*fix(t/T),T+T*fix(t/T),-2,2]); 
        grid
        t=t+passo;
%         pause(0.01);
        drawnow;  
    end
    
%% Computing Heart Rate and displaying img and text
    pause(0.001)
    [pks, locs] = findpeaks(x);
    Heart_Rate = uint8(length(pks)*60/toc);
    
    if Heart_Rate < 60
        subP1 = subplot(2,3,3);
        clear img
        img = imread('low_heart_rate.png');
        imshow(img);
        annote('\fontsize{40} Low',Heart_Rate);
    elseif Heart_Rate > 100
        subP1 = subplot(2,3,3);
        clear img
        img = imread('high_heart_rate.png');
        imshow(img);
        annote('\fontsize{40} High',Heart_Rate);
    else
        subP1 = subplot(2,3,3);
        clear img
        img = imread('normal_heart_rate.png');
        imshow(img);
        annote('\fontsize{40} Normal',Heart_Rate);
    end
        
end

comment_box(Heart_Rate);