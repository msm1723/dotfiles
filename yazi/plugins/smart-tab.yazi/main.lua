--- @sync entry
local function entry()
  local hovered = cx.active.current.hovered
  if hovered and hovered.cha.is_dir then
    ya.emit("cd", { hovered.url })
  else
    ya.emit("open", {})
  end
end

return { entry = entry }
