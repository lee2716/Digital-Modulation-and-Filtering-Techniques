# Digital Modulation and Filtering Techniques

This repository contains a series of exercises and activities focused on various digital signal processing and modulation techniques. The project includes implementations for filtering, modulation, and demodulation, as well as simulations for error performance in communication systems.

## Core Activities:

### Activity 1: Filtering Example Using a Finite Impulse Response (FIR) Filter
- **Generation of Sinusoidal Signals**: Creating and plotting sinusoidal waveforms.
- **Noise Generation**: Implementing noise generation techniques for signal analysis.
- **FIR Filter Architecture**: Designing and analyzing FIR filters, including low-pass and band-pass filters.
- **Filter Impulse and Frequency Response**: Exploring the filter’s impulse response and frequency characteristics.
- **Filtering Process**: Applying the FIR filter to signals and observing the filtered outputs.

### Activity 2: QAM Modulation and Demodulation
- **Signal Generation**: Creating sine wave signals for QAM modulation.
- **QAM Modulation**: Implementing Quadrature Amplitude Modulation (QAM) for transmitting data.
- **QAM Demodulation**: Demodulating received QAM signals and comparing the output with original data.
- **Effect of Offset**: Studying the impact of non-zero offsets (e.g., π/4 and π/2) on the modulation and demodulation processes.

### Activity 3: PAM Modulation
- **Root-Raised-Cosine Pulse Type**: Analyzing pulse shaping with different roll-off factors.
- **Rectangular Pulse Type**: Comparing signal behavior with different pulse shapes.

### Activity 4: L-ASK Modulator
- **L-ASK Transmitter**: Building a transmitter for L-ASK modulation.
- **Source and Symbols Generation**: Implementing Gray mapping and symbol generation.
- **Baseband PAM Signal Generation**: Creating the baseband signal for transmission.
- **L-ASK Modulation**: Using QAM modulation techniques to modulate L-ASK signals.
- **Signal Visualization**: Plotting the signal and its spectrum for analysis.

### Activity 5: 2-ASK System (Transmitter and Receiver)
- **Monte Carlo Simulation**: Simulating 2-ASK system performance using Monte Carlo methods.
- **BER and Spectrum Analysis**: Generating plots for Bit Error Rate (BER) vs. Signal-to-Noise Ratio (Eb/N0) and signal spectrum.
- **Eye Diagram**: Visualizing signal quality using eye diagrams.

### Activity 6: Coded Digital Transmission Chain
- **Hamming Coding**: Implementing error correction coding with Hamming code for a 2-ASK system.
- **Monte Carlo Simulation**: Simulating the performance of coded vs. uncoded systems.
- **BER Comparison**: Analyzing the effect of coding on system performance using BER plots.

## Requirements:
- Python 3.x
- NumPy, Matplotlib, SciPy, etc.

## License:
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
