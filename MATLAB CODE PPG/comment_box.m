function comment_box(Heart_Rate)
    if Heart_Rate < 40
        waitbar(0.05,'Your Heart Rate is Too Low','Name','Heart Rate Monitor');
    elseif Heart_Rate < 60
        waitbar(0.25,'Your Heart Rate is Low','Name','Heart Rate Monitor');
    elseif Heart_Rate > 130
        waitbar(0.95,'Your Heart Rate is Too High','Name','Heart Rate Monitor');
    elseif Heart_Rate > 100
        waitbar(0.75,'Your Heart Rate is High','Name','Heart Rate Monitor');
    else
        waitbar(0.5,'Your Heart Rate is Normal','Name','Heart Rate Monitor');
    end
end