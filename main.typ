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
$<=>$ $A$ ist rekursiv aufzählbar $<=>$ $exists f in P: d o m(f) "/" i m g (f) = A$

=== Reduktion
$ A <= B <=> (forall x in NN: x in A <=> f(x) in B) $
"$A$ auf $B$ reduzierbar, $f$ die Reduktion von $A$ auf $B$"
- reflexiv ($A <= A$), transitiv, *aber nicht*: total, antisymmetrisch
Ist $A$ nicht semi-/entscheidbar, dann auch $B$ nicht. \
Ist $B$ semi-/entscheidbar, dann auch $A$.

=== Härte und Vollständigkeit

- $A_0$ ist *schwer* für $X$: $forall A in X: A <= A_0$
- $A_0$ ist *vollständig* für $X$: $"schwer" + A_0 in X$
$=>$ $H_e$ ist RE-vollständig

=== $s_m^n$ Theorem

$ phi_e(y,z) = phi_(s_m^n (e, y)) (z) $

=== Kleene's Rekursionssatz
Für jedes $f in P, f: NN^2 -> NN$ gibt es eine Gödelnummer $g$ sodass
$ forall z in NN: phi_g(z) = f(g, z) $

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
  $T = {e | e "ist total"}$ \
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
