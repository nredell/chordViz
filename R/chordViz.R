#' Create a D3 Chord Diagram with the viz.js Library
#'
#' Create an interactive chord diagram using the JavaScript visualization
#' library D3 (\url{http://d3js.org}). More specifically, the chord diagram
#' layout is based on \url{http://http://bl.ocks.org/NPashaP/2d76492981106691cdcf843d7e3f765a}.
#' Chord diagrams show directed relationships among a group of entities.
#'
#' Additionally, the R code was adapted from the chorddiag R package but modified
#' to work with the d3.v4.js and viz.js libraries.
#'
#' @param data A square matrix--one with "n" rows and "n" columns--containing the input
#'   data. Any NA or NULL values should be set to 0.
#' @param start A scalar giving the starting position of the first group or
#'   column in the input matrix. The units are in radians and the default is
#'   0 [pi] or 2 [pi]. The groups, however, appear in a counter-clockwise order
#'   so the pattern is a flipped unit circle with 3/2 [pi] radians at the top of
#'   the circle.
#' @param groupNames A vector of names. Defaults to the column names of the input
#'   matrix.
#' @param groupColors A vector of colors to be used for the groups.
#' @param width Width for the chord diagram's frame area in pixels (if NULL then
#'   width is automatically determined based on context).
#' @param height Height for the chord diagram's frame area in pixels (if NULL
#'   then height is automatically determined based on context).

#'
#' @source
#' \url{http://github.com/NPashaP/Viz} and \url{http://github.com/mattflor/chorddiag}
#'
#'
#' @examples
#' m <- matrix(c(11975,  5871, 8916, 2868,
#'                1951, 10048, 2060, 6171,
#'                8010, 16145, 8090, 8045,
#'                1013,   990,  940, 6907),
#'                byrow = TRUE,
#'                nrow = 4, ncol = 4)
#' groupNames <- c("A", "B", "C", "D")
#' rownames(m) <- groupNames
#' colnames(m) <- groupNames
#' chordViz(m)
#'
#' @export
chordViz <- function(data, start = 0, groupNames = NULL, groupColors = NULL,
                     width = NULL, height = NULL) {

  data <- as.matrix(data)

  if (nrow(data) != ncol(data)) {stop("The input matrix must be square.")}

  if (any(is.na(data)) || any(is.null(data))) {stop("The input matrix contains NA or NULL values.")}

  if (is.null(groupNames)) {
    if (is.null(colnames(data))) {
      colnames(data) <- as.character(1:ncol(data))
    }
    groupNames <- colnames(data)
    } else if (length(groupNames) != ncol(data)) {
      stop("The length of groupNames must match the number of columns in the
           input matrix.")
    }

  if (is.null(groupColors)) {
    groupColors <- grDevices::colorRampPalette(RColorBrewer::brewer.pal(12,"Set3"))(ncol(data))
  }

  params <- list(matrix = data,
                 options = list(start = start, groupNames = groupNames,
                                groupColors = groupColors,
                                width = width, height = height))

  htmlwidgets::createWidget(
      name = 'chordViz',
      params,
      width = width,
      height = height,
      htmlwidgets::sizingPolicy(browser.fill = TRUE),
      package = 'chordViz'
      )
}
