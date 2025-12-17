"""Python translation of the Delphi calculator form.

This module mirrors the structure and logic from the Delphi `Unit1.pas` file
using Tkinter widgets. The naming and flow stay close to the original so the
code is easy to compare and maintain.
"""

import tkinter as tk
from tkinter import ttk


class CalculatorForm:
    """Replicates the TForm1 behavior from the Delphi project."""

    def __init__(self, master: tk.Tk) -> None:
        self.master = master
        self.master.title("Calculator")

        # State variables mimic the Delphi globals.
        self.first: float = 0.0
        self.second: float = 0.0
        self.current_operation: int = -1  # -1=equal/clear, 0=none, 1=+, 2=-, 3=*, 4=/

        # Screen output uses a StringVar so callbacks stay simple.
        self.screen_var = tk.StringVar(value="")
        self._build_layout()

    # UI construction -----------------------------------------------------
    def _build_layout(self) -> None:
        """Create the calculator layout with buttons similar to the Delphi form."""

        screen_entry = ttk.Entry(self.master, textvariable=self.screen_var, justify="right", font=("Segoe UI", 18))
        screen_entry.grid(row=0, column=0, columnspan=4, sticky="nsew", padx=5, pady=5)

        # Number buttons laid out like the original grid.
        numbers = [
            ("7", 1, 0), ("8", 1, 1), ("9", 1, 2),
            ("4", 2, 0), ("5", 2, 1), ("6", 2, 2),
            ("1", 3, 0), ("2", 3, 1), ("3", 3, 2),
            ("0", 4, 0),
        ]

        for label, row, col in numbers:
            ttk.Button(self.master, text=label, command=lambda value=label: self.number_button_click(value)).grid(
                row=row, column=col, sticky="nsew", padx=2, pady=2
            )

        # Operation buttons mirror the Delphi caption names.
        ttk.Button(self.master, text="+", command=self.plus_button_click).grid(row=1, column=3, sticky="nsew", padx=2, pady=2)
        ttk.Button(self.master, text="-", command=self.minus_button_click).grid(row=2, column=3, sticky="nsew", padx=2, pady=2)
        ttk.Button(self.master, text="*", command=self.mult_button_click).grid(row=3, column=3, sticky="nsew", padx=2, pady=2)
        ttk.Button(self.master, text="/", command=self.div_button_click).grid(row=4, column=3, sticky="nsew", padx=2, pady=2)

        ttk.Button(self.master, text="=", command=self.equals_button_click).grid(row=4, column=2, sticky="nsew", padx=2, pady=2)
        ttk.Button(self.master, text=".", command=self.decimal_button_click).grid(row=4, column=1, sticky="nsew", padx=2, pady=2)
        ttk.Button(self.master, text="+/-", command=self.sign_button_click).grid(row=5, column=0, sticky="nsew", padx=2, pady=2)
        ttk.Button(self.master, text="C", command=self.clear_button_click).grid(row=5, column=1, sticky="nsew", padx=2, pady=2)
        ttk.Button(self.master, text="⌫", command=self.back_button_click).grid(row=5, column=2, sticky="nsew", padx=2, pady=2)

        # Make the grid responsive.
        for col in range(4):
            self.master.columnconfigure(col, weight=1)
        for row in range(6):
            self.master.rowconfigure(row, weight=1)

    # Core logic ----------------------------------------------------------
    def _calculate(self) -> None:
        """Perform pending calculation mirroring the Delphi `calculate` procedure."""

        text_value = self.screen_var.get()
        if not text_value or text_value == "-":
            # Treat empty or lone minus as zero to avoid float errors.
            text_value = "0"

        if self.first != 0:
            self.second = float(text_value)

            if self.current_operation == 1:
                self.first = self.first + self.second
            elif self.current_operation == 2:
                self.first = self.first - self.second
            elif self.current_operation == 3:
                self.first = self.first * self.second
            elif self.current_operation == 4:
                self.first = self.first / self.second
        else:
            self.first = float(text_value)

    # Button callbacks ----------------------------------------------------
    def number_button_click(self, digit: str) -> None:
        if self.current_operation < 0:
            self.screen_var.set("")
            self.current_operation = 0

        self.screen_var.set(self.screen_var.get() + digit)

    def plus_button_click(self) -> None:
        self._calculate()
        self.current_operation = 1
        self.screen_var.set("")

    def minus_button_click(self) -> None:
        self._calculate()
        self.current_operation = 2
        self.screen_var.set("")

    def mult_button_click(self) -> None:
        self._calculate()
        self.current_operation = 3
        self.screen_var.set("")

    def div_button_click(self) -> None:
        self._calculate()
        self.current_operation = 4
        self.screen_var.set("")

    def equals_button_click(self) -> None:
        self._calculate()
        self.screen_var.set(str(self.first))
        self.first = 0
        self.second = 0
        self.current_operation = -1

    def clear_button_click(self) -> None:
        self.first = 0
        self.second = 0
        self.current_operation = -1
        self.screen_var.set("")

    def back_button_click(self) -> None:
        current_text = self.screen_var.get()
        self.screen_var.set(current_text[:-1])

    def sign_button_click(self) -> None:
        text = self.screen_var.get()
        if text.startswith("-"):
            self.screen_var.set(text[1:])
        else:
            self.screen_var.set("-" + text)

    def decimal_button_click(self) -> None:
        if self.current_operation < 0:
            self.screen_var.set("")
            self.current_operation = 0

        text = self.screen_var.get()
        if text == "":
            self.screen_var.set("0.")
        elif "." not in text:
            self.screen_var.set(text + ".")


__all__ = ["CalculatorForm"]
