-- Modifiers
KPhyper = {"cmd", "alt", "ctrl"}
KPhypershift = {"cmd", "alt", "ctrl", "shift"}

-- Spoons
hs.loadSpoon("HeadphoneAutoPause"):start()

-- Custom modules
local windowmgr = require "windowmgr"
local spotify = require "spotify"
local alttab = require "alttab"


-- Keybindings --
-- Spotify
hs.hotkey.bind(KPhypershift, "S", spotify.playing)
hs.hotkey.bind(KPhypershift, "D", spotify.next)
hs.hotkey.bind(KPhyper, "D", spotify.nextNotify)
hs.hotkey.bind(KPhypershift, "A", spotify.previous)
hs.hotkey.bind(KPhyper, "A", spotify.previousNotify)
hs.hotkey.bind(KPhypershift, "W", spotify.toggle)
--AltTab
hs.hotkey.bind(KPhypershift, "§", alttab.changeFocus)
hs.hotkey.bind(KPhyper, '§', alttab.switchDev)
hs.hotkey.bind(KPhyper, 'tab', alttab.switch)
-- Window manager
hs.hotkey.bind(KPhyper, "Left", windowmgr.snapLeft)
hs.hotkey.bind(KPhyper, "Right", windowmgr.snapRight)
hs.hotkey.bind(KPhyper, "Down", windowmgr.snapDown)
hs.hotkey.bind(KPhyper, "Up", windowmgr.snapUp)

hs.hotkey.bind(KPhypershift, "Left", windowmgr.nudgeLeft)
hs.hotkey.bind(KPhypershift, "Right", windowmgr.nudgeRight)
hs.hotkey.bind(KPhypershift, "Down", windowmgr.nudgeDown)
hs.hotkey.bind(KPhypershift, "Up", windowmgr.nudgeUp)

hs.hotkey.bind(KPhyper, "pageup", windowmgr.fullscreen)
hs.hotkey.bind(KPhyper, "pagedown", windowmgr.snapMiddle)
-- Reload
hs.hotkey.bind(KPhypershift, "R", hs.reload)

-- Anycomplete
local anycomplete = require "anycomplete/anycomplete"
anycomplete.registerDefaultBindings() -- Hyper - G


local configWatcher

-- Livereload on config
function reloadConfig(files)
    doReload = false
    for _,file in pairs(files) do
        if file:sub(-4) == ".lua" then
            doReload = true
        end
    end
    if doReload then
        configWatcher:stop()
        hs.reload()
    end
end

configWatcher = hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig)

-- Watchers
configWatcher:start()
