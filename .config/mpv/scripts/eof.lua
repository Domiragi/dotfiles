local mp = require 'mp'

-- Exit fullscreen when playback ends, if keep-open=yes

mp.observe_property("eof-reached", "bool", function(name, value)
    if value then
        local pause = mp.get_property_native("pause")
        if pause then
            local fullscreen = mp.get_property_native("fullscreen")
            if fullscreen then
                mp.set_property_native("fullscreen", false)
            end
        end
    end
end)

-- Rewind to the start of the video

mp.observe_property("eof-reached", "bool", function(name, value)
    if value then
        local pause = mp.get_property_native("pause")
        mp.add_timeout(0.01, function()
            mp.commandv('seek', 0, 'absolute')
            mp.command('set pause '..(pause and 'yes' or 'no'))
        end)
    end
end)