# This is a sample Python script.

# Press ⌃R to execute it or replace it with your code.
# Press Double ⇧ to search everywhere for classes, files, tool windows, actions, and settings.


import tensorflow as tf
import time
import sys

def main():
    # Check if GPU is available
    if not tf.test.is_gpu_available():
        print("GPU is not available")
        return

    # Print GPU device name
    print("GPU Device Name:", tf.test.gpu_device_name())

    # Get the size of the matrix from command line argument
    if len(sys.argv) > 1:
        size = int(sys.argv[1])
    else:
        size = 5000  # Default size

    # Create two random matrices
    with tf.device('/GPU:0'):
        matrix_1 = tf.random.normal((size, size))
        matrix_2 = tf.random.normal((size, size))

        # Warmup run
        _ = tf.matmul(matrix_1, matrix_2)

        # Timed run
        start_time = time.time()
        result = tf.matmul(matrix_1, matrix_2)
        # Force execution to wait for result
        result.numpy()
        gpu_time = time.time() - start_time

    print(f"Matrix size: {size}x{size}")
    print(f"GPU time: {gpu_time:.4f} seconds")

if __name__ == "__main__":
    main()