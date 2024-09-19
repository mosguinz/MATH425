---
print_background: true
export_on_save:
    html: true
puppeteer:
    format: "Letter"
    timeout: 3000
    scale: 0.8
---

# Handout

## Question 1

$$
\begin{array}{c}
    \left\{
    \begin{array}{c}
        2x & - & y & + & 2z & = & 2 \\
        -x & - & y & + & 3z & = & 1 \\
        3x &   &   & - & 2z & = & 1
    \end{array}
    \right.
    &\iff
    &\left[
    \begin{array}{ccc|c}
        2 & -1 & 2 & 2 \\
        -1 & -1 & 3 & 1 \\
        3 & 0 & -2 & 1
    \end{array}
    \right]
    \\
    &\xrightarrow{\frac{1}{2}R_1 \to R_1}
    &\left[
    \begin{array}{ccc|c}
        1 & -1/2 & 1 & 1 \\
        -1 & -1 & 3 & 1 \\
        3 & 0 & -2 & 1
    \end{array}
    \right]
    \\
    &\xrightarrow[R_3-3R_1\to R_3]{R_2+R_1\to R_2}
    &\left[
    \begin{array}{ccc|c}
        1 & -1/2 & 1 & 1 \\
        0 & -3/2 & 4 & 2 \\
        0 & -3/2 & -5 & 2
    \end{array}
    \right]
    \\
    &\xrightarrow{R_3-R_2\to R_3}
    &\left[
    \begin{array}{ccc|c}
        1 & -1/2 & 1 & 1 \\
        0 & -3/2 & 4 & 2 \\
        0 &  0 & -9 & 0
    \end{array}
    \right]
\end{array}
$$

Keep doing Gaussian to get RREF, or by back substitution:

$$
-9z = 0 \implies \boxed{z=0} \\
-\frac{3}{2}y + 4z = 2 \implies -\frac{3}{2}y = 2 \implies \boxed{y = -\frac{4}{3}} \\
x-\frac{1}{2}y+z=1 \implies x + \frac{4}{6} = 1 \implies \boxed{x = \frac{1}{3}}
$$

## Question 2

 
For a system:

$$
\left\{
\begin{array}{c}
    a_{11}x & + & a_{12}y & + & a_{13}z & = & b_1 \\
    a_{21}x & + & a_{22}y & + & a_{23}z & = & b_2 \\
    a_{31}x & + & a_{32}y & + & a_{33}z & = & b_3
\end{array}
\right.
\iff
\left[
\begin{array}{ccc|c}
    a_{11} & a_{12} & a_{13} & b_2 \\
    a_{21} & a_{22} & a_{23} & b_1 \\
    a_{31} & a_{32} & a_{33} & b_3
\end{array}
\right]
$$

**Goal:** We want to make all non-pivots zero.

Starting from the first column, we want to make $a_{21}=a_{31}=0$.

To make $a_{21}$ zero, we need to subtract it with a multiple of itself. However, as a row operation, we need to apply it to every element in the row. For example, if we are using row 1 to subtract from row 2, we have that:

$$
a_{21}-\frac{a_{21}}{a_{11}}R_1
$$



---

To make $a_{21}$ zero, we need to subtract the row with a some multiple of $a_{21}$ In this case, we can subtract the entire row, $R_2$, with a multiple of the first row $R_1$. That is,

$$
R_2 - \frac{a_{21}}{a_{11}}R_1.
$$

Proof:

Where $R_1$ is the first row, multiplying the first row with $\frac{a_{21}}{a_{11}}$ yield:
$$
\frac{a_{21}}{a_{11}}R_1 = \left[
    \begin{array}{ccc|c}
        \frac{a_{21}}{a_{11}}a_{21} & 
    \end{array}
\right]
$$

---

# Question 3

For a system:

