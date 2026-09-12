import os
from pathlib import Path
from tkinter import *

from PIL import Image, ImageOps, ImageTk

current_file = Path(__file__).resolve()
BASE_DIR = current_file.parents[7]
WALLPAPERS_DIR = os.path.join(BASE_DIR, "Pictures/Wallpapers")
FIXED_WIDTH=640
idx=0

class PhotoViewer:
    def __init__(self, img_obj, width, height):
        self.img_obj = img_obj
        self.width = width
        self.height = height

def handle_next(img_arr,img_label):
    global idx
    idx = (idx + 1) % len(img_arr)
    img_label.config(image=img_arr[idx].img_obj, width=img_arr[idx].width, height=img_arr[idx].height)


def main() -> None:
    root = Tk()

    root.title("Wallpaper Viewer")

    root.geometry("250x400")
    root.configure(background="black")

    files = iter(os.listdir(WALLPAPERS_DIR))

    img_arr: list[PhotoViewer] = []
    for file in files:
        if file != "LICENSE" and file != "README.md" and file != ".git":
            img_obj = Image.open(os.path.join(WALLPAPERS_DIR, file))
            width, height = img_obj.size
            aspect_ratio =  height / width
            resized_height = int(FIXED_WIDTH * aspect_ratio)
            
            resized_img = ImageOps.fit(img_obj, (FIXED_WIDTH, resized_height))
            img = PhotoViewer(ImageTk.PhotoImage(resized_img), FIXED_WIDTH, resized_height)
            img_arr.append(img)
    
    img_label = Label(
        root,
        image=img_arr[idx].img_obj,
        width=img_arr[idx].width,
        height=img_arr[idx].height,
        anchor=CENTER,
    )
    img_label.pack(pady=(15, 10),expand=True)

    next_button=Button(root, text="Next", command=lambda: handle_next(img_arr, img_label))
    next_button.pack(pady=(0,10))
    root.mainloop()
