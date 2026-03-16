---
sortKey: 4.511
section: Refleksion
created: 2026-03-16
exclude: false
---
## IO
Vi snakker om brug af factory pattern til vores IO. Det virker godt hvis vi gerne vil give mulighed for at læse og skrive i flere forskellige formater, men det er ikke tilfældet for os. Vi snakker derefter om facade, fordi det reducerer coupling, men det passer heller ikke lige på vores problemstilling. Vi gennemgår også adapter, men det virker også søgt, og passer bedre såfremt vi have en database implementeret.
Vi snakker derefter om at oprette en repository klasse til hver json vi vil læse når nu vores program ikke er større end det er. Lige umiddelbart kan vi ikke se et GoF pattern der passer til I/O.![[12336.jpg]]