import time
import curses

# Add an option to pattern match against lines
# For now, just removing this many chars from the beginning
CUT_OFF_THEIR_HEADS = 14

def get_tail_lines(filename, catch_up_N=15):
    '''
    Create a generator that yields any lines written to 'filename' since last yield

    If catch_up_N is a positive number, will yield that many lines from the end
    of the existing file.
    '''
    f = open(filename, "r")
    f.seek(0, 2) # Seek to end
    if catch_up_N:
        fsize = f.tell()
        f.seek(max(fsize - 2048, 0), 0) # Seek back a couple KB (hopefully enough)
        catch_up_lines = [l[CUT_OFF_THEIR_HEADS:] for l in f.readlines()]
        yield catch_up_lines[-catch_up_N:]

    while True:
        res = []
        line = f.readline()[CUT_OFF_THEIR_HEADS:]
        while line:
            res.append(line)
            line = f.readline()[CUT_OFF_THEIR_HEADS:]
        yield res

def get_tails(env, system, prefix=""):
    if system == "live-ingest":
        apps = [prefix + a for a in ["FileWatcher", "LiveIngest", "XMLtoICAT"]]

        if env == "local":
            log_root = "C:\\FBS\\Logs"
        elif env == "dev":
            log_root = r"\\icatdevingest\c$\FBS\Logs"
        elif env == "prod":
            log_root = r"\\icatliveingest\c$\FBS\Logs"

    elif system == "schedule":
        apps = ["SCHEDULE", "UserOffice"]

        if env == "local":
            log_root = r"C:/payara/domains/domain1/logs"
        elif env == "dev":
            print("todo, dev schedule")
            exit(1)
        elif env == "prod":
            print("todo, prod schedule")
            exit(1)
    return [(app, get_tail_lines(f"{log_root}\\{app}.log")) for app in apps]

tails = get_tails("local", "live-ingest", "Test")
h_height, f_height = 3, 3

def main(stdscr):
    curses.curs_set(0)
    stdscr.clear()
    stdscr.nodelay(True)
    scr_height, scr_width = stdscr.getmaxyx()

    # Setup a window for each tracked log, in vertical columns
    num_cols = len(tails)
    col_h_pad = 2
    col_width = (scr_width // num_cols - 1) - col_h_pad
    windows = []
    for i, (app, _) in enumerate(tails):
        x = i * (col_width + col_h_pad)
        stdscr.insstr(1, x, app) # Title in header
        win = curses.newwin(
            scr_height - h_height - f_height - 1,
            col_width,
            h_height,
            x)
        windows.append(win)
        win.scrollok(True)
    stdscr.insstr(scr_height - f_height + 1, 1, "q: quit")
    stdscr.refresh()

    while True:
        for i, (_, tail) in enumerate(tails):
            lines = next(tail)
            if lines:
                for line in lines:
                    windows[i].insertln()
                    windows[i].insstr(line)
            windows[i].refresh()
        time.sleep(0.01)
        try:
            k = stdscr.getkey()
            if k == "q": break
        except: pass # No key pressed


if __name__ == "__main__":
    curses.wrapper(main)
