Usecase = require 'usecase'
CardList = require './'

text = [
    "little",
    "f jlkjlkrsads zjglkd jflksa jflksajclkrdsdvgjlktrdvg",
    'Jag har benat ner praktiken bakom den mytiska headhuntingbranschen. Baserat på dina behov går vi igenom hur du ska appellera headhunters eller hur du själv ska gå tillväga för att headhunta? Jag jobbade tidigare som headhunter i Kina och i Stockholm.',
    "dsfl jlirew jflrejg lirdsjglird jglirdjg lirdj gtrd glijdsbg lirdajligjrda ligrdj ligdj ligjrda glir",
    " fskl",
    " fkjewl fjslkefj lkesfjlkes jflkes jfelks jflkef jlkefj lkslkf jeslkf jeslkf jeslk jflkesf jlkres jflkes jflkesjf lkresajflksj rdhgiursalef jlieshgiaghlies dsahg lisa hgfaliewalrsjflisjfkglirdsa hglishfi lshf iwajleamgleajlirsjf lisjflisre jfliesajf lisaj flirsjf liesajf lijf lisajef liashreflirewa hflisahf lisehflihres liihf jsalif jresa",
    "fkdsljfds "

]

cardList = CardList()
usecase = Usecase(cardList)

cards = []

for i in [1..10]
    cards.push {
        title: 'Superduper ' + text[i]
        imgUrl: '/map.jpg'
    }

cardList.addCards cards[0..4]

setTimeout (-> cardList.addCards cards[5..9]), 2000

module.exports = usecase.build()
