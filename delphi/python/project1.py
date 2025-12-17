"""Python entry point mirroring the Delphi `Project1.dpr` bootstrap."""

import tkinter as tk

from unit1 import CalculatorForm


def main() -> None:
    root = tk.Tk()
    # Create the form and start the Tkinter event loop.
    CalculatorForm(root)
    root.mainloop()


if __name__ == "__main__":
    main()
