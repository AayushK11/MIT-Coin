from os import sep
import pandas as pd

def get_data():
    return pd.read_csv("FlutctuationData.csv", sep="\t")

def dma_20(data):
    data["20SMA"] = data["Value"].rolling(20).mean()
    return data

def dma_50(data):
    data["50SMA"] = data["Value"].rolling(50).mean()
    return data

if __name__ == "__main__":
    data = get_data()
    data = dma_20(data)
    data = dma_50(data)
    data.dropna(inplace=True)
    data.reset_index(inplace=True)
    print(data)