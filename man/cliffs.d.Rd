\name{cliffs.d}
\alias{cliffs.d}
\title{
Calculate Cliff's delta effect size for ordinal variables
}
\description{
Calculate Cliff's delta efficiently using a C loop instead of calculating the
dominance array in memory. Can handle reasonably large vectors at its input.
}
\usage{
cliffs.d(a, b)
}
\arguments{
  \item{a}{
  numeric vector for the treatment group
}
  \item{b}{
  numeric vector for the control group
}
}
\value{
  the Cliff's delta metric
}
\references{
Norman Cliff (1996). Ordinal methods for behavioral data analysis. Routledge.

K.Y. Hogarty and J.D.Kromrey (1999). Using SAS to Calculate Tests of Cliff's Delta. Proceedings of the Twenty-Foursth Annual SAS User Group International Conference, Miami Beach, Florida, p 238.
Available at: \url{http://www2.sas.com/proceedings/sugi24/Posters/p238-24.pdf}
}
\author{
Georgios Gousios <G.Gousios@tudelft.nl> TU Delft, NL
}
\examples{
## Example data from Hogarty and Kromrey (1999)
control <- c(10,10,20,20,20,30,30,30,40,50)
treatment <- c(10,20,30,40,40,50)
res <- cliffs.d(control, treatment)
print(res)
}
\keyword{ effect size }
\keyword{Cliff's delta}
