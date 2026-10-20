-- Two shortcodes for putting a playable game on a page:
--   {{< itch 1234567 >}}          itch.io HTML5 game (number from itch's "Embed game" button)
--   {{< unity play/index.html >}} Unity WebGL build sitting next to the page

local function player(src)
  return pandoc.RawBlock("html",
    '<div class="ratio ratio-16x9 my-4 shadow rounded overflow-hidden">' ..
    '<iframe src="' .. src .. '" allow="autoplay; fullscreen; gamepad" ' ..
    'allowfullscreen loading="lazy" style="border:0"></iframe></div>')
end

return {
  itch = function(args)
    local id = pandoc.utils.stringify(args[1])
    return player("https://itch.io/embed-upload/" .. id .. "?color=000000")
  end,
  unity = function(args)
    return player(pandoc.utils.stringify(args[1]))
  end,
}
