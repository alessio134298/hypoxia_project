import pandas as pd
import os
os.environ["TF_USE_LEGACY_KERAS"] = "1"
os.environ["KERAS_BACKEND"] = "tensorflow"
import numpy as np
import keras
import tensorflow as tf
print(keras.__version__)
from tensorflow.keras.models import Model
from tensorflow.keras.layers import Input, Dense, Concatenate, Dropout, BatchNormalization
from tensorflow.keras.optimizers import Adam
from sklearn.model_selection import train_test_split


# load data
data_WT = pd.read_csv('data_WT.csv')

X_rna = data_WT['mean_WT_RNA'].values.astype('float32').reshape(-1, 1)
X_chip = data_WT[['mean_WT_H3K27ac', 'mean_WT_H2BK120ac', 'mean_WT_H3K4me1']].values.astype('float32')
y_atac = data_WT['ATAC_SKUT1_averaged'].values.astype('float32').reshape(-1,1)

print(X_rna.shape, X_chip.shape, y_atac.shape)


# shape
n_rna = X_rna.shape[1]
n_chip = X_chip.shape[1]

# RNA branch
input_rna = Input(shape=(n_rna,), name='rna_input')
r = Dense(64, activation='relu')(input_rna)
r = BatchNormalization()(r)
r = Dropout(0.3)(r)
r = Dense(32, activation='relu')(r)

# ChIP branch
input_chip = Input(shape=(n_chip,), name='chip_input')
c = Dense(128, activation='relu')(input_chip)
c = BatchNormalization()(c)
c = Dropout(0.3)(c)
c = Dense(64, activation='relu')(c)

# Fuse branches
x = Concatenate()([r, c])
x = Dense(64, activation='relu')(x)
x = Dropout(0.2)(x)
output = Dense(1, activation='linear', name='atac_output')(x)

model = Model(inputs=[input_rna, input_chip], outputs=output)
model.compile(optimizer=Adam(1e-4), loss='mse', metrics=['mae'])
model.summary()


# split data
X_rna_train, X_rna_val, X_chip_train, X_chip_val, y_train, y_val = train_test_split(
    X_rna, X_chip, y_atac, test_size=0.2, random_state=42
)


# train model
history = model.fit(
    {'rna_input': X_rna_train, 'chip_input': X_chip_train},
    y_train,
    validation_data=(
        {'rna_input': X_rna_val, 'chip_input': X_chip_val},
        y_val
    ),
    batch_size=32,
    # batch_size=256,
    epochs=2,
    # epochs=50,
    verbose=1,
    callbacks=[tf.keras.callbacks.EarlyStopping(patience=10, restore_best_weights=True, monitor='val_loss')]
)

