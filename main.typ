#import "@preview/cetz-venn:0.1.4"
#import "@preview/cetz:0.4.0"

#set page(
  paper: "a4",
  margin: 3mm,
  columns: 3
)

#set par(
  justify: true
)

#set columns(
  gutter: 1.5%
)

#set text(
  size: 7pt
)

=== Gödelisierung
$g ö d (x_1 := x_j + c) = chevron.l 0, i, j, c chevron.r$ \
$g ö d (x_1 := x_j - c) = chevron.l 1, i, j, c chevron.r$ \
$g ö d (P_1;P_2) = chevron.l 2, g ö d (P_1), g ö d (P_2) chevron.r$ \
$g ö d ("WHILE" x_i != 0 "DO" P_1) = chevron.l 3, i, g ö d (P_1) chevron.r$ \

=== begrenzte Universalität
$ U': (e, x, t) -> cases(phi_e(x) + 1, 0) $

=== abzählbare Zahlenmengen
$QQ = NN < RR$

=== Entscheidbarkeit
entscheidbar ($A in "REC"$), wenn $chi_A$ berechenbar
$ chi_A (x) = cases(1 & quad x in A, 0 & quad x in.not A) $
$<=>$ $A in "RE" and A in "co-RE"$ #v(0.1em)
semi-entscheidbar ($A in "RE"$), wenn $hat(chi)_A$ berechenbar
$ hat(chi)_A (x) = cases(1 & quad x in A, bot & quad x in.not A) $
$<=>$ $A$ ist rekursiv aufzählbar $<=>$ $exists f in P: d o m(f) "/" i m g (f) = A$ \
$i m g (f) -> d o m (f) $

=== Reduktion
*Anforderung:* $f$ ist total und berechenbar.
$ A <= B <=> (forall x in NN: x in A <=> f(x) in B) $
"$A$ auf $B$ reduzierbar, $f$ die Reduktion von $A$ auf $B$"
- reflexiv ($A <= A$), transitiv, *aber nicht*: total, antisymmetrisch
Ist $A$ nicht semi-/entscheidbar, dann auch $B$ nicht. \
Ist $B$ semi-/entscheidbar, dann auch $A$.

=== Härte und Vollständigkeit

- $A_0$ ist *schwer* für $X$: $forall A in X: A <= A_0$
- $A_0$ ist *vollständig* für $X$: $"schwer" + A_0 in X$
$=>$ $H_e$ ist RE-vollständig, $overline(H)_e$ ist co-RE-vollständig \
Wenn ein Element in RE ist, dann muss es $<=$ des schweren oder vollständigen Elements von $X$ sein.

=== $s_m^n$ Theorem

$ phi_e (y,z) = phi_(s_m^n (e, y)) (z) $

=== Kleene's Rekursionssatz
Für jedes $f in P, f: NN^2 -> NN$ gibt es eine Gödelnummer $g$ sodass
$ forall z in NN: phi_g (z) = f(g, z) $

=== Fixpunktsatz
Jede *berechenbare, totale* Funktion $f: NN -> NN$ hat einen semantischen Fixpunkt ($phi_e = phi_f(e)$)

=== Indexmenge
$ forall i, j in NN: (i in I and phi_i = phi_j) => j in I $
nicht-trivial falls $I != emptyset and I != NN$ \
Jede nicht-triviale Indexmenge ist nicht entscheidbar.

#grid(columns: (1fr, 1fr), column-gutter: 1em)[#cetz.canvas(padding: 0em, length: 20pt, {
  cetz-venn.venn2(
    name: "venn",
    stroke: stroke(thickness: 0.2pt),
    padding: 2em
  )
  import cetz.draw: *
  content("venn.ab", [REC])
  content("venn.a", [RE])
  content("venn.b", [co-RE])
  content("venn.not-ab", [$2^NN$])
  content((0,1.2), [$K_f$])
  content((-1.8,1), [$T$])
  content((1.6,-1), [$V_0$])
  content((-0.5,0.5), [$H$])
  content((-0.7, -0.6), [$H_e$])
  content((1,-0.5), [$L$])
})][
  $H = {chevron.l e,x chevron.r | phi_e (x) != bot}$ \
  $H_e = {e | phi_e (e) != bot}$ \
  $L = {e | forall x: phi_e (x) = bot}$ \
  $T = {e | phi_e "ist total"}$ \
  $K_f = {e | phi_e = (f in P)}$ \
  $V_0 = {e | forall x: phi_e (x) = 0}$
]

=== Arithmetische Hierarchie
#v(01em)
#grid(columns: (1.3fr, 2fr), column-gutter: 1em)[
  #image("media/komplexitätsklassen.png")
][
  Definition der Komplexitätsklassen: #v(0.1em)
  $exists y_1: P = & quad Sigma_1 \
  forall y_1: P = & quad Pi_1 \
  (forall y_1 inter exists y_1) = & quad Delta_1
  $ \
  mit $P$ ein Prädikat, $P: NN -> {0,1}$ #v(0.1em)
  Sei $A <= B$, dann gilt \
  $B in Sigma_n "/" Pi_n "/" Delta_n => A in Sigma_n "/" Pi_n "/" Delta_n$ \
]

=== Bereits bewiesen
$H <= H_e, H_e <= T, overline(H)_e <= T, T lt.eq.not H_e, T lt.eq.not overline(H)_e $

#box(fill: rgb("#FF000013"), radius: 5pt, inset: 5pt, stroke: red + 0.5pt)[
==== Tipp
Aufgaben nicht immer in der vorgegebenen Reihenfolge bearbeiten, sondern so, dass man aus der einen Aufgabe die andere schlussfolgern kann.
]

#colbreak()
=== Beweis mit Satz von Rice
+ Zeige, dass Menge $A$ eine Indexmenge ist.
+ Zeige, dass Menge $A$ nicht-trivial
  - $exists e : e in A and exists e': e' in.not A$

=== Reduktion beweisen 
+ Zeige, dass $e in A -> f(e) in B$.
+ Zeige, dass $f(e) in B -> e in A$
  - oder $e in.not A -> f(e) in.not B$

== Beweissammlung

=== Menge aller Funktionen überabzählbar
Sei $F: {f | NN -> [0,1] }$  Menge aller totalen Prädikat-Funktionen. \
Man weise nun allen $f$ eine Nummer zu. Dann ist $f(x) = 1 - f_x (x)$. Nach dem *Diagonalisierungsargument* gibt es also keine Nummer für $f$, somit ist die Menge überabzählbar.

=== May-One-Reduktion $A <= B$
Wenn $B$ entscheidbar, dann auch $A$ entscheidbar. \
$chi_A = chi_B compose f$ auch berechenbar total, da $f$ und $chi_B$ berech/total. #v(0.3em)
Wenn $B$ semi, dann auch $A$ semi. \
$hat(chi)_A = hat(chi)_B compose f$ auch berechenbar, da $f$ und $hat(chi)_B$ berechenbar. #v(0.3em)
Wenn $A$ nicht-entscheidbar, dann auch $B$ nicht \
Folgt direkt aus (1), da $A$ auch entscheidbar wäre, wenn $B$. #v(0.3em) 
Wenn $A$ nicht-semi, auch $B$ nicht-semi. \
Folgt direkt aus (2). $-||-$

=== $H$ ist RE-vollständig
$=>$ mit $f$, $hat(chi)_A = hat(chi)_H compose f$ \
$arrow.l.double$ mit $phi_d = hat(chi)_A$ und $f: w -> chevron.l d, w chevron.r$ 
$ w in A <=> hat(chi)_A = phi_d = 1 <=> chevron.l d, w chevron.r in L <=> f(w) in L $

=== KRT 
Sei $f: NN^2 -> NN$ eine beliebige Funktion und $g in NN$. \
Hilfsfunktion $h: NN^2 -> NN$ mit $h(y,z) = f(s^1_1 (y,y), z)$. \
$h$ nach $s_m^n$ berechenbar $=>$ $exists e in NN: phi_e = h$. Wähle $g = s_1^1(e,e)$. \
$ phi_g (z) = phi_(s^1_1 (e,e)) = phi_e (e,z) = h(e, z) = f(s^1_1 (e, e), z) = f (g,z)$

=== Fixpunktsatz
Wichtig: $f$ ist total. \
$h: NN^2 -> NN, h(z,y) = U(f(z), y)$ ist berechenbar weil $U$ berechenbar und $f$ total / berechenbar. Nach KRT gibt es ein $g in NN$\
$ phi_g (y) = h(g,y) = U(f(g), y) = phi_f(g) (y) $

=== Satz von Rice
Angenommen $I$ sei entscheidbar und $i in I, j in.not I$. Dann gibt es ein $f: NN -> NN$ total und berechenbar 
$ f(x) = cases(j & quad x in I, i & quad x in.not I)$. \
Dann gibt es nach Fixpunktsatz ein $e$ mit
$phi_e = phi_f(e)$. \
Das geht aber nicht, da wenn $e in I$, $f(e) in.not I$ und wenn $e in.not I$, $f(e) in I$.

=== T $in.not$ RE
Beweis per Widerspruch: Angenommen $T in$ RE. Dann gilt $T <= H_e$. Dann gibt es eine berechenbare Reduktionsfunktion $f$. Sei nun mittels KRT
$ phi_e (t) = h(e,t) = cases(0 & quad U'(f(e), f(e), t) = 0, bot & quad "sonst") $
Ist $e in T$ so gilt $f(e) in H_e$ es gibt also ein $t$ mit $U'(f(e), f(e), t) > 0$, also ein $phi_e (t) = bot$, somit gilt $e in.not T$. \
Ist $e in.not T$ so gilt $f(e) in.not H_e$ somit $forall t in NN: U'(f(e), f(e), t) = 0$,$ phi_e$ also konstante 0-Funktion, daher $e in T$.

== Einordnung in arithmetische Hierarchie
=== Gleichheitsproblem $E = {chevron.l p, q, x chevron.r | phi_p (x) = phi_q (x)}$
$ (forall t in NN: U'(p,x,t) = U'(p,x,t) = 0) or (exists t' in NN: U'(p,x,t') = U'(p,x,t') != 0) $ 
daher $E in Sigma_2 inter Pi_2$.

=== Warum ist co-RE $= Pi_1$?
1. co-RE $supset.eq Pi_1$ \
Sei $A in Pi_1$, dann gibt es ein totales, berechenbares Prädikat $Q$ mit
$ forall x in NN : x in A <=> forall y in NN : Q(x, y) $
Somit existiert ein berechenbares $hat(chi)_overline(A) $ mit
$ hat(chi)_overline(A) = cases(1 & quad exists y in NN : not Q(x,y), bot & quad "sonst") $ 
Somit $A in$ co-RE. \
2. co-RE $subset.eq Pi_1$ \
Sei $A in $ co-RE, so gibt es ein berechenbares $hat(chi)_overline(A)$. Somit folgt
$ x in A <=> x in.not overline(A) <=> hat(chi)_overline(A) (x) = bot <=> forall y in NN: Q(x,y) $
Somit gilt co-RE $= Pi_2$.
#pagebreak() 

=== Landau-Symbole
$f,g: NN^+ -> RR^+$ \
$f in O(g) <=> exists c, n_0 forall n >= n_0: f(n) <= c dot g(n)$ \
$f in Omega(g) <=> g in O(f)$ \
$f in Theta(g) <=> f in O(g) and f in Omega(g)$ \
$f in o(g) <=> forall c exists n_0 forall n >= n_0 f(n) < c dot g(n)$ \
$f in omega(g) <=> g in o(f) $ \

=== RAM-Modell #text(weight: 400, "= wie normale Programmiersprache")
- Random Access, Pointers, $+, -, times, div$ in konstanter Zeit (Kostenmaß abhängig)

=== Kostenmaße 
- *Uniformes Kostenmaß*: pro Zuweisung *ein Schritt*
- *Logarithmisches Kostenmaß*: pro Bit ein Schritt ($log(z)$)
$=>$ In Praxis wird uniformes Kostenmaß verwendet

=== Turingmaschine
$L(M)$ = Menge der Sprachen die von Turing $M$ akzeptiert wird

=== Zeitkomplexität 
