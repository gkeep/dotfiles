/* user and group to drop privileges to */
static const char *user  = "gkeep";
static const char *group = "wheel";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#a093c7",   /* after initialization */
	[INPUT] =  "#84a0c6",   /* during input */
	[FAILED] = "#e27878",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

/* time in seconds before the monitor shuts down */
static const int monitortime = 60;
