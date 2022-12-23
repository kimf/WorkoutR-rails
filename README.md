# TODO

If another workout than planned was completed, should we add it, and somehow mark the other ones as "skipped"?
To be able to say X amount of planned was completed, and Y extra
Make distinction to "skipped because of other workout" and "skipped because of illnes/lazyness/sickness"
To mark one as skipped, reason has to be given!

## Notes:

- 10 Jan
  Plan = Running 60 mins Intervals + 20 min Strength
  Actual = 45 min Skiing in Rudan with Bolle and Daniel

* Activity syncing

  - If strava activity not pairable - send push with link to page to either add it as a new unplanned/extra/rescheduled workout-
  - Create this page!
    If rescheduled, move the planned workout and mark it as rescheduled

  - Each sunday, check for workouts that haven't been completed and send push with link to mark them as skipped, with a reason for why.

* Kalender
  Blandning mellan Garmin/Runkeeper/Runtastic/Strava/Trainingpeaks

  - Göra schema via dra/släpp samt "snabbinmatning"
  - Modal som tvingar en att svara på varför man inte gjort något som skulle ha gjorts / eller ladda upp tcx fil

- Importera tcx-filer, beräkna TSS och andra roliga saker
  kolla på https://github.com/kimf/stravistix

- Lopp i Sidebar, med mål och resultat. Länk till Strava?

- Statistik-sida
  Show: Last 30 days, 3 months, 6 months, year, lifetime, custom
  Automatic Compare agains same back-period (as Telia Shopper X)
  Sum by Day/Week/Month, stacked bar with different color per activity-type
  Filter on activity-type

  - Distance
  - Duration
  - Calories
  - Weight vs Calories burned

- Aktivitets-lista med detalj-vy
  - Karta - HR (med analys över tid spenderad i zoner) - Pace (analys över tid spenderad i zoner) - Elevation - Calories burned - Segments??

# MIGHT DO

- Sleep/Steps/Annan info från Health/Gyroscope/Moves?

# WANT TO DO, BUT PROBABLY WONT DO

- App för att regga pass via apple watch/mobil med GPS+HR+Calories+Elevation m.m

https://help.trainingpeaks.com/hc/en-us/articles/204071944

# Training Stress Score

It all starts with your Training Stress Score (TSS). Every workout you do is assigned a training stress score based on duration and how intense the workout was relative to your threshold. Here we see a red dot representing each day’s workouts for an entire season. The red dots at the bottom of the screen indicates that there was no workout that day.

# Fatigue (Acute Training Load, or ATL)

By taking an exponentially weighted average of that stress from the past 7 days we are able to calculate your Fatigue, or an estimate of your fatigue accounting for the workouts you have done in the past two weeks. Here you can see on days with a workout with a high training stress score the Fatigue climbs sharply in response. You do a hard workout today and you will feel it in the coming days.

# Fitness (Chronic Training Load, or CTL)

We also use each day’s TSS to calculate Fitness. Fitness is an exponentially weighted average of the last 42 days of training and reflects the training you have done over the last 3 months. However, the workouts you did 15 days ago will impact your fitness more than the workouts you did 6 weeks ago. You may notice that as Fitness goes up so does Fatigue, only at a greater rate. The PMC helps to tell a story, consistent training is marked by a steady rise in Fatigue and Fitness where as a sharp drop might indicate time off due to sickness or injury.

# Form (Training Stress Balance, or TSB)

Finally, by subtracting yesterday’s Fatigue from yesterday’s Fitness we come up with the yellow line, or the Form. Just because you are fit does not mean that you are ready to race at your best. A negative Form would indicate that you are carrying a lot of fatigue and are not on form. However, by tapering you can shed fatigue at a greater rate than you lose fitness and come into form on the day that matters most… race day! In short, Fitness minus Fatigue equals Form.

There is no single Form that works for every athlete, but as a general rule of thumb you would want to be slightly negative up to positive 25. If your Form becomes too high it may indicate that you tapered too much and have lost fitness.

Looking at Form can also give you clues into how much stress you can handle before getting sick or injured. Going forward you would know to take some recovery days prior to reaching that negative a number.

---

# The formula for TSS is:

TSS = (sec x NP® x IF®)/(FTP x 3600) x 100

where:
“sec” is duration of the workout in seconds,
“NP” is Normalized Power® (don’t worry about this for now),
“IF” is Intensity Factor® (a percentage of your FTP; in other words how intense the effort was),
“FTP” is Functional Threshold Power (your best average power for a one-hour race or test),
and “3600” is the number of seconds in an hour.

# Stuff from Trainingpeaks I like

- Events and APT + Planned CTL value/graph for that event. Show all events maybe?
- Today + Tomorrow
- Fitness ramp rates 7 days, 28 days, 90 days, 365 days
- Calendar with Green/Yellow/Red and summaries + TSS, as well as ATP info for that week
- Dashboard with a lot of data and drill downs
- ATP, all of it!
