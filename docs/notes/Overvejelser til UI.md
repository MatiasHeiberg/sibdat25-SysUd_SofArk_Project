---
created: 2026-03-17
section: Iteration 1
exclude: false
sortKey: 5.37151
---
Vi diskutere hvorvidt vores lister der skal vises skal være singleton eller om der er en bedre måde. Vi tale om der er 2 måder at håndtere dataen, vil vi læse når programmet kører og gemme når vi lukker det eller vil vi læse og skrive efter hver ændring.
Vi går med den sidste og derfor virker det ikke hensigtsmæssigt at bruge singletons.

Vi går med almindelige lister for nu og laver et controller klasse for at have listerne i et applikationslag.

Vi taler meget om MVC vs. MVVM, og prøver at finde rundt i hvad der er hvad og hvordan vi hensigtsmæssigt designer vores system, og om vi har brug for en controller klasse til at holde på vores lister eller om vores MainWindow.xaml.cs faktisk er vores ModelView klasse - chatGPT siger nej.

Vi beslutter at have listerne i vores controller-klasse da det i forhold til vores scope passer bedst, selvom det også ville give mening at have det i vewmodel i mvvm.

___

Vi lavet et generisk IRepository<T>, måske? 