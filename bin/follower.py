import time
import curses

def get_tail_lines(filename):
    f = open(filename, "r")
    f.seek(0, 2) # Seek to end

    while True:
        res = []
        line = f.readline()
        while line:
            res.append(line)
            line = f.readline()
        yield res

# These will be the real values for the ingest
#log_root = r"\\icatdevingest\c$\FBS\Logs"
#tails = [(app, get_tail_lines(f"{log_root}\\{app}.log")) for app in ["FileWatcher", "LiveIngest", "XMLtoICAT"]]
# But using busapps services as a test, as they are easier to cause to log
log_root = r"C:/payara/domains/domain1/logs"
apps = ["SCHEDULE", "UserOffice"]
tails = [(app, get_tail_lines(f"{log_root}\\{app}.log")) for app in apps]
h_height, f_height = 3, 3

def main(stdscr):
    curses.curs_set(0)
    stdscr.clear()
    stdscr.nodelay(True)
    scr_height, scr_width = stdscr.getmaxyx()

    # Setup a window for each tracked log, in vertical columns
    num_cols = len(tails)
    col_width = scr_width // num_cols - 1
    windows = []
    for i, (app, _) in enumerate(tails):
        x = i * col_width
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
