import random
import json
import pickle
import numpy as np
import tensorflow as tf
import os

import nltk
from nltk.stem import WordNetLemmatizer

nltk.download('punkt')
nltk.download('wordnet')

lemmatizer = WordNetLemmatizer()

# List of JSON files to load
json_files = ['C:\\Users\\nhatt\\OneDrive\\Máy tính\\chat-bot-mcq\\chatbot\\intents.json']

words = []
classes = []
documents = []
ignore_letters = ['?', '!', '.', ',']

# Function to load and process each JSON file
def load_intents(json_files):
    for file in json_files:
        try:
            with open(file, 'r', encoding='utf-8') as json_data:
                intents = json.load(json_data)
                if 'intents' in intents:
                    for intent in intents['intents']:
                        for pattern in intent['patterns']:
                            word_list = nltk.word_tokenize(pattern)
                            words.extend(word_list)
                            documents.append((word_list, intent['tag']))
                            if intent['tag'] not in classes:
                                classes.append(intent['tag'])
                else:
                    print(f"File {file} does not contain 'intents' key.")
        except json.JSONDecodeError:
            print(f"File {file} is not a valid JSON file.")

# Load and process all JSON files
load_intents(json_files)

# Lemmatize and sort words
words = [lemmatizer.lemmatize(word.lower()) for word in words if word not in ignore_letters]
words = sorted(set(words))

# Sort classes
classes = sorted(set(classes))

# Save words and classes using pickle
pickle.dump(words, open('words.pkl', 'wb'))
pickle.dump(classes, open('classes.pkl', 'wb'))

# Create training data in batches to handle memory issues
batch_size = 1000 

def generate_training_data(documents, words, classes, batch_size):
    for i in range(0, len(documents), batch_size):
        batch_documents = documents[i:i + batch_size]
        training = []
        output_empty = [0] * len(classes)
        for document in batch_documents:
            bag = []
            word_patterns = document[0]
            word_patterns = [lemmatizer.lemmatize(word.lower()) for word in word_patterns]
            for word in words:
                bag.append(1) if word in word_patterns else bag.append(0)
            output_row = list(output_empty)
            output_row[classes.index(document[1])] = 1
            training.append(bag + output_row)
        random.shuffle(training)
        training = np.array(training)
        train_x = training[:, :len(words)]
        train_y = training[:, len(words):]
        yield train_x, train_y

# Build the model
model = tf.keras.Sequential()
model.add(tf.keras.layers.Dense(128, input_shape=(len(words),), activation='relu'))
model.add(tf.keras.layers.Dropout(0.5))
model.add(tf.keras.layers.Dense(64, activation='relu'))
model.add(tf.keras.layers.Dense(len(classes), activation='softmax'))

# Compile the model
sgd = tf.keras.optimizers.SGD(learning_rate=0.01, momentum=0.9, nesterov=True)
model.compile(loss='categorical_crossentropy', optimizer=sgd, metrics=['accuracy'])

# Train the model in batches
for train_x, train_y in generate_training_data(documents, words, classes, batch_size):
    model.fit(train_x, train_y, epochs=200, batch_size=5, verbose=1)

# Save the model
model.save('chatbotmodel.h5')
print("Training complete and model saved as chatbotmodel.h5")
