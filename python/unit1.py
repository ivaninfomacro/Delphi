"""Python translation of the Delphi calculator form.

This module mirrors the structure and logic from the Delphi `Unit1.pas` file
using Tkinter widgets. The naming and flow stay close to the original so the
code is easy to compare and maintain.
"""

import tkinter as tk


class CalculatorForm:
    """Replicates the TForm1 behavior from the Delphi project."""

    def __init__(self, master: tk.Tk) -> None:
        self.master = master
        self.master.title("The Best Calculator Ever")
        self.master.geometry("336x492")
        self.master.resizable(False, False)

        # Match the Delphi look with bold Segoe UI styling.
        self.button_font = ("Segoe UI", 20, "bold")
        self.screen_font = ("Segoe UI", 20, "bold")

        # State variables mimic the Delphi globals.
        self.first: float = 0.0
        self.second: float = 0.0
        self.current_operation: int = -1  # -1=equal/clear, 0=none, 1=+, 2=-, 3=*, 4=/

        # Screen output uses a StringVar so callbacks stay simple.
        self.screen_var = tk.StringVar(value="")
        self._build_layout()

    # UI construction -----------------------------------------------------
    def _build_layout(self) -> None:
        """Create the calculator layout with buttons mirroring the Delphi form."""

        layout = tk.Frame(self.master)
        layout.grid(row=0, column=0, sticky="nsew")

        # Screen at the top spans all columns and uses a dark background like the DFM.
        screen_entry = tk.Entry(
            layout,
            textvariable=self.screen_var,
            justify="right",
            font=self.screen_font,
            bg="black",
            fg="white",
            insertbackground="white",
        )
        screen_entry.grid(row=0, column=0, columnspan=4, sticky="nsew", padx=8, pady=(8, 4), ipady=10)

        def add_button(text: str, row: int, column: int, command, columnspan: int = 1) -> None:
            tk.Button(layout, text=text, font=self.button_font, command=command).grid(
                row=row, column=column, columnspan=columnspan, sticky="nsew", padx=4, pady=4
            )

        # Top row: clear, backspace, divide.
        add_button("clear", 1, 0, self.clear_button_click, columnspan=2)
        add_button("⌫", 1, 2, self.back_button_click)
        add_button("/", 1, 3, self.div_button_click)

        # Number rows.
        add_button("7", 2, 0, lambda: self.number_button_click("7"))
        add_button("8", 2, 1, lambda: self.number_button_click("8"))
        add_button("9", 2, 2, lambda: self.number_button_click("9"))
        add_button("*", 2, 3, self.mult_button_click)

        add_button("4", 3, 0, lambda: self.number_button_click("4"))
        add_button("5", 3, 1, lambda: self.number_button_click("5"))
        add_button("6", 3, 2, lambda: self.number_button_click("6"))
        add_button("-", 3, 3, self.minus_button_click)

        add_button("1", 4, 0, lambda: self.number_button_click("1"))
        add_button("2", 4, 1, lambda: self.number_button_click("2"))
        add_button("3", 4, 2, lambda: self.number_button_click("3"))
        add_button("+", 4, 3, self.plus_button_click)

        add_button("±", 5, 0, self.sign_button_click)
        add_button("0", 5, 1, lambda: self.number_button_click("0"))
        add_button(".", 5, 2, self.decimal_button_click)
        add_button("=", 5, 3, self.equals_button_click)

        # Keep proportions close to the Delphi layout: four equal columns and rows.
        for col in range(4):
            layout.columnconfigure(col, minsize=80, weight=1)
        for row in range(1, 6):
            layout.rowconfigure(row, minsize=78, weight=1)

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
