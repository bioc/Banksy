% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/computation.R
\name{computeBanksy}
\alias{computeBanksy}
\title{Compute the component neighborhood matrices for the BANKSY matrix.}
\usage{
computeBanksy(
  se,
  assay_name,
  coord_names = NULL,
  compute_agf = FALSE,
  k_geom = 15,
  spatial_mode = c("kNN_median", "kNN_r", "kNN_rn", "kNN_rank", "kNN_unif", "rNN_gauss"),
  n = 2,
  sigma = 1.5,
  alpha = 0.05,
  k_spatial = 100L,
  M = NULL,
  sample_size = NULL,
  sample_renorm = TRUE,
  seed = NULL,
  dimensions = "all",
  center = TRUE,
  verbose = TRUE
)
}
\arguments{
\item{se}{A \code{SpatialExperiment},
\code{SingleCellExperiment} or \code{SummarizedExperiment}
  object. If not a SpatialExperiment object, argument \code{coord_names}
  must be provided.}

\item{assay_name}{A string scalar specifying the name of the assay to use.}

\item{coord_names}{A string vector specifying the names in \code{colData}
corresponding to spatial coordinates.}

\item{compute_agf}{A logical scalar specifying whether to compute the AGF.}

\item{k_geom}{An integer scalar specifying the number of neighbors to use.
Values \eqn{\in [15,30]} work well.}

\item{spatial_mode}{A string scalar specifying the kernel for neighborhood
  computation (default: kNN_median).
\itemize{
 \item{kNN_median: k-nearest neighbors with median-scaled Gaussian kernel}
 \item{kNN_r: k-nearest neighbors with $1/r$ kernel}
 \item{kNN_rn: k-nearest neighbors with $1/r^n$ kernel}
 \item{kNN_rank: k-nearest neighbors with rank Gaussian kernel}
 \item{kNN_unif: k-nearest neighbors wth uniform kernel}
 \item{rNN_gauss: radial nearest neighbors with Gaussian kernel}
}}

\item{n}{A numeric scalar specifying the exponent of radius (for kNN_rn).}

\item{sigma}{A numeric scalar specifying the std. dev. of Gaussian kernel
(for rNN_gauss).}

\item{alpha}{A numeric scalar specifying the radius used: larger alphas give
smaller radii (for rNN_gauss).}

\item{k_spatial}{An integer scalar specifying the initial number of neighbors
to use (for rNN_gauss)}

\item{M}{Advanced usage. A integer scalar specifying the highest azimuthal
Fourier harmonic to compute. If specified, overwrites the \code{use_agf}
argument.}

\item{sample_size}{An integer scalar number of neighbors to sample from the
neighborhood.}

\item{sample_renorm}{A logical scalar specifying whether to renormalize the
neighbor weights to 1.}

\item{seed}{An integer scalar specifying seed for sampling the neighborhood.}

\item{dimensions}{A character vector specifying the dimensions to use when
  computing neighborhood.
\itemize{
 \item{subset of colnames of cell.locs}
 \item{all}{Uses all colnames of spatialCoords to compute (default)}
}}

\item{center}{A logical scalar specifying whether to center higher order
harmonics in local neighborhoods.}

\item{verbose}{A logical scalar specifying verbosity.}
}
\value{
A SpatialExperiment / SingleCellExperiment / SummarizedExperiment
  object with neighborhood matrices added.
}
\description{
Compute the component neighborhood matrices for the BANKSY matrix.
}
\details{
Given an expression matrix (as specified by \code{assay_name}), this function
computes the mean neighborhood matrix (\code{H0}) and optionally, the 
azimuthal Gabor filter (AGF) matrix (\code{H1}). The number of neighbors 
used to define the spatial neighborhood is given by \code{k_geom}. 
Different kernels may be used to compute the neighborhood features, 
specified by \code{spatial_mode}.
}
\examples{
data(rings)
spe <- computeBanksy(rings, assay_name = "counts", M = 1, k_geom = c(15, 30))

}
