I represent a parser of dblp data.

## Example


```st
"--- PARSER PHASE 1 and 2 ---"
parser := PMJsonParser new .
parser parse: nil. 
"or"
"parser parse: 'path/to/json/file'. "

"Check result by inspecting the Researchers for example"
PMResearcher Researchers .


"--- PARSER PHASE 3 ---"
parser := PMJsonParser new .
parser parsePhase3: 'path/to/json/file'. "It should take 5 minutes"

"Automatically work on image startup"
PMVenue Venues. 
PMVenue venuesByField .

"Manually work after parsing the entire db"
PMVenue VenuesByYearAndField. 
PMVenue venuesCategorizedByFieldOfYear: 2023 .
```