\name{cliffs.d}
\alias{cliffs.d}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Calculate Cliff's delta effect size for ordinal variables
}
\description{
Calculate Cliff's delta efficiently using a C loop instead of calculating the
dominance array in memory. Can handle very large vectors at its input.
}
\usage{
cliffs.d(a, b)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{a}{
%%     ~~Describe \code{control} here~~
}
  \item{b}{
%%     ~~Describe \code{pilot} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
Norman Cliff (1996). Ordinal methods for behavioral data analysis. Routledge.

K.Y. Hogarty and J.D.Kromrey (1999). Using SAS to Calculate Tests of Cliff's Delta. Proceedings of the Twenty-Foursth Annual SAS User Group International Conference, Miami Beach, Florida, p 238.
Available at: \url{http://www2.sas.com/proceedings/sugi24/Posters/p238-24.pdf}
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
## Example data from Hogarty and Kromrey (1999)
control <- c(10,10,20,20,20,30,30,30,40,50)
treatment <- c(10,20,30,40,40,50)
res <- cliffs.d(control, treatment)
print(res)
}
\keyword{ effect size }
\keyword{Cliff}% __ONLY ONE__ keyword per line
