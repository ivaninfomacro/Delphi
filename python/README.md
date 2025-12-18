# Python translation of the Delphi calculator

This folder mirrors the Delphi VCL sample (`Project1.dpr` / `Unit1.pas`) using Tkinter.

## Structure
- `project1.py`: Entry point that builds the calculator window (analogous to `Project1.dpr`).
- `unit1.py`: Tkinter implementation of the form and all button handlers (analogous to `Unit1.pas`).
- `__main__.py`: Lets you run the package directly with `python -m python`.

## Run it
```bash
# from the repository root (the folder that contains both `delphi/` and `python/`)
python -m python.project1
# or simply
python -m python
```

If you see `No module named python` or `No module named python.__main__`, you are probably
inside the `delphi/` subfolder. Go up one level so the `python/` package is on the module
search path, then rerun the command. On Windows that usually looks like:

```cmd
cd ..
python -m python
```

Tkinter ships with the standard Python distribution on Windows and most Linux distros; no extra dependencies are required.
