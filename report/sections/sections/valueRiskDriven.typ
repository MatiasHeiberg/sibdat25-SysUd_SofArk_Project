#import "../../template.typ": target-width
I vurderingen af vores use cases tilpassede vi risiko- og værdimatricerne til vores projekt. Formålet for os var at bruge matricerne til at give hver use case et tal, der er produktet af to faktorer: et tal for henholdsvis risiko og værdiskabelse. For at kunne finde disse to tal gav de oprindelige matricer os besvær, fordi de præsenterer fire kvadranter uden en logisk måde at kunne vurdere, hvilke værdier de skal repræsentere. Særligt er to kvadranter åbenlyst den "vigtigste" og den "uvæsentligste". Tager vi eksempelvis risikomatricen vil kvadranten, der ligger i krydsfeltet mellem _high probability_ og _high impact_ være den, der vægtes højest. Modsat vil kvadranten i krydsfeltet mellem _low probability_ og _low impact_ vægtes lavest. Disse to kvadranter er placeret diagonalt for hinanden, hvilket efterlader de sidste to kvadranter i en tilstand af ligevægt, hvor den ene vægter lavere i _probability_ men højere i _impact_ og vice versa. Samme forhold er gældende for værdimatricen. Se @figure:riskMatrix og @figure:valueMatrix, der viser vores løsning, som blev at fjerne kvadranterne og tildele vægtningen på diagonalaksen, der spænder fra "vigtigste" til den "uvæsentligste". Se
#figure(
  image(
    "../../assets/Risk.jpg",
    width: target-width,
  ),
  caption: [Risiko matrice],
) <figure:riskMatrix>
#figure(
  image(
    "../../assets/Valuecost.jpg",
    width: target-width,
  ),
  caption: [Værdi matrice],
) <figure:valueMatrix>
