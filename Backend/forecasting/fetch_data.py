import os
import warnings

warnings.filterwarnings("ignore")
os.environ["TF_CPP_MIN_LOG_LEVEL"] = "3"
import pandas as pd
from sklearn.preprocessing import MinMaxScaler
from sklearn.decomposition import PCA
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense, LSTM
from tensorflow.keras.callbacks import EarlyStopping
import numpy as np

pca = PCA(n_components=1)
scalerTable = MinMaxScaler(feature_range=(0, 1))
scalerClose = MinMaxScaler(feature_range=(0, 1))


def get_data():
    return pd.read_csv("forecasting\FlutctuationData.csv")


def dma_20(data):
    data["20SMA"] = data["Value"].rolling(20).mean()
    return data


def dma_50(data):
    data["50SMA"] = data["Value"].rolling(50).mean()
    return data


def next_data(data):
    data["Next"] = data["Value"].shift(-1)
    return data


def scale_data(data):
    data[list(data.columns)] = scalerTable.fit_transform(data[data.columns.tolist()])
    return pca.fit_transform(data)


def scale_output(data):
    data[list(data.columns)] = scalerClose.fit_transform(data[data.columns.tolist()])
    return pca.fit_transform(data)


def format_X(data):
    x_data = []
    for i in range(5, len(data)):
        x_data.append(data[i - 5 : i, 0])
    x_data = np.array(x_data)
    x_data = np.reshape(x_data, (x_data.shape[0], x_data.shape[1], 1))
    return x_data


def format_Y(data):
    return np.array(data[5:])


def model_main(X_data, Y_data):
    model = Sequential()
    model.add(LSTM(units=128, return_sequences=True))
    model.add(LSTM(units=64, return_sequences=True))
    model.add(LSTM(units=32, return_sequences=False))
    model.add(Dense(units=16))
    model.add(Dense(units=1))

    es = EarlyStopping(monitor="loss", mode="min", verbose=0, patience=10)
    model.compile(optimizer="adam", loss="mean_absolute_error")

    model.fit(X_data, Y_data, batch_size=32, epochs=500, verbose=0, callbacks=[es])

    return model


def predict(model, data_prev):
    return scalerClose.inverse_transform(model.predict(data_prev))[0][0]


def run_forecast():
    data = get_data()
    data = dma_20(data)
    data = dma_50(data)
    data = next_data(data)
    data.dropna(inplace=True)
    data.reset_index(inplace=True, drop=True)
    data_prev = format_X(scale_data(data.filter(["20SMA", "50SMA", "Value"])))
    data_next = format_Y(scale_output(data.filter(["Next"])))
    model = model_main(data_prev, data_next)
    model_json = model.to_json()
    with open("forecasting/model.json", "w") as json_file:
        json_file.write(model_json)
    model.save_weights("forecasting/model.h5")
    return predict(model, data_prev[-1])


# print(run_forecast())
