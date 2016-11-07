shinyUI(pageWithSidebar(
    headerPanel("Graphical Demonstration of the Pricipal of Least Mean Squared Error (MSE) Estimation"),  
    sidebarPanel(width=2,
        sliderInput('beta', 
                    'Guess at the slope of the Minimum Mean Square Error (MSE) regression line',
                    value = 1.0, min = 0.4, max = 1.6, step = 0.02),
        selectInput('var', 
                    label = "Choose a plot type",
                    choices = c("Scatterplot", "Bubbleplot"),
                    selected = "Scatterplot")),
        
    mainPanel(
        plotOutput('myPlot'),
        withMathJax(),
        HTML('<script type="text/x-mathjax-config">
             MathJax.Hub.Config({
             displayAlign: "left"
             });
             </script>'),
        HTML('<h3>$$\\mathsf{\\text{Approximation by a linear model estimates the }}\\beta_0 \\mathsf{\\text{ and }} \\beta_1 \\mathsf{\\text{ that minimize the function }}\\epsilon = \\sum_{i=1}^n (y_i-\\beta_0-\\beta_1 * x_i)^2$$</h3>'),
        HTML('<h3>$$\\mathsf{\\text{Differentiating and solving produces }} \\hat \\beta_0 = \\frac {\\bar y \\overline {x^2} - \\bar x \\overline {xy} }{\\overline {x^2} - {\\bar x}^2 } \\mathsf{\\text{ and }} \\hat \\beta_1 = \\frac { \\overline {xy} - \\bar x \\bar y}{\\overline {x^2} - {\\bar x}^2 }$$</h3>'),
        HTML('<h3>$$\\mathsf{\\text{If }} \\bar x = 0\\mathsf{\\text{ and }} \\bar y = 0,\\mathsf{\\text{i.e., the mean is coincident with the origin, and the }} x_i \\mathsf{\\text{ are not all equal to the same value, then }} \\hat \\beta_0 = 0$$</h3>'),
        HTML('<h3>$$\\bullet \\equiv \\left [ \\mathsf{\\text{mean of Parent heights, mean of Child heights}} \\right ]$$</h3>'))
    ))