- Schalter von links nach rechts nummeriert
- Schalter oben = 1
- Schalter unten = 0
- Schalter 1 -> Laserpointer auf Boden
	- "unten" = aus
	- "oben" = an
- Schalter 5 -> Länge der Seitenbeine
	- "unten" = 1/2
	- "oben" = 3/4/5

| 1   | 2     | 3     | 4     | 5     | -> Schalter Nr                  |
| --- | ----- | ----- | ----- | ----- | ------------------------------- |
|     | **B** | **C** | **D** | **E** | **-> Laserscanner Eingang Bit** |
|     | 0     | 0     | 0     | 0     | Position 1 - 1/2                |
|     | 0     | 0     | 0     | 1     | Position 1 - 3/4/5              |
|     | 0     | 0     | 1     | 0     | unassigned                      |
|     | 0     | 0     | 1     | X     | (same as above)                 |
|     | 0     | 1     | 0     | 0     | Position 2 - 1/2                |
|     | 0     | 1     | 0     | 1     | Position 2 - 3/4/5              |
|     | 0     | 1     | 1     | 0     | Position 3 - 1/2                |
|     | 0     | 1     | 1     | 1     | Position 3 - 3/4/5              |
|     | 1     | 0     | 0     | 0     | Position 1 NARROW - 1/2         |
|     | 1     | 0     | 0     | 1     | Position 3 NARROW - 1/2         |
|     | 1     | 0     | 1     | 0     | Position 5 NARROW - 1/2         |
|     | 1     | 0     | 1     | X     | (same as above)                 |
|     | 1     | 1     | 0     | 0     | Position 4 - 1/2                |
|     | 1     | 1     | 0     | 1     | Position 4 - 3/4/5              |
|     | 1     | 1     | 1     | 0     | Position 5 - 1/2                |
|     | 1     | 1     | 1     | 1     | Position 5 - 3/4/5              |

