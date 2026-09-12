import requests
from dotenv import load_dotenv
import os
from tkinter import *
from urllib.request import urlopen,Request
from PIL import Image,ImageTk
import io
from pathlib import Path
import webbrowser

load_dotenv()

BASE_DIR=Path(__file__).resolve().parents[1]
IMAGE_DIR=Path(BASE_DIR, "assets")

API_KEY=os.getenv("NEWS_API_KEY")
BASE_URL="https://newsapi.org/v2/top-headlines?country=us&apiKey="

class NewsApp:
    def __init__(self):
        try:
            self.data=requests.get(f"{BASE_URL}{API_KEY}").json()
            self.load_gui()
            self.idx=0
            self.load_news_item()
            self.root.mainloop()

        except requests.exceptions.RequestException as e:
            print(f"Error: {e}")
            return

    def load_gui(self):
        self.root=Tk()
        self.root.geometry("800x600")
        self.root.resizable(False, False)
        self.root.title("News App")
        self.root.configure(background="black")

    def clear_screen(self):
        for item in self.root.pack_slaves():
            item.destroy()

    def handle_next(self):
        self.idx=(self.idx+1)%len(self.data["articles"])
        self.load_news_item()

    def handle_previous(self):
        self.idx=(self.idx-1)%len(self.data["articles"])
        self.load_news_item()

    def handle_read_more(self,url):
        webbrowser.open(url)

    def load_news_item(self):
        self.clear_screen()

        try:
            heading=Label(self.root,text=self.data["articles"][self.idx]["title"],bg="black",fg="white",wraplength=750)
            heading.pack(pady=(10,20))
            heading.config(font=("Helvetica", 24))

            image_url=self.data["articles"][self.idx]["urlToImage"]
            req = Request(image_url, headers={"User-Agent": "Mozilla/5.0"})
            raw_data = urlopen(req).read()
            img=Image.open(io.BytesIO(raw_data)).resize((800,400))
            self.img_obj=ImageTk.PhotoImage(img)

            img_label=Label(self.root,image=self.img_obj)
            img_label.pack(pady=(10,20))


            content=Label(self.root,text=self.data["articles"][self.idx]["description"],bg="black",fg="white",wraplength=750)
            content.pack(pady=(10,20))
        except Exception as e:
            err_img=Image.open(os.path.join(IMAGE_DIR,"error.webp"))
            err_img=err_img.resize((800,400))
            self.err_img_obj=ImageTk.PhotoImage(err_img)
            img_label=Label(self.root,image=self.err_img_obj)
            img_label.pack(pady=(10,20))

            content=Label(self.root,text=f"Error: {e}",bg="black",fg="white",wraplength=750)
            content.pack(pady=(10,20))

        frame=Frame(self.root,bg="black")
        frame.pack(expand=True,anchor="center")

        width=25
        height=3

        prev_btn=Button(frame,text="Previous",bg="#00a65a",fg="white",width=width,height=height,command=self.handle_previous)
        prev_btn.pack(side=LEFT, padx=10)

        read_btn=Button(frame,text="Read More",bg="#00a65a",fg="white",width=width,height=height,command=lambda: self.handle_read_more(self.data["articles"][self.idx]["url"]))
        read_btn.pack(side=LEFT,padx=10)

        next_btn=Button(frame,text="Next",bg="#00a65a",fg="white",width=width,height=height,command=self.handle_next)
        next_btn.pack(side=LEFT,padx=10)

def main() -> None:
    news_app=NewsApp()
