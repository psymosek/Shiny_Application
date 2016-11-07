library(UsingR)
data(galton)

shinyServer(  
    function(input, output) {    
        output$myPlot <- renderPlot({      
            y <- galton$child
            x <- galton$parent
            if( input$var == "Scatterplot") {
                plot(x,y,pch=19,col="blue",xlab = "Parent's Height [inches]",
                     ylab="Child's Height [inches]")
            }
            else {
                freqData <- as.data.frame(table(x, y))
                names(freqData) <- c("child", "parent", "freq")
                plot(
                    as.numeric(as.vector(freqData$parent)),
                    as.numeric(as.vector(freqData$child)),
                    pch = 21, col = "black", bg = "lightblue",
                    cex = .15 * freqData$freq,
                    xlab = "Parent's Height [inches]",
                    ylab = "Child's Height [inches]"
                )
            }
            abline(mean(galton$child)-input$beta*mean(galton$parent), input$beta, lwd = 3)
            points(mean(galton$parent), mean(galton$child), cex = 2, pch = 19)
            mse <- mean( (y - mean(galton$child) - input$beta * 
                              (x - mean(galton$parent)))^2 )
            title(paste("beta = ", input$beta, "mse = ", round(mse, 3)))     
        })      }
)
