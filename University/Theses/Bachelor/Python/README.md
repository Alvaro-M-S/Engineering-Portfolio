# 🦾 Bachelor's Thesis – Prosthesis Design Automation with Artificial Intelligence

This study focuses on improving the **automation of prosthesis design**, using **artificial intelligence** and **numerical methods**. The research explores various approaches, with a particular emphasis on the **superellipse** as a potential solution for curve fitting based on tomographic images.

The project builds on previous research in **elliptic fitting**, but one key difference is identified: while the ellipse allows a closed fit using its implicit polynomial based on algebraic distance, this property does not hold for the superellipse. This discovery meant that prior knowledge could not be directly applied to the superellipse.

Despite this challenge, the research continued to optimize the **superellipse parameters** to improve the fitting process, achieving a significant improvement over the elliptical fit. A quick solution was found to complement this by utilizing the **inliers** from the elliptical fit as data for the superellipse fitting. While the superellipse method was more accurate, it did not outperform the elliptical fit in terms of computational time.

Additionally, the concept of **Convex Hull** was applied to curve fitting. This method proved to be easy to implement and adaptable, offering flexibility in adjusting the fitting results using a parameter that allows for a margin between the fit and the contour. This margin is essential for ensuring proper assembly and implementation of prostheses in the future.

### Key Features:
- **Superellipse and Elliptic Fitting**: Investigating the benefits and challenges of using the superellipse over the ellipse for curve fitting.
- **Prosthesis Design**: Applying these mathematical models to the design and development of prosthetics.
- **Convex Hull for Fitting**: Exploring how the Convex Hull can enhance the accuracy of the fitting process.
- **Python and Google Colab**: All computations, data analysis and modeling were performed using **Python**, with the use of **Google Colab** for cloud-based processing and collaboration.

📂 This folder contains all the code, models, and documentation related to the thesis, showcasing the integration of **AI**, **numerical methods**, and **Python** in improving prosthesis design automation.
