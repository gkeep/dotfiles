/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;     /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "DejaVuSansMono Nerd Font:size=10" };
static const char bg1[]             = "#161821";
static const char border1[]         = "#161821";
static const char fg1[]       	    = "#b2b4be";
static const char bg2[]        	    = "#363d52";
static const char *colors[][3]      = {
	/*               fg   bg    border   */
	[SchemeNorm] = { fg1, bg1,  border1 },
	[SchemeSel]  = { fg1, bg2,  fg1  },
};

/* tagging */
static const char *tags[] = { "", "", "", "", "", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Firefox",  NULL,       NULL,       1 << 1,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */

#include "fibonacci.c"
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[@]",      spiral },
	{ "TTT",      bstack },
	{ "===",      bstackhoriz },
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
 	{ "[\\]",     dwindle },
	{ NULL,	      NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", NULL };
static const char *termcmd[]  = { "st", NULL };
static const char *filebrowsercmd[] = { "st", "-e", "ranger", NULL };
static const char *webbrowser[] = { "firefox", NULL };
static const char *mutecmd[] = { "amixer", "-D", "pulse", "sset", "Master", "toggle", NULL };
static const char *volupcmd[] = { "amixer", "-D", "pulse", "sset", "Master", "2%-", NULL };
static const char *voldowncmd[] = { "amixer", "-D", "pulse", "sset", "Master", "2%+", NULL };
static const char *plpsmuscmd[] = { "playerctl", "play-pause", NULL };
static const char *stopmuscmd[] = { "playerctl", "stop", NULL };
static const char *nextsngcmd[] = { "playerctl", "next", NULL };
static const char *prevsngcmd[] = { "playerctl", "previous", NULL };
static const char *incbrghtcmd[] = { "light", "-A", "10", NULL };
static const char *decbrghtcmd[] = { "light", "-U", "10", NULL };
static const char *sysmonitorcmd[] = { "st", "-e", "gotop", NULL };
static const char *mpdplayercmd[] = { "st", "-e", "ncmpcpp", NULL };
static const char *dwmexitcmd[] = { "dwmexit", NULL };
static const char *screenshotcmd[] = { "flameshot", "gui", NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */

	/* media keys */
	{ 0,                       0x1008ff12,      spawn,          {.v = mutecmd } },
    	{ 0,                       0x1008ff11,      spawn,          {.v = volupcmd } },
    	{ 0,                       0x1008ff13,      spawn,          {.v = voldowncmd } },
	{ 0,                       0x1008ff02,      spawn,          {.v = incbrghtcmd } },
	{ 0,                       0x1008ff03,      spawn,          {.v = decbrghtcmd } },
	{ 0,                       0x1008ff14,      spawn,          {.v = plpsmuscmd } },
	{ 0,                       0x1008ff15,      spawn,          {.v = stopmuscmd } },
	{ 0,                       0x1008ff16,      spawn,          {.v = prevsngcmd } },
	{ 0,                       0x1008ff17,      spawn,          {.v = nextsngcmd } },
	
	/* shortcuts to launch programs */
	{ MODKEY,                       XK_F1,      spawn,          {.v = filebrowsercmd } },
	{ MODKEY,                       XK_F2,      spawn,          {.v = webbrowser } },
	{ MODKEY,                       XK_d,       spawn,          {.v = dmenucmd } },
	{ MODKEY,             		XK_Return,  spawn,          {.v = termcmd } },
	{ MODKEY,             		XK_grave,   spawn,          {.v = sysmonitorcmd } },
	{ MODKEY,             		XK_F3,      spawn,          {.v = mpdplayercmd  } },
	{ MODKEY|ShiftMask,		XK_0,	    spawn,	    {.v = dwmexitcmd} },
	{ MODKEY,			XK_Print,   spawn,	    {.v = screenshotcmd} },
	/* else */
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_u,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_q,      killclient,     {0} },
	{ MODKEY|ControlMask,		XK_comma,  cyclelayout,    {.i = -1 } },
	{ MODKEY|ControlMask,           XK_period, cyclelayout,    {.i = +1 } },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ControlMask,           XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_c,      quit,           {0} },
	{ MODKEY|ControlMask|ShiftMask, XK_c,      quit,           {1} },
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

