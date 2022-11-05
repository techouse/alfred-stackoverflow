# StackOverflow Search for Alfred

![GitHub release](https://img.shields.io/github/release/techouse/alfred-stackoverflow.svg)
![GitHub All Releases](https://img.shields.io/github/downloads/techouse/alfred-stackoverflow/total.svg)
![GitHub](https://img.shields.io/github/license/techouse/alfred-stackoverflow.svg)

Search [StackOverflow](https://stackoverflow.com) questions using [Alfred](https://www.alfredapp.com/).

Heavily inspired by [deanishe/alfred-stackexchange](https://github.com/deanishe/alfred-stackexchange). :seedling:

![demo](demo.gif)

## Installation

1. [Download the latest version](https://github.com/techouse/alfred-stackoverflow/releases/latest)
2. Install the workflow by double-clicking the `.alfredworkflow` file
3. You can add the workflow to a category, then click "Import" to finish importing. You'll now see the workflow listed
   in the left sidebar of your Workflows preferences pane.

## Usage

Just type `so` followed by your `<query>`.

```
so how to encode an http query in python
```

Either press `⌘Y` to Quick Look the result, or press `<enter>` to open it in your web browser.

### Query syntax

Prefix a word in your `<query>` with `.` (full stop) to indicate that it's a tag, e.g `requests .python` will
search for answers tagged python with the query requests.

### Note

The search uses the [StackExchange Advanced Search API](https://api.stackexchange.com/docs/advanced-search) which has
a [hard limit of 10,000 queries per IP address per day](https://api.stackexchange.com/docs/throttle).
