% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/vitalRatePerturbation.R
\name{vitalRatePerturbation}
\alias{vitalRatePerturbation}
\title{A function to perform perturbation of vital rates of the matrix model for any demographic statistic.}
\usage{
vitalRatePerturbation(matU, matF, matC = NULL, demogstat = "lambda",
  pert = 0.001)
}
\arguments{
\item{matU}{The U matrix (processes related to survival, growth and retrogression).}

\item{matF}{The F matrix (sexual reproduction processes).}

\item{matC}{The C matrix (clonal reproduction processes).}

\item{demogstat}{The demographic statistic to be used, as
in "the sensitvity/elasticity of ___ to vital rate perturbations."
Defaults to the per-capita population growth rate at equilibrium. 
Also accepts a user-supplied function that performs a calculation on
a projection matrix and returns a single numeric value.}

\item{pert}{Magnitude of the perturbation (defaults to 0.001).}
}
\value{
A data frame containing...
}
\description{
A function to perform perturbation of vital rates of the matrix model and
measure the response of the per-capita population growth rate at equilibrium
or (with a user-supplied function) any other demographic statistic.
}
\details{
%% ~~ If necessary, more details than the description above ~~
}
\note{
%% ~~further notes~~
}
\examples{

\dontrun{
data(Compadre)
pira <- subsetDB(Compadre, SpeciesAccepted == "Pinus radiata")

vitalRatePerturbation(pira)  # Not implemented yet!

vitalRatePerturbation(matU = pira@matU, matF = pira@matF)
vitalRatePerturbation(matU = pira@matU, matF = pira@matF, pert = 1e-03)
# use a smaller perturbation
vitalRatePerturbation(matU = pira@matU, matF = pira@matF, pert = 1e-10)

# calculate the sensitivity/elasticity of the damping ratio to vital rate perturbations
damping <- function(matU, matF, matC){  # define function for damping ratio
A <- matU+matF+matC
eig <- eigen(A)$values
dm <- rle(Mod(eig))$values
return(dm[1] / dm[2])
}
vitalRatePerturbation(matU = pira@matU, matF = pira@matF, stat = damping)
vitalRatePerturbation(matU = pira@matU, matF = pira@matF, stat = "damping")

}


}
\references{
%% ~put references to the literature/web site here ~
}
\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\author{
Roberto Salguero-Gomez <r.salguero@sheffield.ac.uk>
}
\keyword{~kwd1}
\keyword{~kwd2}
