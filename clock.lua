local clock = {}

clock.startTime = 0

function clock.getTime()
    hs.alert.show(os.date("%b %d - %I:%M"))
end

function clock.toggleTimer()
    if clock.startTime == 0 then
        clock.startTime = hs.timer.secondsSinceEpoch()
        hs.alert.show("Timer Started")
    else
        local time = hs.timer.secondsSinceEpoch() - clock.startTime
        hs.alert.show(secondsToClock(time))
        clock.startTime = 0
    end
end

function secondsToClock(seconds)
    local seconds = tonumber(seconds)

    if seconds <= 0 then
        return "00:00:00";
    else
        hours = string.format("%02.f", math.floor(seconds/3600));
        mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)));
        secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60));
        return hours..":"..mins..":"..secs
    end
end

return clock
