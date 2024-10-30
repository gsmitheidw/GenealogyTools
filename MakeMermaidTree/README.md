# Create Tree using Mermaid

## Setup

1. Install npm (choco install nodejs)

2. Install mermaid-cli using this line escalated:
 

    npm install -g @mermaid-js/mermaid-cli

3. Compile mermaid files using:


    mmdc -i .\obrien.mmd -o .\obrien.png


## Code Example

See this example for a basic tree structure


```mermaid

%% Alice of Patrick Brien and Elizabeth Murray Ratoath
flowchart TD
    p["fa:fa-person Patrick Brien"]
    e["fa:fa-person-dress Elizabeth Murray"]
    A["fa:fa-person-dress Alice Brien<br>*(b.1822-d.1875)*"]

    p -- Father to --> A
    e -- Mother to --> A


%% Freestanding text at the end of the chart
    text["Additional Notes: The Brien family history..."]
    style text fill:#d3d3d3, stroke:none, font-size:12px

``` 

This is how this looks in png:

![O'Brien Family Tree](obrien.png)




## External Links

https://github.com/mermaid-js/mermaid-cli


https://mermaid.live/

Font Awesome:<br>
https://fontawesome.com/search

