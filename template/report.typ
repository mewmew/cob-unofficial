#import "@local/cob-unofficial:0.1.0" as cob

#show: cob.template.with(
	title:   "Paper Title",
	authors: ("John Doe", "Jane Rue"),
)

= Introduction

#lorem(30) @takahashi2006induction

= Methods

#lorem(15)#footnote[#lorem(10)]

= Results

#lorem(45)

= Discussion

#lorem(25)

#bibliography("references.bib")
