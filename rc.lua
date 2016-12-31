-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
awful.rules = require("awful.rules")
local tyrannical = require("tyrannical")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
--require("volume")    --for volume widget
--require("keychains") --for keychains

--awful.util.spawn_with_shell("run_once compton --backend glx --paint-on-overlay --glx-no-stencil --vsync opengl-swc --unredir-if-possible")

-- {{{ Error handling
-- Check if awesome encountered an error during startup and fell back to
-- another config (This code will only ever execute for the fallback config)
if awesome.startup_errors then
    naughty.notify({ preset = naughty.config.presets.critical,
                     title = "Oops, there were errors during startup!",
                     text = awesome.startup_errors })
end

-- Handle runtime errors after startup
do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        -- Make sure we don't go into an endless error loop
        if in_error then return end
        in_error = true

        naughty.notify({ preset = naughty.config.presets.critical,
                         title = "Oops, an error happened!",
                         text = err })
        in_error = false
    end)
end
-- }}}

-- {{{ Variable definitions
-- Themes define colours, icons, font and wallpapers.
beautiful.init(awful.util.getdir("config") .. "/themes/niceandclean/theme.lua")

-- This is used later as the default terminal and editor to run.
terminal = "gnome-terminal --hide-menubar"
editor = os.getenv("EDITOR") or "vim"
editor_cmd = "xterm" .. " -e " .. editor

-- Default modkey.
-- Usually, Mod4 is the key with a logo between Control and Alt.
-- If you do not like this or do not have such a key,
-- I suggest you to remap Mod4 to another key using xmodmap or other tools.
-- However, you can use another modifier like Mod1, but it may interact with others.
modkey = "Mod4"

-- Table of layouts to cover with awful.layout.inc, order matters.
local layouts =
{
    awful.layout.suit.tile,
    awful.layout.suit.tile.left,
    awful.layout.suit.tile.bottom,
    awful.layout.suit.tile.top,
    awful.layout.suit.floating,
    awful.layout.suit.fair,
    awful.layout.suit.fair.horizontal,
    awful.layout.suit.spiral,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.max,
    awful.layout.suit.max.fullscreen,
    awful.layout.suit.magnifier
}
-- }}}

-- {{{ Wallpape
if beautiful.wallpaper then
    for s = 1, screen.count() do
        gears.wallpaper.maximized(beautiful.wallpaper, s, true)
    end
end
-- }}}

-- old tags
-- {{{ Tags
-- Define a tag table which will hold all screen tags.
--    tags = {
    --names  =  
--	{ 1, 2, 3, 4, 5, 6}
    --},
    --layout = {
    --{ layouts[1], layouts[1], layouts[10], layouts[1],
    --	layouts[1],layouts[1] },
--	names  = { "☰", "☱", "☲", "☳", "☴", "☵"}, 
		 --{ "⚀", "⚁", "⚂", "⚃", "⚄", "⚅"},--},
--	layout = {{ layouts[1], layouts[1], layouts[10], 
--		    layouts[1], layouts[1], layouts[1] },
--		  { layouts[3], layouts[3], layouts[4], 
--		    layouts[3], layouts[3], layouts[3] }}
--    }
--    for s = 1, screen.count() do
    -- Each screen has its own tag table.
--	tags[s] = awful.tag(tags.names, s, tags.layout[s])
--    end
-- }}}

-- First, set some settings
tyrannical.settings.default_layout =  awful.layout.suit.tile
tyrannical.settings.mwfact = 0.5
tyrannical.settings.block_children_focus_stealing = true --Block popups ()
tyrannical.settings.group_children = true --Force popups/dialogs to have the same tags as the parent client

--tagn = {{ "☰", "☱", "☲", "☳", "☴", "☵"}, { "⚀", "⚁", "⚂", "⚃", "⚄", "⚅"}}
tagn = {{ "☰", "☱", "☲", "☳", "☴", "☵", "☶", "☷"}, 
	{ "╠", "╤", "═", "╩", "╬", "╩", "═", "╤", "╣"}}

--tyrannical tags
tyrannical.tags = {
---------
-- Own --
-- --- --
    {
        name        = tagn[1][1],
      --icon        = "~net.png", -- Use this icon for the tag (uncomment with a real path)
        init        = true,
        exclusive   = false,
        screen      = 1,
	force_screen= true,
	layout      = awful.layout.suit.tile,
	fallback    = true,
        --class       = {"",}
    } ,
    {
        name        = tagn[1][2],
        init        = true,
        exclusive   = false,
        screen      = 1,
	force_screen= true,
	layout      = awful.layout.suit.tile,
        exec_once   = {"firefox"}, --When accessed for the first time, execute this command
        --class       = {"firefox",}
    } ,
    {
        name        = tagn[1][3],
        init        = true,
        exclusive   = false,
        screen      = 1,
	force_screen= true,
	layout      = awful.layout.suit.tile,
        --exec_once   = {""}, 
        class       = { "Chromium", }
    } ,
    {
        name        = tagn[1][4],
        init        = true,
        exclusive   = false,
        screen      = 1,
	force_screen= true,
	layout      = awful.layout.suit.tile,
    } ,
    {
        name        = tagn[1][5], 
        init        = true,
        exclusive   = false,
        screen      = 1,
	force_screen= true,
	layout      = awful.layout.suit.tile,
    } ,
    {
        name        = tagn[1][6],
        init        = true,
        exclusive   = false,
        screen      = 1,
	force_screen= true,
	layout      = awful.layout.suit.tile,
    } ,
    {
        name        = tagn[1][7],
        init        = true,
        exclusive   = false,
        screen      = 1,
	force_screen= true,
	layout      = awful.layout.suit.tile,
    } ,
    {
        name        = tagn[1][8],
        init        = true,
        exclusive   = false,
        screen      = 1,
	force_screen= true,
	layout      = awful.layout.suit.tile,
    } ,
    {
        name        = tagn[2][1],
        init        = true,
        exclusive   = false,
        screen      = 2,
	force_screen= true,
	layout      = awful.layout.suit.tile.bottom,
        exec_once   = {"Opera"}, 
        class       = { "Opera", }
    } ,
    {
        name        = tagn[2][2],
        init        = true,
        exclusive   = true,
        screen      = 2,
	force_screen= true,
	layout      = awful.layout.suit.tile.bottom,
        class       = { "Thunderbird", }
    } ,
    {
        name        = tagn[2][3],
        init        = true,
        exclusive   = false,
        screen      = 2,
	force_screen= true,
        exec_once   = {"gnome-terminal -e weechat"}, 
	layout      = awful.layout.suit.tile.bottom,
    } ,
    {
        name        = tagn[2][4],
        init        = true,
        exclusive   = false,
        screen      = 2,
	force_screen= true,
	layout      = awful.layout.suit.tile.bottom,
        exec_once   = {"audacious"}, 
    } ,
    {
        name        = tagn[2][5],
        init        = true,
        exclusive   = false,
        screen      = 2,
	force_screen= true,
	layout      = awful.layout.suit.tile.bottom,
    } ,
    {
        name        = tagn[2][6],
        init        = true,
        exclusive   = false,
        screen      = 2,
	force_screen= true,
	layout      = awful.layout.suit.tile.bottom,
    } ,
    {
        name        = tagn[2][7],
        init        = true,
        exclusive   = false,
        screen      = 2,
	force_screen= true,
	layout      = awful.layout.suit.tile.bottom,
    } ,
    {
        name        = tagn[2][8],
        init        = true,
        exclusive   = false,
        screen      = 2,
	force_screen= true,
	layout      = awful.layout.suit.tile.bottom,
    } ,
    {
        name        = tagn[2][9],
        init        = true,
        exclusive   = false,
        screen      = 2,
	force_screen= true,
	layout      = awful.layout.suit.tile.bottom,
    } ,
}

-- Ignore the tag "exclusive" property for the following clients (matched by classes)
tyrannical.properties.intrusive = {
    "Gnome-terminal" , "firefox", "Thunar" 
}

-- Ignore the tiled layout for the matching clients
tyrannical.properties.floating = {
    "MPlayer"
}

-- Make the matching clients (by classes) on top of the default layout
tyrannical.properties.ontop = {
    "Xephyr"
}

-- Force the matching clients (by classes) to be centered on the screen on init
tyrannical.properties.centered = {
    "kcalc"
}

tyrannical.properties.size_hints_honor = { xterm = false, URxvt = false}

-- {{{ Menu
-- Create a laucher widget and a main menu
myawesomemenu = {
   { "manual", "xterm" .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", function () myquit("quit") end}--awesome.quit }
}

shutdownmenu= {
	{ "Suspend", "systemctl suspend" },
	{ "Return to TTY", function () myquit("quit") end},--awesome.quit },
	{ "Reboot", function () myquit("reboot") end},--"reboot"},
	{ "Shutdown", function () myquit("shutdown") end}--"shutdown -P now"}
}

mymainmenu = awful.menu({ items = { { "awesome", myawesomemenu, beautiful.awesome_icon },
                                    { "thunar", "thunar"},
                                    { "Logout", shutdownmenu }
                                  }
                        })

mylauncher = awful.widget.launcher({ image = beautiful.awesome_icon,
                                     menu = mymainmenu })

-- Menubar configuration
menubar.utils.terminal = terminal -- Set the terminal for applications that require it
-- }}}

-- {{{ Wibox
-- Create a textclock widget
mytextclock = awful.widget.textclock()
local orglendar = require('orglendar')
orglendar.files = { "~/Dokumente/Notes/work.org",    -- Specify here all files you want to be parsed, separated by comma.
                  "~/Dokumente/stuff/home.org" }
orglendar.register(mytextclock)

-- Create a wibox for each screen and add it
mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
                    awful.button({ }, 1, awful.tag.viewonly),
                    awful.button({ modkey }, 1, awful.client.movetotag),
                    awful.button({ }, 3, awful.tag.viewtoggle),
                    awful.button({ modkey }, 3, awful.client.toggletag),
                    awful.button({ }, 4, function(t) awful.tag.viewnext(awful.tag.getscreen(t)) end),
                    awful.button({ }, 5, function(t) awful.tag.viewprev(awful.tag.getscreen(t)) end)
                    )
mytasklist = {}
mytasklist.buttons = awful.util.table.join(
                     awful.button({ }, 1, function (c)
                                              if c == client.focus then
                                                  c.minimized = true
                                              else
                                                  -- Without this, the following
                                                  -- :isvisible() makes no sense
                                                  c.minimized = false
                                                  if not c:isvisible() then
                                                      awful.tag.viewonly(c:tags()[1])
                                                  end
                                                  -- This will also un-minimize
                                                  -- the client, if needed
                                                  client.focus = c
                                                  c:raise()
                                              end
                                          end),
                     awful.button({ }, 3, function ()
                                              if instance then
                                                  instance:hide()
                                                  instance = nil
                                              else
                                                  instance = awful.menu.clients({
                                                      theme = { width = 250 }
                                                  })
                                              end
                                          end),
                     awful.button({ }, 4, function ()
                                              awful.client.focus.byidx(1)
                                              if client.focus then client.focus:raise() end
                                          end),
                     awful.button({ }, 5, function ()
                                              awful.client.focus.byidx(-1)
                                              if client.focus then client.focus:raise() end
                                          end))

for s = 1, screen.count() do
    -- Create a promptbox for each screen
    mypromptbox[s] = awful.widget.prompt()
    -- Create an imagebox widget which will contains an icon indicating which layout we're using.
    -- We need one layoutbox per screen.
    mylayoutbox[s] = awful.widget.layoutbox(s)
    mylayoutbox[s]:buttons(awful.util.table.join(
                           awful.button({ }, 1, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 3, function () awful.layout.inc(layouts, -1) end),
                           awful.button({ }, 4, function () awful.layout.inc(layouts, 1) end),
                           awful.button({ }, 5, function () awful.layout.inc(layouts, -1) end)))
    -- Create a taglist widget
    mytaglist[s] = awful.widget.taglist(s, awful.widget.taglist.filter.all, mytaglist.buttons)

    -- Create a tasklist widget
    mytasklist[s] = awful.widget.tasklist(s, awful.widget.tasklist.filter.currenttags, mytasklist.buttons)

    -- Create the wibox
    mywibox[s] = awful.wibox({ position = "top", screen = s })
    mywibox[s].widgets ={
       -- volume_widget,
    }
    -- Widgets that are aligned to the left
    local left_layout = wibox.layout.fixed.horizontal()
    left_layout:add(mylauncher)
    left_layout:add(mytaglist[s])
    left_layout:add(mypromptbox[s])

    -- Widgets that are aligned to the right
    local right_layout = wibox.layout.fixed.horizontal()
    if s == 1 then right_layout:add(wibox.widget.systray()) end
    --right_layout:add(volume_widget)
    right_layout:add(mytextclock)
    right_layout:add(mylayoutbox[s])

    -- Now bring it all together (with the tasklist in the middle)
    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_middle(mytasklist[s])
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end
-- }}}

-- {{{ Mouse bindings
root.buttons(awful.util.table.join(
    awful.button({ }, 3, function () mymainmenu:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
    awful.key({ modkey,           }, "Left",   awful.tag.viewprev       ),
    awful.key({ modkey,           }, "Right",  awful.tag.viewnext       ),
    awful.key({ modkey,           }, "Escape", awful.tag.history.restore),

    awful.key({ modkey,           }, "j",
        function ()
            awful.client.focus.byidx( 1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "k",
        function ()
            awful.client.focus.byidx(-1)
            if client.focus then client.focus:raise() end
        end),
    awful.key({ modkey,           }, "w", function () mymainmenu:show() end),

    -- Layout manipulation
    awful.key({ modkey, "Shift"   }, "j", function () awful.client.swap.byidx(  1)    end),
    awful.key({ modkey, "Shift"   }, "k", function () awful.client.swap.byidx( -1)    end),
    awful.key({ modkey, "Control" }, "j", function () awful.screen.focus_relative( 1) end),
    awful.key({ modkey, "Control" }, "k", function () awful.screen.focus_relative(-1) end),
    awful.key({ modkey,           }, "u", awful.client.urgent.jumpto),
    awful.key({ modkey,           }, "Tab",
        function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end),

    -- Standard program
    awful.key({ modkey,           }, "Return", function () awful.util.spawn(terminal) end),
    --awful.key({ modkey, "Control" }, "r", awesome.restart),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit),

    awful.key({ modkey,           }, "l",     function () awful.tag.incmwfact( 0.05)    end),
    awful.key({ modkey,           }, "h",     function () awful.tag.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift","Control"     }, "l",     function () awful.client.incmwfact( 0.05)    end),
    awful.key({ modkey, "Shift","Control"     }, "h",     function () awful.client.incmwfact(-0.05)    end),
    awful.key({ modkey, "Shift"   }, "h",     function () awful.tag.incnmaster( 1)      end),
    awful.key({ modkey, "Shift"   }, "l",     function () awful.tag.incnmaster(-1)      end),
    awful.key({ modkey, "Control" }, "h",     function () awful.tag.incncol( 1)         end),
    awful.key({ modkey, "Control" }, "l",     function () awful.tag.incncol(-1)         end),
    awful.key({ modkey,           }, "space", function () awful.layout.inc(layouts,  1) end),
    awful.key({ modkey, "Shift"   }, "space", function () awful.layout.inc(layouts, -1) end),

    awful.key({ modkey, "Control" }, "n", awful.client.restore),

    -- Prompt
    --awful.key({ modkey },            "r",     function () mypromptbox[mouse.screen]:run() end),
    awful.key({ modkey },            "r",     function ()
	awful.util.spawn("dmenu_run -i -p 'Run command:' -nb '" .. 
	beautiful.bg_normal .. "' -nf '" .. beautiful.fg_normal .. 
	"' -sb '" .. beautiful.bg_focus .. 
	"' -sf '" .. beautiful.fg_focus .. "'") 
	end),

    awful.key({ modkey }, "x",
              function ()
                  awful.prompt.run({ prompt = "Run Lua code: " },
                  mypromptbox[mouse.screen].widget,
                  awful.util.eval, nil,
                  awful.util.getdir("cache") .. "/history_eval")
              end),
    -- Menubar
    awful.key({ modkey }, "p", function() menubar.show() end)
)

clientkeys = awful.util.table.join(
    awful.key({ modkey,           }, "f",      function (c) c.fullscreen = not c.fullscreen  end),
    awful.key({ modkey, "Shift"   }, "c",      function (c) c:kill()                         end),
    awful.key({ modkey, "Control" }, "space",  awful.client.floating.toggle                     ),
    awful.key({ modkey, "Control" }, "Return", function (c) c:swap(awful.client.getmaster()) end),
    awful.key({ modkey,           }, "o",      awful.client.movetoscreen                        ),
    awful.key({ modkey,           }, "t",      function (c) c.ontop = not c.ontop            end),
    awful.key({ modkey,           }, "n",
        function (c)
            -- The client currently has the input focus, so it cannot be
            -- minimized, since minimized clients can't have the focus.
            c.minimized = true
        end),
    awful.key({ modkey,           }, "m",
        function (c)
            c.maximized_horizontal = not c.maximized_horizontal
            c.maximized_vertical   = not c.maximized_vertical
        end),
    awful.key({ }, "XF86AudioRaiseVolume", function ()
       awful.util.spawn("amixer set Master 9%+") end),
    awful.key({ }, "XF86AudioLowerVolume", function ()
       awful.util.spawn("amixer set Master 9%-") end),
    awful.key({ }, "XF86AudioMute", function ()
       awful.util.spawn("amixer sset Master toggle") end),
   awful.key({ modkey, }, "a", function()
      awful.util.spawn("setxkbmap de") end),
   awful.key({ modkey, }, "d", function()
      awful.util.spawn("setxkbmap de neo -option") end)
)

-- Bind all key numbers to tags.
-- Be careful: we use keycodes to make it works on any keyboard layout.
-- This should map on the top row of your keyboard, usually 1 to 9.
for i = 1, 9 do
    globalkeys = awful.util.table.join(globalkeys,
        -- View tag only.
        awful.key({ modkey }, "#" .. i + 9,
                  function ()
                        local screen = mouse.screen
                        local tag = awful.tag.gettags(screen)[i]
                        if tag then
                           awful.tag.viewonly(tag)
                        end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control" }, "#" .. i + 9,
                  function ()
                      local screen = mouse.screen
                      local tag = awful.tag.gettags(screen)[i]
                      if tag then
                         awful.tag.viewtoggle(tag)
                      end
                  end),
        -- Move client to tag.
        awful.key({ modkey, "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.movetotag(tag)
                          end
                     end
                  end),
        -- Toggle tag.
        awful.key({ modkey, "Control", "Shift" }, "#" .. i + 9,
                  function ()
                      if client.focus then
                          local tag = awful.tag.gettags(client.focus.screen)[i]
                          if tag then
                              awful.client.toggletag(tag)
                          end
                      end
                  end))
end

clientbuttons = awful.util.table.join(
    awful.button({ }, 1, function (c) client.focus = c; c:raise() end),
    awful.button({ modkey }, 1, awful.mouse.client.move),
    awful.button({ modkey }, 3, awful.mouse.client.resize))

-- Set keys
root.keys(globalkeys) --keychains.init does this!
-- }}}

--keychains.init(globalkeys)

--keychains.add({winkey},"c","Web pages", desired_icon, {
--       g   =   {
--           func    =   function()
--               open_url("https://mail.google.com/mail/u/0/#search/l%3Aunread")
--           end,
--           info    =   "Gmail - unread emails"
--       },
--       a   =   {
--           func    =   function()
--               open_url("http://awesome.naquadah.org/")
--           end,
--           info    =   "awesome web page"
--       },
--      w   =   {
--           func    =   function()
--               open_url("http://awesome.naquadah.org/wiki/Main_Page")
--           end,
--           info    =   "awesome wiki"
--       }
--})

--keychains.start(5)  --popup will disapear after 5 secs



-- {{{ Rules
-- Rules to apply to new clients (through the "manage" signal).
awful.rules.rules = {
    -- All clients will match this rule.
    { rule = { },
      properties = { border_width = beautiful.border_width,
                     border_color = beautiful.border_normal,
                     focus = awful.client.focus.filter,
                     raise = true,
                     keys = clientkeys,
                     buttons = clientbuttons } },
    --{ rule = { class = "Gimp" },
    --  properties = { floating = true } },
    -- Set Firefox to always map on tags number 2 of screen 1.
--    { rule = { class = "Firefox" },
--      properties = { tag = tags[1][2] } },
--    { rule = { class = "Opera" },
--      properties = { tag = tags[2][1] } },
--    { rule = { class = "Audacious" },
--      properties = { tag = tags[2][4] } },
--    { rule = { class = "Pidgin" },
--      properties = { tag = tags[2][3] } },
--    { rule = { class = "Conky" },
--      properties = { border_width = 0 } },
--    { rule = { class = "Thunderbird" },
--      properties = { tag = tags[2][2] } },
--    { rule = { class = "Chromium" },
--      properties = { tag = tags[1][3] } },
--    { rule = { class = "Anki" },
--      properties = { tag = tags[1][6] } },
--    { rule = { class = "Atom Shell" },
--      properties = { tag = tags[2][5] } },
    { rule = { name = "Pillars of Eternity" },
      properties = { border_width = 0, floating = true } },
    { rule = { name = "Euro Truck Simulator 2" },
      properties = { border_width = 0, floating = true } },
    { rule = { name = "Sid Meier's Civilization V" },
      properties = { border_width = 0} },
    { rule = { class = "Wine" },
      properties = { border_width = 0, floating = true } },
    { rule = { class = "VirtualBox" },
      properties = { border_with = 0, floating = true } },
    { rule = { class = "Lightworks" },
      properties = { border_with = 0, floating = true } },
}
-- }}}

-- {{{ Signals
-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c, startup)
    -- Enable sloppy focus
    c:connect_signal("mouse::enter", function(c)
        if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
            client.focus = c
        end
    end)

    if not startup then
        -- Set the windows at the slave,
        -- i.e. put it at the end of others instead of setting it master.
        -- awful.client.setslave(c)

        -- Put windows in a smart way, only if they does not set an initial position.
        if not c.size_hints.user_position and not c.size_hints.program_position then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
        end
    end

    local titlebars_enabled = false
    if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
        -- buttons for the titlebar
        local buttons = awful.util.table.join(
                awful.button({ }, 1, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.move(c)
                end),
                awful.button({ }, 3, function()
                    client.focus = c
                    c:raise()
                    awful.mouse.client.resize(c)
                end)
                )

        -- Widgets that are aligned to the left
        local left_layout = wibox.layout.fixed.horizontal()
        left_layout:add(awful.titlebar.widget.iconwidget(c))
        left_layout:buttons(buttons)

        -- Widgets that are aligned to the right
        local right_layout = wibox.layout.fixed.horizontal()
        right_layout:add(awful.titlebar.widget.floatingbutton(c))
        right_layout:add(awful.titlebar.widget.maximizedbutton(c))
        right_layout:add(awful.titlebar.widget.stickybutton(c))
        right_layout:add(awful.titlebar.widget.ontopbutton(c))
        right_layout:add(awful.titlebar.widget.closebutton(c))

        -- The title goes in the middle
        local middle_layout = wibox.layout.flex.horizontal()
        local title = awful.titlebar.widget.titlewidget(c)
        title:set_align("center")
        middle_layout:add(title)
        middle_layout:buttons(buttons)

        -- Now bring it all together
        local layout = wibox.layout.align.horizontal()
        layout:set_left(left_layout)
        layout:set_right(right_layout)
        layout:set_middle(middle_layout)

        awful.titlebar(c):set_widget(layout)
    end
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
-- }}}

---------------------
-- Autoclose script--
-- --------------- --
-- DOES NOT WORK! USER NEW QUITFUNCTION
--awesome.connect_signal("exit", function () awful.util.spawn("atexit.sh") end)
-- Function that handles all exit/behaviour
function myquit(mode)
    -- first do something on exit
    awful.util.spawn("atexit.sh")
    os.execute("sleep " .. tonumber(5))

    -- and than exit!
    if mode == "reboot" then
	awful.util.spawn_with_shell("reboot")
    elseif mode == "shutdown" then
	awful.util.spawn_with_shell("shutdown -P now")
    else
	awesome.quit()
    end
end

-----------------------
--OWN AUTOSTART SETION:
-----------------------
function spawn_once(command, class, tag)
    -- create move callback
    local callback
    callback = function(c)
    if c.class == class then
	if tag then
	    awful.client.movetotag(tag, c)
	end
	client.disconnect_signal("manage", callback)
    end
    end
    client.connect_signal("manage", callback)
    -- now check if not already running!
    local findme = command
    local firstspace = findme:find(" ")
    if firstspace then
	findme = findme:sub(0, firstspace-1)
    end
    -- finally run it
    awful.util.spawn_with_shell("pgrep -u $USER -x " .. findme .. " > /dev/null || (" .. command .. ")")
end
-----------------
-- Basic stuff --
-- ----------- --
awful.util.spawn_with_shell("run_once nm-applet")
awful.util.spawn_with_shell("run_once start-pulseaudio-x11")
--awful.util.spawn_with_shell("setxkbmap de neo -option")
awful.util.spawn_with_shell("run_once xbindkeys")
awful.util.spawn_with_shell("run_once dropboxd")
awful.util.spawn_with_shell("run_once owncloud")
--awful.util.spawn_with_shell("run_once cryptkeeper")
--awful.util.spawn_with_shell("run_once nogtk keepass")
awful.util.spawn_with_shell("run_once pasystray")

------------
-- Beauty --
-- ------ --
awful.util.spawn_with_shell("run_once conky -c ~/.config/awesome/themes/niceandclean/conky/nice-and-clean/conkydate")
awful.util.spawn_with_shell("run_once conky -c ~/.config/awesome/themes/niceandclean/conky/nice-and-clean/conkytime")
--awful.util.spawn_with_shell("run_once conky -c ~/.config/awesome/themes/niceandclean/conky/nice-and-clean/conkymin")
awful.util.spawn_with_shell("run_once conky -c ~/.config/awesome/themes/niceandclean/conky/nice-and-clean/conkystats")

----------------
-- Set Screen --
-- ---------- --
awful.util.spawn_with_shell("xset s off")
awful.util.spawn_with_shell("xset dpms 3600 3600 3600")
awful.util.spawn_with_shell("xset -dpms")
--Current version: 
awful.util.spawn_with_shell("xrandr --output DVI-I-1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal --output DVI-D-0 --mode 1920x1080 --pos 1920x-648 --rotate left")
awful.util.spawn_with_shell("nitrogen --restore")

--------------
-- Programs --
-- -------- --
spawn_once("opera","Opera")
spawn_once("chromium","Chromium")--,tagn[1][3])
spawn_once("thunderbird","Thunderbird")--,tagn[2][2])
