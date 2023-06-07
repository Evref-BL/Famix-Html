# Famix-Html

[![Coverage Status](https://coveralls.io/repos/github/Evref-BL/Famix-Html/badge.svg?branch=main)](https://coveralls.io/github/Evref-BL/Famix-Html?branch=main)

A Famix meta-model to represent HTML files.

## Installation

```st
Metacello new
  githubUser: 'Evref-BL' project: 'Famix-Html' commitish: 'main' path: 'src';
  baseline: 'FamixHtml';
  load
```

## Usage

```st
importer := FamixHtmlImporter new.
importer model: FamixHtmlModel new.

importer importString: '<h1>
	<button class="Hello">
		hello
	</button>
</h1>'.
importer model
```

