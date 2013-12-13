#What 3 towns have the highest population of citizens that are 65 years and older?

  #SQL-
  SELECT geography, age_65_year_2005
  FROM town_health_records
  WHERE age_65_year_2005 IS NOT NULL
  AND geography != 'Massachusetts Total'
  ORDER BY age_65_year_2005 DESC;

         geography       | age_65_year_2005
  -----------------------+------------------
   Boston                |            59950
   Worcester             |            23062
   Springfield           |            18271

  #ActiveRelation-
  TownHealthRecord.select('geography, age_65_year_2005').where("age_65_year_2005 IS NOT NULL AND geography != 'Massachusetts Total'").order(age_65_year_2005: :desc).limit(3).map(&:geography)



#What 3 towns have the highest population of citizens that are 19 years and younger?

  #SQL-
  SELECT geography, age_019_year_2005
  FROM town_health_records
  WHERE age_019_year_2005 IS NOT NULL
  AND geography != 'Massachusetts Total'
  ORDER BY age_019_year_2005 DESC;

        geography       | age_019_year_2005
  -----------------------+-------------------
   Boston                |            131435
   Worcester             |             48217
   Springfield           |             47878

  #ActiveRelation-
  TownHealthRecord.select('geography, age_019_year_2005').where("age_65_year_2005 IS NOT NULL AND geography != 'Massachusetts Total'").order(age_65_year_2005: :desc).limit(3).map(&:geography)

  TownHealthRecord.select('geography, age_019_year_2005').where(["age_019_year_2005 IS NOT NULL and geography != ?", "Massachusetts Total"]).order(age_019_year_2005: :desc).limit(3)

#What 5 towns have the lowest per capita income?

  #SQL-
  SELECT geography,per_capita_income_year_2000
  FROM town_health_records
  WHERE per_capita_income_year_2000 IS NOT NULL
  AND geography != 'Massachusetts Total'
  ORDER BY per_capita_income_year_2000;

         geography       | per_capita_income_year_2000
  -----------------------+-----------------------------
   Monroe                |                       12400
   Lawrence              |                       13360
   Chelsea               |                       14628

  #ActiveRelation-
  TownHealthRecord.select('geography, per_capita_income_year_2000').where(["per_capita_income_year_2000 IS NOT NULL and geography != ?", "Massachusetts Total"]).order(:per_capita_income_year_2000).limit(5)

#Omitting Boston, Becket, and Beverly, what town has the highest percentage of teen births?

  #SQL-
  SELECT geography, pct_teen_births_20052008
  FROM town_health_records
  WHERE geography NOT IN ('Boston','Beverly','Becket','Massachusetts Total')
   AND pct_teen_births_20052008 is NOT NULL
  ORDER BY pct_teen_births_20052008 DESC;

         geography       | pct_teen_births_20052008
  -----------------------+--------------------------
   Holyoke               |                    23.27
   Springfield           |                    18.58
   Lawrence              |                    16.58

  #ActiveRelation-
  TownHealthRecord.select('geography, pct_teen_births_20052008').where(["pct_teen_births_20052008 IS NOT NULL and geography not in (?)", ["Massachusetts Total", "Boston", "Beverly", "Becket"]]).order(pct_teen_births_20052008: :desc).limit(5)

#Omitting Boston, what town has the highest number of infant mortalities?

  #SQL-
  SELECT geography, infant_mortality_rate_deaths_per_1000_live_births_20052008 inf_mortality
  FROM town_health_records
  WHERE geography NOT IN ('Boston','Massachusetts Total')
  AND infant_mortality_rate_deaths_per_1000_live_births_20052008 IS NOT NULL
  ORDER BY infant_mortality_rate_deaths_per_1000_live_births_20052008 DESC;

         geography       |  inf_mortality
  -----------------------+-------------------
   Gardner               |             12.44
   Dartmouth             |             11.79
   Marlborough           |             10.39

  #ActiveRelation-
  TownHealthRecord.select('geography, infant_mortality_rate_deaths_per_1000_live_births_20052008').where(["infant_mortality_rate_deaths_per_1000_live_births_20052008 IS NOT NULL and geography not in (?)", ["Massachusetts Total", "Boston"]]).order(infant_mortality_rate_deaths_per_1000_live_births_20052008: :desc).limit(1)


