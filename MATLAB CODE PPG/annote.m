function annote(string,Heart_Rate)
    annotation('textbox',[0.65 0.10 0.30 0.40],'String',...
    {'\fontsize{45} Heart Rate',...
    [' \fontsize{85}' num2str(Heart_Rate),...
    '\fontsize{15} bpm'],...
    string},...
    'FontSize',16,...
    'FontName','Arial',...
    'HorizontalAlignment','Center',...
    'LineStyle','-',...
    'EdgeColor',[0 0 0],...
    'LineWidth',2,...
    'BackgroundColor',[0 0 0],...
    'Color',[0 1 0]);
end