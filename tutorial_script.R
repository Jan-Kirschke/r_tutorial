# ========= Datenmodellierung und Transformation ===============================

# Datentypen
numeric_var <- 42.5                    # Numerische Variable
integer_var <- 42L                     # Integer
character_var <- "text"                # Text/String
logical_var <- TRUE                    # Boolean
factor_var <- factor(c("a","b","c"))   # Kategorische Variable
date_var <- as.Date("2024-01-01")     # Datum

# Vektoren erstellen
vektor <- c(1, 2, 3, 4, 5)
namen_vektor <- c(name1="Wert1", name2="Wert2")
sequence <- seq(1, 10, by=2)           # Sequenz von 1 bis 10 in 2er Schritten
wiederholung <- rep(1:3, times=3)      # Wiederholung von Werten

# Matrix erstellen
matrix_data <- matrix(
  data = 1:12,                       # Daten
  nrow = 3,                          # Anzahl Zeilen
  ncol = 4,                          # Anzahl Spalten
  byrow = TRUE                       # Zeilenweise füllen
)

# Dataframe erstellen
df <- data.frame(
  spalte1 = c(1,2,3),
  spalte2 = c("a","b","c"),
  stringsAsFactors = FALSE           # Strings nicht als Faktoren
)

# Liste erstellen
liste <- list(
  num = 1:5,
  text = "Hello",
  df = data.frame(x=1:3, y=4:6)
)

# ======== Datentransformation =================================================

# Subset
subset_data <- subset(df, spalte1 > 2)
vektor_subset <- vektor[vektor > 3]
matrix_subset <- matrix_data[1:2, 2:3]

# Daten kombinieren
rbind_data <- rbind(df1, df2)          # Zeilen zusammenfügen
cbind_data <- cbind(df1, df2)          # Spalten zusammenfügen
merge_data <- merge(df1, df2, by="id") # Nach Schlüssel zusammenführen

# Daten umformen
t_matrix <- t(matrix_data)             # Matrix transponieren
reshape_data <- reshape(                # Daten umformen
  data = df,
  direction = "long",                # "long" oder "wide"
  varying = c("var1","var2"),
  v.names = "value",
  timevar = "time",
  times = 1:2
)

# Aggregation
aggregate(var ~ group, data=df, FUN=mean)
tapply(df$var, df$group, mean)

# ======== Grundlegende Operationen ============================================

# Mathematische Operationen
sum_var <- sum(vektor)                 # Summe
mean_var <- mean(vektor)               # Mittelwert
median_var <- median(vektor)           # Median
sd_var <- sd(vektor)                   # Standardabweichung
var_var <- var(vektor)                 # Varianz
range_var <- range(vektor)             # Minimum und Maximum
quantile_var <- quantile(vektor)       # Quartile

# Logische Operationen
is.na(vektor)                          # NA prüfen
complete.cases(df)                     # Vollständige Zeilen
any(vektor > 3)                        # Mindestens ein TRUE
all(vektor > 0)                        # Alle TRUE

# String Operationen
paste("a", "b", sep=" ")              # Strings verbinden
substr("text", 1, 2)                  # Teilstring
gsub("alt", "neu", "text")            # Text ersetzen
tolower("TEXT")                       # Kleinbuchstaben
toupper("text")                       # Großbuchstaben

# Datums Operationen
as.Date("2024-01-01")                 # String zu Datum
format(date_var, "%Y-%m-%d")          # Datum formatieren
difftime(date1, date2, units="days")  # Zeitdifferenz

# Fehlende Werte behandeln
na.omit(df)                           # NA entfernen
is.na(df)                             # NA identifizieren
df[is.na(df)] <- 0                    # NA durch 0 ersetzen

# Datentyp Konvertierung
as.numeric(character_var)
as.character(numeric_var)
as.factor(character_var)
as.Date(character_var)

# Datenstruktur Information
str(df)                               # Struktur anzeigen
summary(df)                           # Zusammenfassung
head(df)                              # Erste Zeilen
tail(df)                              # Letzte Zeilen
dim(df)                               # Dimensionen
names(df)                             # Spaltennamen
rownames(df)                          # Zeilennamen
colnames(df)                          # Spaltennamen

# Speichern und Laden
write.csv(df, "datei.csv")            # CSV speichern
read.csv("datei.csv")                 # CSV laden
save(objekt, file="datei.RData")      # R-Objekt speichern
load("datei.RData")                   # R-Objekt laden



# ========== Säulendiagramm ====================================================
# Grundlegendes Säulendiagramm erstellen
barplot(
  height = values,      # Höhe der einzelnen Säulen
  names.arg = labels,   # Beschriftung unter den Säulen
  axis.lty = "solid",   # Durchgezogene Achsenlinien  
  xlab = "Kategorien",  # Beschriftung der X-Achse
  ylab = "Werte",       # Beschriftung der Y-Achse
  col = colors,         # Farben der Säulen
  border = NA,          # Kein Rahmen um die Säulen
  space = 0.3,          # Abstand zwischen den Säulen
  main = "Mein Säulendiagramm", # Titel des Diagramms
  ylim = c(0, max(values) * 1.2), # Y-Achse geht 20% über Maximum
  las = 1,             # Horizontale Beschriftungen
  beside = TRUE,       # Nebeneinander stehende Säulen bei Matrizen
  horiz = FALSE,       # Vertikale Säulen
  density = NULL,      # Keine Schraffur
  angle = 45,          # Winkel der Schraffur (falls density gesetzt)
  axes = TRUE,         # Achsen anzeigen
  add = FALSE,         # Nicht zu existierendem Plot hinzufügen
  cex.names = 1,       # Schriftgröße der Säulenbeschriftungen
  cex.axis = 1         # Schriftgröße der Achsenbeschriftungen
)

# Legende zum Säulendiagramm hinzufügen
legend(
  "topright",          # Position oben rechts
  legend = labels,     # Text in der Legende
  fill = colors,       # Farben in der Legende
  title = "Kategorien", # Titel der Legende
  bty = "n"            # Kein Rahmen um die Legende
)

# Optional: Werte über den Säulen anzeigen
text(
  x = bp,              # X-Koordinaten (von barplot zurückgegeben)
  y = values,          # Y-Koordinaten
  labels = values,     # Anzuzeigende Texte
  pos = 3,             # Position über den Säulen
  cex = 0.8            # Schriftgröße
)

# Optional: Gitternetz hinzufügen
grid(nx = NA, ny = NULL)

# Optional: Rahmen um den Plot
box()

# Optional: Horizontale Linie bei y=0
abline(h = 0)

# Optional: Grafikparameter setzen
par(
  mar = c(5,4,4,2),   # Ränder
  bg = "white",        # Hintergrundfarbe
  fg = "black",        # Vordergrundfarbe
  family = "sans",     # Schriftart
  cex = 1             # Generelle Schriftgröße
)



# ======== Plot Funktion =======================================================
plot(
  x,                    # X-Werte
  y,                    # Y-Werte
  type = "p",          # Art des Plots ("p" = Punkte, "l" = Linien, "b" = beides)
  main = "Mein Plot",  # Titel
  sub = "Untertitel",  # Untertitel
  xlab = "X-Achse",    # X-Achsenbeschriftung
  ylab = "Y-Achse",    # Y-Achsenbeschriftung
  col = "black",       # Farbe der Datenpunkte
  pch = 19,            # Symbol für Datenpunkte (0-25)
  cex = 1,             # Größe der Datenpunkte
  lwd = 1,             # Linienbreite
  lty = "solid",       # Linientyp ("solid", "dashed", "dotted", etc.)
  xlim = c(min, max),  # Grenzen der X-Achse
  ylim = c(min, max),  # Grenzen der Y-Achse
  axes = TRUE,         # Achsen anzeigen
  frame.plot = TRUE,   # Rahmen um Plot
  ann = TRUE,          # Beschriftungen anzeigen
  asp = NA,            # Seitenverhältnis
  log = "",            # Logarithmische Achsen ("x", "y", "xy")
  las = 1,             # Ausrichtung der Achsenbeschriftungen
  cex.main = 1.2,      # Größe des Haupttitels
  cex.sub = 1,         # Größe des Untertitels
  cex.lab = 1,         # Größe der Achsenbeschriftungen
  cex.axis = 1,        # Größe der Achsenwerte
  col.main = "black",  # Farbe des Haupttitels
  col.sub = "black",   # Farbe des Untertitels
  col.lab = "black",   # Farbe der Achsenbeschriftungen
  col.axis = "black",  # Farbe der Achsenwerte
  bg = "white",        # Hintergrundfarbe
  panel.first = grid(), # Funktion die vor dem Plot ausgeführt wird
  panel.last = NULL    # Funktion die nach dem Plot ausgeführt wird
)

# Optional: Legende
legend(
  "topright",          # Position
  legend = c("Serie 1", "Serie 2"),  # Beschriftungen
  col = c("red", "blue"), # Farben
  pch = c(19, 19),     # Symbole
  lty = c(1, 1),       # Linientypen
  title = "Legende"    # Titel der Legende
)

# Optional: Zusätzliche Linien
abline(h = 0)           # Horizontale Linie bei y=0
abline(v = 0)           # Vertikale Linie bei x=0
grid()                  # Gitternetz

# Optional: Text hinzufügen
text(
  x,                  # X-Position
  y,                  # Y-Position
  labels = "Text",    # Text
  pos = 4,            # Position relativ zum Punkt
  offset = 0.5,       # Abstand zum Punkt
  cex = 1            # Textgröße
)

# Optional: Grafikparameter
par(
  mar = c(5,4,4,2),  # Ränder
  mfrow = c(1,1),    # Anordnung mehrerer Plots
  oma = c(0,0,0,0)   # Äußere Ränder
)


# ======== Datenvisualisierung erweitert =====================================

# Boxplot
boxplot(
  werte ~ gruppen,
  data = df,
  main = "Boxplot",
  col = "lightblue",
  notch = TRUE
)

# Histogramm
hist(
  x = werte,
  breaks = "sturges",
  freq = TRUE,
  col = "lightblue",
  main = "Histogramm"
)

# Streudiagramm-Matrix
pairs(df[,c("var1","var2","var3")])

# QQ-Plot
qqnorm(werte)
qqline(werte)







# ======== Statistische Tests ==============================================

# t-Test für Mittelwertvergleich zweier Gruppen
# H0: Mittelwerte sind gleich, H1: Mittelwerte unterscheiden sich
# Gibt t-Wert, Freiheitsgrade und p-Wert zurück
t.test(gruppe1, gruppe2, 
       alternative = "two.sided",     # zweiseitiger Test
       paired = FALSE,                # unabhängige Stichproben
       var.equal = FALSE)             # keine Varianzgleichheit angenommen

# Chi-Quadrat-Test für Unabhängigkeit kategorischer Variablen
# H0: Variablen sind unabhängig, H1: Variablen sind abhängig
# Erstellt Kontingenztabelle und führt Test durch
chisq.test(table(var1, var2),
           correct = TRUE)            # Yates-Korrektur anwenden

# Varianzanalyse (ANOVA) für Mittelwertvergleich mehrerer Gruppen
# H0: Alle Gruppenmittelwerte sind gleich
# H1: Mindestens ein Mittelwert unterscheidet sich
aov_model <- aov(werte ~ gruppen, data = df)
summary(aov_model)                    # ANOVA Tabelle anzeigen
TukeyHSD(aov_model)                  # Post-hoc Test für paarweise Vergleiche

# Korrelationstest nach Pearson
# Prüft linearen Zusammenhang zwischen Variablen
# Gibt Korrelationskoeffizient und p-Wert zurück
cor.test(var1, var2,
         method = "pearson",          # Pearson Korrelation
         alternative = "two.sided")   # zweiseitiger Test

# ======== Regressionsanalyse ============================================

# Einfache lineare Regression
# Modelliert linearen Zusammenhang zwischen einer abhängigen und einer unabhängigen Variable
lm_model <- lm(y ~ x, data = df)     # y ist abhängige Variable
summary(lm_model)                     # Modellzusammenfassung mit R², F-Test, t-Tests
confint(lm_model)                     # Konfidenzintervalle für Koeffizienten
predict(lm_model, newdata)            # Vorhersagen für neue Daten

# Diagnostische Plots für lineares Modell
par(mfrow=c(2,2))                     # 2x2 Plot-Layout
plot(lm_model)                        # Residuen vs. Fitted, Q-Q-Plot, Scale-Location, Leverage

# Multiple Regression mit mehreren Prädiktoren
# Modelliert Zusammenhang zwischen einer abhängigen und mehreren unabhängigen Variablen
multi_model <- lm(y ~ x1 + x2 + x3,   # Haupteffekte
                  data = df)
multi_model2 <- lm(y ~ x1 * x2 + x3,  # Interaktionseffekt zwischen x1 und x2
                   data = df)

# ======== Daten Cleaning ===============================================

# Duplikate in Datensatz identifizieren und entfernen
duplicated(df)                        # Gibt TRUE für duplizierte Zeilen zurück
unique(df)                            # Entfernt alle Duplikate
df[!duplicated(df),]                  # Behält nur erste Instanz jeder Zeile

# Ausreißer-Analyse
# Boxplot-Methode: Werte außerhalb 1.5*IQR
boxplot.stats(werte)$out              # Gibt Ausreißer zurück
# Z-Score Methode: Werte > 3 Standardabweichungen vom Mittelwert
outliers <- df[abs(scale(df$werte)) > 3,]

# Daten standardisieren/normalisieren
scale(numeric_var)                    # Z-Standardisierung: (x-mean)/sd
# Min-Max Normalisierung auf [0,1]
normalize <- function(x) {
  (x - min(x)) / (diff(range(x)))   # (x-min)/(max-min)
}

# ======== Fortgeschrittene Datenmanipulation ==========================

# Apply-Funktionen Familie für effiziente Datenverarbeitung
apply(matrix, 1, mean)                # Mittelwert für jede Zeile
apply(matrix, 2, sum)                 # Summe für jede Spalte
lapply(liste, mean)                   # Wendet Funktion auf jedes Listenelement an
sapply(liste, mean)                   # Wie lapply, aber vereinfacht Output
mapply(function, x, y)                # Mehrere Argumente möglich

# Datums-Manipulation mit lubridate Paket
library(lubridate)
ymd("2024-01-01")                     # String zu Datum konvertieren
month(date_var)                       # Monat extrahieren
year(date_var)                        # Jahr extrahieren
days_between <- interval(date1, date2) # Zeitintervall berechnen

# ======== Fortgeschrittene Plots mit ggplot2 =========================

# Scatterplot mit Regressionslinie und Themes
library(ggplot2)
ggplot(df, aes(x=x, y=y)) +           # Grundlegendes Plot-Objekt
  geom_point(alpha=0.5) +           # Punkte mit Transparenz
  geom_smooth(method="lm",          # Regressionslinie
              se=TRUE) +            # mit Konfidenzintervall
  theme_minimal() +                 # Minimalistisches Design
  labs(title="Titel",              # Beschriftungen
       x="X-Achse",
       y="Y-Achse")

# ======== Daten Import/Export erweitert ==============================

# Excel-Dateien einlesen
library(readxl)
read_excel("datei.xlsx",              # Dateiname
           sheet = 1,                 # Arbeitsblatt
           col_names = TRUE)          # Erste Zeile als Überschriften

# JSON-Daten verarbeiten
library(jsonlite)
fromJSON("datei.json")                # JSON zu R-Objekt
toJSON(df, pretty=TRUE)               # R-Objekt zu formatiertem JSON

# SQL-Datenbankverbindung
library(DBI)
library(RSQLite)
con <- dbConnect(SQLite(),            # Verbindung herstellen
                 "database.db")
dbWriteTable(con, "tabelle", df)      # Dataframe in Datenbank schreiben
dbDisconnect(con)                     # Verbindung schließen

# ======== Performance & Debugging ====================================

# Code-Performance messen
system.time({                         # Misst Ausführungszeit
  # Code hier
})
proc.time()                           # CPU-Zeit und verstrichene Zeit

# Debugging-Tools
debug(function)                       # Aktiviert Debugger für Funktion
browser()                             # Pausiert Ausführung
trace()                               # Überwacht Funktionsaufrufe

# ======== Error Handling ============================================

# Fehlerbehandlung mit tryCatch
tryCatch(
  expr = {
    # Hauptcode
    result <- riskyFunction()
  },
  error = function(e) {
    # Bei Fehler
    message("Fehler aufgetreten: ", e)
    return(NULL)
  },
  warning = function(w) {
    # Bei Warnung
    message("Warnung: ", w)
  },
  finally = {
    # Wird immer ausgeführt
    message("Ausführung beendet")
  }
)