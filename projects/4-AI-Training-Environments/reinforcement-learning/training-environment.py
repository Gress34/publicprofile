import numpy as np
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Dense

# Define the AI model for cloud infrastructure tasks
model = Sequential([
    Dense(64, activation='relu', input_shape=(10,)),
    Dense(64, activation='relu'),
    Dense(1, activation='linear')
])

model.compile(optimizer='adam', loss='mean_squared_error')

# Example training data (simplified for demonstration)
X_train = np.random.rand(1000, 10)
y_train = np.random.rand(1000, 1)

# Train the model
model.fit(X_train, y_train, epochs=10, batch_size=32)

# Example prediction
sample_input = np.random.rand(1, 10)
prediction = model.predict(sample_input)
print(f"Prediction: {prediction}")