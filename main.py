"""
main
"""
from typing import Dict

from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root() -> Dict:
    return {"Hello": "World"}
