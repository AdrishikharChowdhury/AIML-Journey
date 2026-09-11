import os
from tkinter import *
from tkinter import PhotoImage as TkPhotoImage
from tkinter import messagebox

from PIL import Image, ImageTk


def handle_login(email_input, password_input):
    email = email_input.get()
    password = password_input.get()
    if email=="amiadrishikhar@gmail.com" and password=="1234":
        messagebox.showinfo("Yay","Login Successful")
    else:
        messagebox.showerror("Failed","Error 404, NOT FOUND")


BASE_DIR = os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__))))
ICON_PATH = os.path.join(BASE_DIR, "src", "assets", "favicon.ico")

PHOTO_PATH = os.path.join(BASE_DIR, "src", "assets", "logo.webp")


def main() -> None:
    root = Tk()

    root.title("Login Form")

    img = Image.open(ICON_PATH)

    pillow_icon = ImageTk.PhotoImage(img)
    icon: TkPhotoImage = pillow_icon  # type: ignore
    root.iconphoto(True, icon)

    root.geometry("350x500")

    root.configure(background="#0096DC")

    img = ImageTk.PhotoImage(Image.open(PHOTO_PATH).resize((120, 120)))
    img_label = Label(root, image=img)

    img_label.pack(pady=(50, 10))

    text_label = Label(root, text="FlipKart", fg="white", bg="#0096DC")
    text_label.pack()
    text_label.config(font=("verdana", 24))

    email_label = Label(root, text="Enter Email", fg="white", bg="#0096DC")
    email_label.pack(pady=(20, 5))
    email_label.config(font=("verdana", 12))

    email_input = Entry(root, width=50)
    email_input.pack(ipady=6, pady=(1, 15))

    password_label = Label(root, text="Enter Password", fg="white", bg="#0096DC")
    password_label.pack(pady=(20, 5))
    password_label.config(font=("verdana", 12))

    password_input = Entry(root, width=50)
    password_input.pack(ipady=6, pady=(1, 15))

    login_button = Button(
        root,
        text="Login Here",
        bg="white",
        fg="black",
        width=20,
        height=2,
        command=lambda: handle_login(email_input, password_input),
    )
    login_button.pack(pady=(10, 20))
    login_button.config(font=("verdana", 20))

    root.mainloop()
