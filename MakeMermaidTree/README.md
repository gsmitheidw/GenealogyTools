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

%% Alice of Patrick Brien and Elizabeth Murray Ratoath                                                                                                                          flowchart TD                                                                                                                                                                        p["Patrick Brien>"]                                                                                                                                                             e["Elizabeth Murray"]                                                                                                                                                           A["Alice Brien<br>*(b.1822-d.1875)*"]                                                                                                                                                                                                                                                                                                                           p -- father to --> A                                                                                                                                                            e -- mother to --> A                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        %% Freestanding text at the end of the chart                                                                                                                                        text["Additional Notes: The Brien family history..."]                                                                                                                           style text fill:#d3d3d3, stroke:none, font-size:12px

``` 



