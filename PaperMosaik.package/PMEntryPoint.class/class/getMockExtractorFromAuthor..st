mock
getMockExtractorFromAuthor: mockAuthor

	| mockExtractor |
	mockExtractor := PMAuthorMetricsExtractor
		                 withAuthor: mockAuthor
		                 withStartingYear: 1999
		                 withEndingYear: 2023.

	"Manually add publication counters for each year"
	mockExtractor
		addPublicationCountersForYear: 1999
		publicationCounters: (Dictionary new
				 at: 'ConferencePaper' put: 2;
				 yourself);
		addPublicationCountersForYear: 2000
		publicationCounters: (Dictionary new
				 at: 'ConferencePaper' put: 2;
				 yourself);
		addPublicationCountersForYear: 2001
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 1;
				 at: 'ConferencePaper' put: 5;
				 yourself);
		addPublicationCountersForYear: 2002
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 3;
				 at: 'ConferencePaper' put: 5;
				 yourself);
		addPublicationCountersForYear: 2003
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 4;
				 at: 'ConferencePaper' put: 8;
				 yourself);
		addPublicationCountersForYear: 2004
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 4;
				 at: 'ConferencePaper' put: 13;
				 yourself);
		addPublicationCountersForYear: 2005
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 5;
				 at: 'ConferencePaper' put: 26;
				 at: 'Book' put: 2;
				 yourself);
		addPublicationCountersForYear: 2006
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 6;
				 at: 'ConferencePaper' put: 37;
				 at: 'Book' put: 2;
				 yourself);
		addPublicationCountersForYear: 2007
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 6;
				 at: 'ConferencePaper' put: 54;
				 at: 'Book' put: 2;
				 yourself);
		addPublicationCountersForYear: 2008
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 6;
				 at: 'ConferencePaper' put: 66;
				 at: 'Series' put: 1;
				 at: 'Book' put: 2;
				 yourself);
		addPublicationCountersForYear: 2009
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 8;
				 at: 'ConferencePaper' put: 76;
				 at: 'Series' put: 2;
				 at: 'Book' put: 2;
				 yourself);
		addPublicationCountersForYear: 2010
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 11;
				 at: 'ConferencePaper' put: 90;
				 at: 'Series' put: 2;
				 at: 'Book' put: 2;
				 yourself);
		addPublicationCountersForYear: 2011
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 12;
				 at: 'ConferencePaper' put: 99;
				 at: 'Series' put: 2;
				 at: 'Book' put: 2;
				 yourself);
		addPublicationCountersForYear: 2012
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 15;
				 at: 'ConferencePaper' put: 104;
				 at: 'Series' put: 2;
				 at: 'Book' put: 2;
				 yourself);
		addPublicationCountersForYear: 2013
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 16;
				 at: 'ConferencePaper' put: 114;
				 at: 'Series' put: 2;
				 at: 'Book' put: 2;
				 yourself);
		addPublicationCountersForYear: 2014
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 17;
				 at: 'ConferencePaper' put: 124;
				 at: 'Series' put: 2;
				 at: 'Book' put: 2;
				 yourself);
		addPublicationCountersForYear: 2015
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 18;
				 at: 'ConferencePaper' put: 138;
				 at: 'Series' put: 2;
				 at: 'Book' put: 2;
				 yourself);
		addPublicationCountersForYear: 2016
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 21;
				 at: 'ConferencePaper' put: 144;
				 at: 'Series' put: 2;
				 at: 'Book' put: 2;
				 yourself);
		addPublicationCountersForYear: 2017
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 22;
				 at: 'ConferencePaper' put: 152;
				 at: 'Series' put: 2;
				 at: 'Book' put: 2;
				 yourself);
		addPublicationCountersForYear: 2018
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 22;
				 at: 'ConferencePaper' put: 157;
				 at: 'Series' put: 2;
				 at: 'Book' put: 2;
				 yourself);
		addPublicationCountersForYear: 2019
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 25;
				 at: 'ConferencePaper' put: 164;
				 at: 'Series' put: 2;
				 at: 'Book' put: 2;
				 yourself);
		addPublicationCountersForYear: 2020
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 27;
				 at: 'ConferencePaper' put: 170;
				 at: 'Series' put: 2;
				 at: 'Book' put: 2;
				 yourself);
		addPublicationCountersForYear: 2021
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 30;
				 at: 'ConferencePaper' put: 180;
				 at: 'Series' put: 2;
				 at: 'Book' put: 2;
				 yourself);
		addPublicationCountersForYear: 2022
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 35;
				 at: 'ConferencePaper' put: 187;
				 at: 'Series' put: 2;
				 at: 'Book' put: 2;
				 yourself);
		addPublicationCountersForYear: 2023
		publicationCounters: (Dictionary new
				 at: 'JournalArticle' put: 37;
				 at: 'ConferencePaper' put: 191;
				 at: 'Series' put: 2;
				 at: 'Book' put: 2;
				 yourself).


	^ mockExtractor