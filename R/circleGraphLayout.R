#' Find an arrangement of circles satisfying a graph of adjacencies
#' 
#' Attempts to derive an arrangement of circles satisfying prior conditions for 
#' size and adjacency. Unlike the \code{\link{circleRepelLayout}} function, this
#' is a deterministic algorithm. Circles are classified as either internal or 
#' external. Viewing the pattern of adjacencies as a triangulated mesh, external
#' circles are those on the boundary. In the version of the algorithm 
#' implemented here, the radii of external circles are provided as inputs, while
#' the radii of internal circles are derived as part of the output arrangement.
#' 
#' The \code{internal} argument specifies circle adjacencies (ie. tangencies). 
#' The format is an concise representation of graph edges, and consists of a 
#' list of vectors: one per internal circle. In each vector the first element is
#' the ID value of the internal circle and the remaining values are IDs of 
#' neighbouring circles, which may be either internal or external.
#' 
#' The \code{external} argument is a data.frame which specifies the radii of 
#' external circles. Internal circle radii should not be specified as they are 
#' derived as part of the fitting algorithm. The function will issue an error if
#' any internal circle IDs are present in the \code{external} data.
#' 
#' @return A data.frame with columns for circle ID, centre X and Y ordinate, and
#' radius.
#' 
#' @note Please treat this function as experimental.
#' 
#' @references C.R. Collins & K. Stephenson (2003) An algorithm for circle
#' packing. Computational Geometry Theory and Applications 25:233-256.
#' 
#' @param internal A list of vectors of circle ID values where, in each vector,
#'   the first element is the ID of an internal circle and the remaining
#'   elements are the IDs of that circle's neighbours arranged as a cycle. The
#'   cycle may be clockwise or anti-clockwise but the same ordering must be used
#'   for all vectors.
#'   
#' @param external A data.frame or matrix of external circle radii, with circle
#'   IDs in the first column and radii in the second column.
#'   
#' @return The output arrangement as a data.frame with columns for circle ID,
#'   centre X and Y ordinates, and radius. For external circles the radius will
#'   equal input values.
#'   
#' @examples
#' ## Simple example with two internal circles surrounded by
#' ## four external circles. Internal circle IDs are 1 and 2.
#' internal <- list( c(1, 3, 4, 5), c(2, 3, 4, 6) )
#' 
#' ## Uniform radius for external circles
#' external <- data.frame(id=3:6, radius=1.0)
#' 
#' ## Generate the circle packing
#' packing <- circleGraphLayout(internal, external)
#' 
#' @export
#' 
circleGraphLayout <- function(internal, external) {
  doCirclePack(internal, external)
}
