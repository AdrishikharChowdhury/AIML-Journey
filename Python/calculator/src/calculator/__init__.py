from tkinter import *

# Track the calculator state
first_num = None
operator = None
is_operator_clicked = False  # Flag to clear the screen when entering the second number

def get_digit(digit, result_label):
    global is_operator_clicked
    current = result_label['text']
    
    # If an operator was just clicked, clear the screen for the second number
    if is_operator_clicked:
        new = str(digit)
        is_operator_clicked = False
    else:
        # Prevent appending to a default empty or zero string improperly
        if current == "0" or current == "":
            new = str(digit)
        else:
            new = current + str(digit)
            
    result_label.config(text=new)

def clear(result_label):
    global first_num, operator, is_operator_clicked
    first_num = None
    operator = None
    is_operator_clicked = False
    result_label.config(text="0")

def get_op(op, result_label):
    global first_num, operator, is_operator_clicked
    
    # Store the first number from the screen
    first_num = result_label['text']
    operator = op
    is_operator_clicked = True  # Next digit pressed will clear the display

def calculate(result_label):
    global first_num, operator, is_operator_clicked

    if first_num is None or operator is None:
        return

    second_num = result_label['text']
    
    try:
        # Perform calculation
        result = eval(f"{first_num}{operator}{second_num}")
        
        # Format floats nicely (e.g., 5.0 -> 5)
        if isinstance(result, float) and result.is_integer():
            result = int(result)
            
        result_label.config(text=str(result))
    except ZeroDivisionError:
        result_label.config(text="Error")
    except Exception:
        result_label.config(text="Error")
        
    # Reset tracking variables for the next calculation
    first_num = None
    operator = None
    is_operator_clicked = False

def main() -> None:
    root = Tk()
    root.title("Calculator")
    root.geometry("280x430") # Slightly wider window to fit grid layout buttons comfortably
    root.resizable(0, 0)
    root.config(bg="black")

    # Display window config
    result_label = Label(root, text="0", bg="black", fg="white", anchor="e")
    result_label.grid(row=0, column=0, pady=(30, 15), padx=15, columnspan=4, sticky='w')
    result_label.config(font=("verdana", 30, 'bold'))

    # Button layout blueprint: (Text, Row, Column, Type)
    buttons = [
        ('7', 1, 0, 'digit'), ('8', 1, 1, 'digit'), ('9', 1, 2, 'digit'), ('+', 1, 3, 'op'),
        ('4', 2, 0, 'digit'), ('5', 2, 1, 'digit'), ('6', 2, 2, 'digit'), ('-', 2, 3, 'op'),
        ('1', 3, 0, 'digit'), ('2', 3, 1, 'digit'), ('3', 3, 2, 'digit'), ('*', 3, 3, 'op'),
        ('C', 4, 0, 'clear'), ('0', 4, 1, 'digit'), ('=', 4, 2, 'equal'), ('/', 4, 3, 'op')
    ]

    # Generate buttons inside a loop to keep code clean and maintainable
    for text, row, col, btn_type in buttons:
        if btn_type == 'digit':
            cmd = lambda t=text: get_digit(t, result_label)
        elif btn_type == 'op':
            cmd = lambda t=text: get_op(t, result_label)
        elif btn_type == 'clear':
            cmd = lambda: clear(result_label)
        elif btn_type == 'equal':
            cmd = lambda: calculate(result_label)

        # Use an elegant standard display layout mapping
        btn = Button(root, text=text if text != '*' else 'x', bg="#00a65a", fg='white', 
                     width=7, height=6, command=cmd, font=('verdana', 14))
        btn.grid(row=row, column=col)

    root.mainloop()

if __name__ == "__main__":
    main()
