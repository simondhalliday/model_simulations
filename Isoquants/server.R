#Server.R
#Author1: Simon Halliday (Smith College) 
#Author2: Andrew Bray (Mount Holyoke College)
#shalliday@smith.edu

# load the shiny package
library(shiny)

shinyServer(function(input, output) {
  output$linePlot <-renderPlot({
  isoq1Fn <- function(L, A=1, x=10, a=0.5) {
    (x/(A*L^(a)))^(1/(1-a))
  }
  
  isoq2Fn <- function(L, A=1, x=10, a=0.5) {
    ((x+10)/(A*L^(a)))^(1/(1-a))
  }
  
  isoq3Fn <- function(L, A=1, x=10, a=0.5) {
    ((x+20)/(A*L^(a)))^(1/(1-a))
  }
  
  isocostFn <- function(L, C=10, w=1, r=1) {
    ((C/r) - (w/r)*L)
  }
  
  
  #Call on MathJax for Math
  withMathJax()
  
  COL <- c("#1B9E77", "#D95F02", "#7570B3", "#E7298A", "#66A61E", "#E6AB02", "#A6761D", "#666666")
  par(mar =  c(5, 5, 4, 2))
  xlims <- c(0, 100)
  ylims <- c(0, 100)
  
  plot(0, 0, xlim = xlims, ylim = ylims, type = "n",
       xlab = expression(paste("Labor, ", L)),
       ylab = expression(paste("Capital, ", K)),
       xaxt = "n", 
       yaxt = "n", 
       cex.lab = 1.8, 
       bty = "n")
  
  npts <- 500
  xx1 <- seq(xlims[1], xlims[2], length.out = npts)
  lines(xx1, isoq1Fn(xx1, a=input$a, x=input$x, A=input$A), col = COL[1], lwd = 4)
  lines(xx1, isoq2Fn(xx1, a=input$a, x=input$x, A=input$A), col = COL[2], lwd = 4)
  lines(xx1, isoq3Fn(xx1, a=input$a, x=input$x, A=input$A), col = COL[3], lwd = 4)
  lines(xx1, isocostFn(xx1, C=input$C, w=input$w, r=input$r), col = COL[4], lwd = 4)
  
  axis(1, at = xlims, pos = 0)
  axis(2, at = ylims, pos = 0)
  add_legend <- function(...) {
    opar <- par(fig=c(0, 1, 0, 1), oma=c(0, 0, 0, 0), 
                mar=c(0, 0, 0, 0), new=TRUE)
    on.exit(par(opar))
    plot(0, 0, type='n', bty='n', xaxt='n', yaxt='n')
    legend(...)
  }
  
  add_legend("topright", legend=c(
    expression(paste("Isoquant 1: K =" (x[1]/AL^alpha)^(1/beta),)), 
    expression(paste("Isoquant 2: K =", (x[2]/AL^alpha)^(1/beta), )),
    expression(paste("Isoquant 3: K =", (x[3]/AL^alpha)^(1/beta), )),
    #expression(withMathJax(helpText('Isocost $$K = \frac{C}{p_K} - \frac{p_L}{p_K}L$$')))
    expression(paste("Isocost: K =", C/p[k] - (p[L]/p[K])*L, ))
  ),
  col = COL, lty = 1, lwd = 2, bty = "n", cex=1.3, pt.cex = 1)
})
})