local NUDGE_AMOUNT = 50

local windowmgr = {}

function getFrameAndMaxFromWindow(win, setDefaults)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  if setDefaults then
    f.x = max.x
    f.y = max.y
    f.w = max.w
    f.h = max.h
  end

  return f, max
end

function windowmgr.snapLeft()
  local win = hs.window.focusedWindow()
  local f, max = getFrameAndMaxFromWindow(win, true)

  f.w = max.w / 2
  win:setFrame(f)
end

function windowmgr.snapRight()
  local win = hs.window.focusedWindow()
  local f, max = getFrameAndMaxFromWindow(win, true)

  f.x = max.x + (max.w / 2)
  f.w = max.w / 2
  win:setFrame(f)
end

function windowmgr.snapDown()
  local win = hs.window.focusedWindow()
  local f, max = getFrameAndMaxFromWindow(win, true)

  f.y = max.y + (max.h / 2)
  f.h = max.h / 2
  win:setFrame(f)
end

function windowmgr.snapUp()
  local win = hs.window.focusedWindow()
  local f, max = getFrameAndMaxFromWindow(win, true)

  f.h = max.h / 2
  win:setFrame(f)
end

function windowmgr.fullscreen()
  local win = hs.window.focusedWindow()
  local f, max = getFrameAndMaxFromWindow(win, true)

  win:setFrame(f)
end

function windowmgr.snapMiddle()
  local win = hs.window.focusedWindow()
  local f, max = getFrameAndMaxFromWindow(win, true)

  local width = max.w / 1.5
  local height = max.h / 1.5

  f.x = max.x + ((max.w - width) / 2)
  f.y = max.y + ((max.h - height) / 2)
  f.w = width
  f.h = height
  win:setFrame(f)
end

function windowmgr.nudgeLeft()
  local win = hs.window.focusedWindow()
  local f, max = getFrameAndMaxFromWindow(win, false)

  f.x = f.x - NUDGE_AMOUNT
  win:setFrame(f)
end

function windowmgr.nudgeRight()
  local win = hs.window.focusedWindow()
  local f, max = getFrameAndMaxFromWindow(win, false)

  f.x = f.x + NUDGE_AMOUNT
  win:setFrame(f)
end

function windowmgr.nudgeUp()
  local win = hs.window.focusedWindow()
  local f, max = getFrameAndMaxFromWindow(win, false)

  f.y = f.y - NUDGE_AMOUNT
  win:setFrame(f)
end

function windowmgr.nudgeDown()
  local win = hs.window.focusedWindow()
  local f, max = getFrameAndMaxFromWindow(win, false)

  f.y = f.y + NUDGE_AMOUNT
  win:setFrame(f)
end

return windowmgr
