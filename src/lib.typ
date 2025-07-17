// Unofficial CoB (The Company of Biologists) template.

#let font-serif = "Nimbus Roman"
#let font-sans-serif = "Nimbus Sans"

#let titcolor = rgb(64, 193, 234)
#let linkblue = rgb(66, 93, 178)

#let print-supertitle(supertitle) = {
	set text(font: font-sans-serif, size: 8pt, fill: titcolor, tracking: 0.5pt)
	//show text: smallcaps // TODO: figure out how to fix (need Cap version of font)?
	show text: strong
	block(
		inset: (top: 0.1mm),
		upper(supertitle)
	)
}

#let print-title(title) = {
	set text(font: font-sans-serif, size: 18pt)
	block(
		inset: (top: -0.18cm),
		title,
	)
}

#let print-authors(authors) = {
	set text(font: font-sans-serif, size: 12pt)
	show text: strong
	block(
		inset: (top: -0.4cm),
		authors.join(", ", last: " and "),
	)
}

#let template(
	supertitle:   "Research Article",
	title:        "Paper Title",
	authors:      ("John Doe", "Jane Rue"),
	article-id:   "xxxxxx",
	article-year: "2025",
	date:         datetime.today(),
	body
) = {
	set page(
		"us-letter",
		margin: (
			left: 1.685cm,
			right: 1.77cm,
			top: 2.43cm,
		),
		columns: 2,
		header: [
			#set text(font: font-sans-serif, size: 7pt)
			© #{article-year}. MANUSCRIPT SUBMITTED TO JOURNAL OF CELL SCIENCE (#{article-year}) 00, jcs#{article-id}. doi:#link("https://doi.org/10.1242/jcs."+article-id, "10.1242/jcs."+article-id)
			#h(1fr)
			#box(
				inset: (bottom: -0.175cm),
				image("/inc/COB_Publisher_Logo.svg")
			)
			#v(-0.04cm)
			#line(length: 100%, stroke: 0.5pt)
		],
	)

	show heading.where(level: 1): it => {
		set text(font: font-sans-serif, size: 8.5pt)
		show text: upper
		it
	}

	set text(font: font-serif, size: 9.4pt)

	set par(justify: true)

	show link: set text(fill: linkblue)
	show cite: set text(fill: linkblue)

	set footnote.entry(
		separator: context [
			#line(length: 30%, stroke: 0.5pt)
			// Show "Received #date" on first page.
			#if here().page() == 1 {
				set text(size: 8pt)
				block(above: 0.5em, strong[Received #date.display("[day] [month repr:long] [year]")])
			}
		]
	)

	// https://rupress.org/jcb/pages/reference-guidelines
	//
	// - dependent style:   https://www.zotero.org/styles/the-journal-of-cell-biology
	// - independent style: https://www.zotero.org/styles/the-rockefeller-university-press
	set bibliography(style: "the-rockefeller-university-press.csl")

	// title and authors
	place(
		top+left,
		scope: "parent",
		float: true,
	)[
		#print-supertitle(supertitle)
		#print-title(title)
		#print-authors(authors)
	]

	// body
	body
}
