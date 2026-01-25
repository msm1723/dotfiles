-- main.lua

require("yaziline"):setup({
	color = "#7E9CD8", -- waveBlue (primary accent)
	secondary_color = "#54546D", -- sumiInk4 (muted separator)
	default_files_color = "#727169", -- fujiGray
	selected_files_color = "#DCD7BA", -- fujiWhite
	yanked_files_color = "#98BB6C", -- autumnGreen
	cut_files_color = "#E46876", -- sakuraPink (less aggressive than red)

	separator_style = "angly", -- "angly" | "curvy" | "liney" | "empty"
	separator_open = "",
	separator_close = "",
	separator_open_thin = "",
	separator_close_thin = "",
	separator_head = "",
	separator_tail = "",

	select_symbol = "",
	yank_symbol = "󰆐",

	filename_max_length = 24, -- truncate when filename > 24
	filename_truncate_length = 6, -- leave 6 chars on both sides
	filename_truncate_separator = "...",
})

require("full-border"):setup()

require("folder-rules"):setup()

Status:children_add(function(self)
	local h = self._current.hovered
	if h and h.link_to then
		return " -> " .. tostring(h.link_to)
	else
		return ""
	end
end, 3300, Status.LEFT)

Status:children_add(function()
	local h = cx.active.current.hovered
	if h == nil or ya.target_family() ~= "unix" then
		return ""
	end

	return ui.Line({
		ui.Span(ya.user_name(h.cha.uid) or tostring(h.cha.uid)):fg("magenta"),
		":",
		ui.Span(ya.group_name(h.cha.gid) or tostring(h.cha.gid)):fg("magenta"),
		" ",
	})
end, 500, Status.RIGHT)

Header:children_add(function()
	if ya.target_family() ~= "unix" then
		return ""
	end
	return ui.Span(ya.user_name() .. "@" .. ya.host_name() .. ":"):fg("blue")
end, 500, Header.LEFT)
