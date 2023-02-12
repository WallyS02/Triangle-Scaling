"Sebastian Kutny 188586"
Object subclass: #Wielokat
	instanceVariableNames: 'wierzcholki nazwa dlugoscBoku'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!

!Wielokat methodsFor: 'initialize-release'!

initialize: liczbaWierzcholkow name: nowaNazwa
	nazwa := nowaNazwa.
	wierzcholki := Array new: liczbaWierzcholkow.
	wierzcholki at: 1 put: 0@0.
	dlugoscBoku := liczbaWierzcholkow.!!

!Wielokat methodsFor: 'accessing'!

nazwa
	^nazwa!

wierzcholki	
	^wierzcholki!
	
dlugoscBoku
	^dlugoscBoku!

nazwa: nowa_nazwa
	nazwa := nowa_nazwa!!
	
!Wielokat methodsFor: 'actions'!

drukuj
    (1 to: wierzcholki size) do: [ :i | 
    Transcript show: 'p';
    show: i printString;
    show: ': '; 
    show: (wierzcholki at: i) printString; cr].
    Transcript show: 'pole: '; show: (self pole) printString; cr.!!

Wielokat subclass: #Kwadrat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!

!Kwadrat methodsFor: 'arithmetic'!

+ figura
	| p |
	p := self pole + figura pole.
	^(Kwadrat new) initialize: p sqrt !

skaluj: liczba
	| k2 a |
	k2 := (Kwadrat new) initialize: self dlugoscBoku.
	a := (self dlugoscBoku)*liczba.
	k2 wierzcholki at: 2 put: a@0.
	k2 wierzcholki at: 3 put: a@a.
	k2 wierzcholki at: 4 put: 0@a.
	^k2!!

!Kwadrat methodsFor: 'actions'!

pole
	^(wierzcholki at: 2) x squared!

!Kwadrat methodsFor: 'initialize-release'!

initialize: bok
	super initialize: 4 name: 'Kwadrat'.
	wierzcholki at: 2 put: bok@0.
	wierzcholki at: 3 put: bok@bok.
	wierzcholki at: 4 put: 0@bok.
	dlugoscBoku := bok!!

Wielokat subclass: #Trojkat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'JezykiProgramowania'!

!Trojkat methodsFor: 'arithmetic'!

+ figura
	| p |
	p := self pole + figura pole.
	p := (4.0e0 / 3.0e0 sqrt * p) sqrt.
	^(Trojkat new) initialize: p!

skaluj: liczba
	| t2 a |
	t2 := (Trojkat new) initialize: self dlugoscBoku.
	a := (self dlugoscBoku)*liczba.
	t2 wierzcholki at: 2 put: a@0.
	t2 wierzcholki at: 3 put: a/2@((a * 3.0e0 sqrt) / 2).
	^t2!!

!Trojkat methodsFor: 'actions'!

pole
	^((3.0e0 sqrt / 4.0e0) * (wierzcholki at: 2) x squared)!

!Trojkat methodsFor: 'initialize-release'!

initialize: bok
	super initialize: 3 name: 'Trojkat'.
	wierzcholki at: 2 put: bok@0.
	wierzcholki at: 3 put: bok/2@((bok * 3.0e0 sqrt) / 2).
	dlugoscBoku := bok.!!

Transcript show: 'Kwadrat:'; cr.
k := (Kwadrat new) initialize: 2.
k drukuj.
Transcript show: 'Trojkat:'; cr.
t := (Trojkat new) initialize: 2.
t drukuj.
Transcript show: 't+k'; cr.
t1 := t + k.
t1 drukuj.
Transcript show: 'k+t'; cr.
k1 := k + t.
k1 drukuj.
Transcript show: 'Skalowanie kwadratu:'; cr.
k1 := k skaluj: 0.5.
k1 drukuj.
Transcript show: 'Skalowanie trojkata:'; cr.
t1 := t skaluj: 2.
t1 drukuj.