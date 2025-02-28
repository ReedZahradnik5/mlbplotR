% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geom_from_path.R
\name{geom_from_path}
\alias{geom_from_path}
\title{ggplot2 Layer for Visualizing Images from URLs or Local Paths}
\usage{
geom_from_path(
  mapping = NULL,
  data = NULL,
  stat = "identity",
  position = "identity",
  ...,
  nudge_x = 0,
  nudge_y = 0,
  na.rm = FALSE,
  show.legend = FALSE,
  inherit.aes = TRUE
)
}
\arguments{
\item{mapping}{Set of aesthetic mappings created by \code{\link[ggplot2:aes]{aes()}}. If specified and
\code{inherit.aes = TRUE} (the default), it is combined with the default mapping
at the top level of the plot. You must supply \code{mapping} if there is no plot
mapping.}

\item{data}{The data to be displayed in this layer. There are three
options:

If \code{NULL}, the default, the data is inherited from the plot
data as specified in the call to \code{\link[ggplot2:ggplot]{ggplot()}}.

A \code{data.frame}, or other object, will override the plot
data. All objects will be fortified to produce a data frame. See
\code{\link[ggplot2:fortify]{fortify()}} for which variables will be created.

A \code{function} will be called with a single argument,
the plot data. The return value must be a \code{data.frame}, and
will be used as the layer data. A \code{function} can be created
from a \code{formula} (e.g. \code{~ head(.x, 10)}).}

\item{stat}{The statistical transformation to use on the data for this layer.
When using a \verb{geom_*()} function to construct a layer, the \code{stat}
argument can be used the override the default coupling between geoms and
stats. The \code{stat} argument accepts the following:
\itemize{
\item A \code{Stat} ggproto subclass, for example \code{StatCount}.
\item A string naming the stat. To give the stat as a string, strip the
function name of the \code{stat_} prefix. For example, to use \code{stat_count()},
give the stat as \code{"count"}.
\item For more information and other ways to specify the stat, see the
\link[ggplot2:layer_stats]{layer stat} documentation.
}}

\item{position}{A position adjustment to use on the data for this layer. This
can be used in various ways, including to prevent overplotting and
improving the display. The \code{position} argument accepts the following:
\itemize{
\item The result of calling a position function, such as \code{position_jitter()}.
This method allows for passing extra arguments to the position.
\item A string naming the position adjustment. To give the position as a
string, strip the function name of the \code{position_} prefix. For example,
to use \code{position_jitter()}, give the position as \code{"jitter"}.
\item For more information and other ways to specify the position, see the
\link[ggplot2:layer_positions]{layer position} documentation.
}}

\item{...}{Other arguments passed on to \code{\link[ggplot2:layer]{ggplot2::layer()}}. These are
often aesthetics, used to set an aesthetic to a fixed value. See the below
section "Aesthetics" for a full list of possible arguments.}

\item{nudge_x, nudge_y}{Horizontal and vertical adjustment to nudge labels by.
Useful for offsetting text from points, particularly on discrete scales.
Cannot be jointly specified with \code{position}.}

\item{na.rm}{If \code{FALSE}, the default, missing values are removed with
a warning. If \code{TRUE}, missing values are silently removed.}

\item{show.legend}{logical. Should this layer be included in the legends?
\code{NA}, the default, includes if any aesthetics are mapped.
\code{FALSE} never includes, and \code{TRUE} always includes.
It can also be a named logical vector to finely select the aesthetics to
display.}

\item{inherit.aes}{If \code{FALSE}, overrides the default aesthetics,
rather than combining with them. This is most useful for helper functions
that define both data and aesthetics and shouldn't inherit behaviour from
the default plot specification, e.g. \code{\link[ggplot2:borders]{borders()}}.}
}
\value{
A ggplot2 layer (\code{\link[ggplot2:layer]{ggplot2::layer()}}) that can be added to a plot
created with \code{\link[ggplot2:ggplot]{ggplot2::ggplot()}}.
}
\description{
This geom is used to plot MLB images instead
of points in a ggplot. It requires x, y aesthetics as well as a path.
}
\section{Aesthetics}{

\code{geom_mlb_logos()} understands the following aesthetics (required aesthetics are in bold):
\describe{
\item{\strong{x}}{ - The x-coordinate.}
\item{\strong{y}}{ - The y-coordinate.}
\item{\strong{path}}{ - a file path, url, raster object or bitmap array. See \code{\link[magick:editing]{magick::image_read()}} for further information.}
\item{\code{alpha = NULL}}{ - The alpha channel, i.e. transparency level, as a numerical value between 0 and 1.}
\item{\code{colour = NULL}}{ - The image will be colorized with this colour. Use the special character \code{"b/w"} to set it to black and white. For more information on valid colour names in ggplot2 see \url{https://ggplot2.tidyverse.org/articles/ggplot2-specs.html?q=colour#colour-and-fill}}
\item{\code{angle = 0}}{ - The angle of the image as a numerical value between 0° and 360°.}
\item{\code{hjust = 0.5}}{ - The horizontal adjustment relative to the given x coordinate. Must be a numerical value between 0 and 1.}
\item{\code{vjust = 0.5}}{ - The vertical adjustment relative to the given y coordinate. Must be a numerical value between 0 and 1.}
\item{\code{width = 1.0}}{ - The desired width of the image in \code{npc} (Normalised Parent Coordinates).
The default value is set to 1.0 which is \emph{big} but it is necessary
because all used values are computed relative to the default.
A typical size is \code{width = 0.1} (see below examples).}
\item{\code{height = 1.0}}{ - The desired height of the image in \code{npc} (Normalised Parent Coordinates).
The default value is set to 1.0 which is \emph{big} but it is necessary
because all used values are computed relative to the default.
A typical size is \code{height = 0.1} (see below examples).}
}
}

\examples{
\donttest{
library(mlbplotR)
library(ggplot2)

# create x-y-coordinates of a triangle and add league logo urls
df <- data.frame(
  a = c(sin(2 * pi * (0:4) / 5), 0),
  b = c(cos(2 * pi * (0:4) / 5), 0),
  url = c(
    "https://i.turner.ncaa.com/sites/default/files/images/logos/schools/bgl/virginia.svg",
    "https://i.turner.ncaa.com/sites/default/files/images/logos/schools/bgl/michigan-st.svg",
    "https://i.turner.ncaa.com/sites/default/files/images/logos/schools/bgl/lsu.svg",
    "https://i.turner.ncaa.com/sites/default/files/images/logos/schools/bgl/texas.svg",
    "https://i.turner.ncaa.com/sites/default/files/images/logos/schools/bgl/oregon.svg",
    "https://i.turner.ncaa.com/sites/default/files/images/logos/schools/bgl/james-madison.svg"
  )
)

# plot images directly from url
ggplot(df, aes(x = a, y = b)) +
  geom_from_path(aes(path = url), width = 0.15) +
  coord_cartesian(xlim = c(-2, 2), ylim = c(-1.3, 1.5)) +
  theme_void()

# plot images directly from url and apply transparency
ggplot(df, aes(x = a, y = b)) +
  geom_from_path(aes(path = url), width = 0.15, alpha = 0.5) +
  coord_cartesian(xlim = c(-2, 2), ylim = c(-1.3, 1.5)) +
  theme_void()

# It is also possible and recommended to use the underlying Geom inside a
# ggplot2 annotation
ggplot() +
  annotate(
    mlbplotR::GeomFromPath,
    x = 0,
    y = 0,
    path = "https://a.espncdn.com/combiner/i?img=/i/teamlogos/leagues/500/mlb.png",
    width = 0.4
  ) +
  theme_minimal()
}
}
