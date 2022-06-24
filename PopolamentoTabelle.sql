INSERT ALL
INTO Credenziali VALUES ('umberto.testa', '&Ts5Y*VJmL2o')
INTO Credenziali VALUES ('doriana.bianchi', '3TVnpjQ&BGlo')
INTO Credenziali VALUES ('giacinto.montanari', 'bmMRp#tCyDkP')
INTO Credenziali VALUES ('alighieri.gallo', 'vOAQAwy%uUjW')
INTO Credenziali VALUES ('santo.lombardo', '&zkr%@NJ$N9s')
INTO Credenziali VALUES ('marina.ferrara', 'mBn#s6X%RSiq')
INTO Credenziali VALUES ('sesto.caputo', 'x&K@jzRLf*pz')
INTO Credenziali VALUES ('cleopatra.amato', 'V0nFAGoN^UV#')
INTO Credenziali VALUES ('germano.damico', 'fvaw0!oS3pE#')
INTO Credenziali VALUES ('nicoletta.monti', '%OZIC!AZANsg')
INTO Credenziali VALUES ('osea.martini', 'SkRY#FHsH6tO')
INTO Credenziali VALUES ('gelsomina.sala', 'EliSY!zGicA^')
INTO Credenziali VALUES ('umberto.russo', '8IO$x!8$Tba%')
INTO Credenziali VALUES ('siro.santoro', 'zswM$8xH^w6%')
INTO Credenziali VALUES ('alberto.gentile', 'ZhI5c6eRY^c6')
INTO Credenziali VALUES ('eufemia.marchetti', 'AgU6v7rTU?b2')
INTO Credenziali VALUES ('mario.rossi', 'Bk!U^n5%*uxu')
INTO Credenziali VALUES ('giuseppe.verde', '9Wh9Pe#1GsXh')
INTO Credenziali VALUES ('maria.mazzini', 'W$lXkQrA*VNt')
INTO Credenziali VALUES ('marta.porzio', 'lJ*yquH$fLBk')
SELECT 1 FROM DUAL;

INSERT ALL
INTO Dipendente VALUES ('DUESAF55F52N289W', 'Umberto', 'Testa', DATE '1980-06-15', 'Via Emidio', '00189', 'Roma', 'umberto.testa')
INTO Dipendente VALUES ('KZLGDK32P62O335T', 'Doriana', 'Bianchi', DATE '1988-09-16', 'Piazza Eriberto', '22100', 'Como', 'doriana.bianchi')
INTO Dipendente VALUES ('KQWMYW14M46T912E', 'Giacinto', 'Montanari', DATE '1974-01-06', 'Via Napoli', '23900', 'Lecco', 'giacinto.montanari')
INTO Dipendente VALUES ('TYITHI81H72P241J', 'Alighieri', 'Gallo', DATE '1995-12-10', 'Via Cirino', '80126', 'Napoli', 'alighieri.gallo')
INTO Dipendente VALUES ('JQYGGW73B53M696N', 'Santo', 'Lombardo', DATE '2000-01-03', 'Via Karim', '94100', 'Enna', 'santo.lombardo')
INTO Dipendente VALUES ('PUVLVZ97F09R237B', 'Marina', 'Ferrara', DATE '1976-02-11', 'Via Martini', '12100', 'Cuneo', 'marina.ferrara')
INTO Dipendente VALUES ('YFBLRF48O55Z048M', 'Sesto', 'Caputo', DATE '1986-02-11', 'Via Miriana', '06127', 'Perugia', 'sesto.caputo')
INTO Dipendente VALUES ('UWWKVF45W14S828U', 'Cleopatra', 'Amato', DATE '1990-11-23', 'Via Carmelo', '53100', 'Siena', 'cleopatra.amato')
INTO Dipendente VALUES ('HCOWJZ02T47V573F', 'Germano', 'Damico', DATE '1992-10-04', 'Via Silvestri', '80126', 'Napoli', 'germano.damico')
INTO Dipendente VALUES ('GZTZTI69R80D542D', 'Nicoletta', 'Monti', DATE '1996-09-08', 'Via Roma', '38122', 'Trento', 'nicoletta.monti')
INTO Dipendente VALUES ('UXETBB25N85F898Y', 'Osea', 'Martini', DATE '1960-06-15', 'Via Piererminio', '46100', 'Mantova', 'osea.martini')
INTO Dipendente VALUES ('SCLOHS15F88Z768W', 'Gelsomina', 'Sala', DATE '1995-02-20', 'Via Parisi', '57122', 'Livorno', 'gelsomina.sala')
INTO Dipendente VALUES ('ZMHTFC56S72T119B', 'Umberto', 'Russo', DATE '2000-12-20', 'Via Eustacchio', '07026', 'Olbia', 'umberto.russo')
INTO Dipendente VALUES ('PKVEXQ30A01Z162C', 'Siro', 'Santoro', DATE '1982-10-11', 'Via Martino', '35127', 'Padova', 'siro.santoro')
INTO Dipendente VALUES ('DPZOCJ48G58T201C', 'Alberto', 'Gentile', DATE '1970-01-18', 'Piazza Gilda', '31100', 'Treviso', 'alberto.gentile')
INTO Dipendente VALUES ('HBGVQP27H84A198C', 'Eufemia', 'Marchetti', DATE '2003-02-20', 'Via Verde', '57122', 'Livorno', 'eufemia.marchetti')
INTO Dipendente VALUES ('CJCTBV03C75B257C', 'Mario', 'Rossi', DATE '2001-07-21', 'Via Niccolò', '35127', 'Padova', 'mario.rossi')
INTO Dipendente VALUES ('RKNIVQ17Q56K462W', 'Giuseppe', 'Verde', DATE '2002-04-25', 'Via Rizzo', '53100', 'Siena', 'giuseppe.verde')
INTO Dipendente VALUES ('JHMDHM13R67X714P', 'Maria', 'Mazzini', DATE '2000-09-15', 'Via Liberti', '38122', 'Trento', 'maria.mazzini')
INTO Dipendente VALUES ('DOSLHP83T20C898N', 'Marta', 'Porzio', DATE '1999-01-05', 'Via Tinckel', '06127', 'Perugia', 'marta.porzio')
SELECT 1 FROM DUAL;

INSERT ALL
INTO Presenza VALUES (TO_TIMESTAMP('2021-07-21 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-07-21 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'DUESAF55F52N289W')
INTO Presenza VALUES (TO_TIMESTAMP('2021-08-23 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-08-23 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'DUESAF55F52N289W')
INTO Presenza VALUES (TO_TIMESTAMP('2021-09-08 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-09-08 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'DUESAF55F52N289W')
INTO Presenza VALUES (TO_TIMESTAMP('2021-11-01 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-11-01 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'KZLGDK32P62O335T')
INTO Presenza VALUES (TO_TIMESTAMP('2021-11-02 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-11-02 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'KZLGDK32P62O335T')
INTO Presenza VALUES (TO_TIMESTAMP('2021-11-05 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-11-05 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'KZLGDK32P62O335T')
INTO Presenza VALUES (TO_TIMESTAMP('2021-12-29 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-12-29 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'KQWMYW14M46T912E')
INTO Presenza VALUES (TO_TIMESTAMP('2022-01-10 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-01-10 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'KQWMYW14M46T912E')
INTO Presenza VALUES (TO_TIMESTAMP('2022-02-03 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-02-03 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'KQWMYW14M46T912E')
INTO Presenza VALUES (TO_TIMESTAMP('2022-02-16 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-02-16 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'TYITHI81H72P241J')
INTO Presenza VALUES (TO_TIMESTAMP('2022-02-23 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-02-23 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'TYITHI81H72P241J')
INTO Presenza VALUES (TO_TIMESTAMP('2022-03-14 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-03-14 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'TYITHI81H72P241J')
INTO Presenza VALUES (TO_TIMESTAMP('2022-03-16 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-03-16 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'JQYGGW73B53M696N')
INTO Presenza VALUES (TO_TIMESTAMP('2022-04-29 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-04-29 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'JQYGGW73B53M696N')
INTO Presenza VALUES (TO_TIMESTAMP('2022-06-06 09:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-06-06 18:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'JQYGGW73B53M696N')
INTO Presenza VALUES (TO_TIMESTAMP('2022-06-08 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-06-08 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PUVLVZ97F09R237B')
INTO Presenza VALUES (TO_TIMESTAMP('2022-06-14 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-06-14 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PUVLVZ97F09R237B')
INTO Presenza VALUES (TO_TIMESTAMP('2022-06-20 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-06-20 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PUVLVZ97F09R237B')
INTO Presenza VALUES (TO_TIMESTAMP('2022-06-21 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-06-21 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'YFBLRF48O55Z048M')
INTO Presenza VALUES (TO_TIMESTAMP('2022-06-27 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-06-27 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'YFBLRF48O55Z048M')
INTO Presenza VALUES (TO_TIMESTAMP('2022-07-04 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-07-04 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'YFBLRF48O55Z048M')
INTO Presenza VALUES (TO_TIMESTAMP('2022-08-05 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-08-05 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'UWWKVF45W14S828U')
INTO Presenza VALUES (TO_TIMESTAMP('2022-08-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-08-15 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'UWWKVF45W14S828U')
INTO Presenza VALUES (TO_TIMESTAMP('2022-10-13 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-10-13 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'UWWKVF45W14S828U')
INTO Presenza VALUES (TO_TIMESTAMP('2022-12-02 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-12-02 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'HCOWJZ02T47V573F')
INTO Presenza VALUES (TO_TIMESTAMP('2021-07-23 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-07-23 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'HCOWJZ02T47V573F')
INTO Presenza VALUES (TO_TIMESTAMP('2021-07-30 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-07-30 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'HCOWJZ02T47V573F')
INTO Presenza VALUES (TO_TIMESTAMP('2021-10-04 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-10-04 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'GZTZTI69R80D542D')
INTO Presenza VALUES (TO_TIMESTAMP('2021-10-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-10-15 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'GZTZTI69R80D542D')
INTO Presenza VALUES (TO_TIMESTAMP('2021-10-22 10:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-10-22 19:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'GZTZTI69R80D542D')
INTO Presenza VALUES (TO_TIMESTAMP('2021-11-02 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-11-02 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'UXETBB25N85F898Y')
INTO Presenza VALUES (TO_TIMESTAMP('2021-11-17 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2021-11-17 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'UXETBB25N85F898Y')
INTO Presenza VALUES (TO_TIMESTAMP('2022-01-04 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-01-04 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'UXETBB25N85F898Y')
INTO Presenza VALUES (TO_TIMESTAMP('2022-01-12 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-01-12 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SCLOHS15F88Z768W')
INTO Presenza VALUES (TO_TIMESTAMP('2022-02-08 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-02-08 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SCLOHS15F88Z768W')
INTO Presenza VALUES (TO_TIMESTAMP('2022-02-14 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-02-14 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'SCLOHS15F88Z768W')
INTO Presenza VALUES (TO_TIMESTAMP('2022-03-14 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-03-14 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ZMHTFC56S72T119B')
INTO Presenza VALUES (TO_TIMESTAMP('2022-04-12 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-04-12 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ZMHTFC56S72T119B')
INTO Presenza VALUES (TO_TIMESTAMP('2022-04-19 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-04-19 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'ZMHTFC56S72T119B')
INTO Presenza VALUES (TO_TIMESTAMP('2022-06-07 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-06-07 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PKVEXQ30A01Z162C')
INTO Presenza VALUES (TO_TIMESTAMP('2022-06-23 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-06-23 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PKVEXQ30A01Z162C')
INTO Presenza VALUES (TO_TIMESTAMP('2022-07-11 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-07-11 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'PKVEXQ30A01Z162C')
INTO Presenza VALUES (TO_TIMESTAMP('2022-07-19 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-07-19 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'DPZOCJ48G58T201C')
INTO Presenza VALUES (TO_TIMESTAMP('2022-09-21 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-09-21 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'DPZOCJ48G58T201C')
INTO Presenza VALUES (TO_TIMESTAMP('2022-10-17 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-10-17 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'DPZOCJ48G58T201C')
INTO Presenza VALUES (TO_TIMESTAMP('2022-10-17 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-10-17 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'CJCTBV03C75B257C')
INTO Presenza VALUES (TO_TIMESTAMP('2022-10-17 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-10-17 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'CJCTBV03C75B257C')
INTO Presenza VALUES (TO_TIMESTAMP('2022-10-17 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-10-17 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'CJCTBV03C75B257C')
INTO Presenza VALUES (TO_TIMESTAMP('2022-10-17 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-10-17 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'RKNIVQ17Q56K462W')
INTO Presenza VALUES (TO_TIMESTAMP('2022-10-17 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-10-17 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'RKNIVQ17Q56K462W')
INTO Presenza VALUES (TO_TIMESTAMP('2022-10-17 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-10-17 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'RKNIVQ17Q56K462W')
INTO Presenza VALUES (TO_TIMESTAMP('2022-10-17 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-10-17 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'JHMDHM13R67X714P')
INTO Presenza VALUES (TO_TIMESTAMP('2022-10-17 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-10-17 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'JHMDHM13R67X714P')
INTO Presenza VALUES (TO_TIMESTAMP('2022-10-17 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-10-17 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'JHMDHM13R67X714P')
INTO Presenza VALUES (TO_TIMESTAMP('2022-10-17 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-10-17 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'DOSLHP83T20C898N')
INTO Presenza VALUES (TO_TIMESTAMP('2022-10-17 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-10-17 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'DOSLHP83T20C898N')
INTO Presenza VALUES (TO_TIMESTAMP('2022-10-17 14:00:00', 'YYYY-MM-DD HH24:MI:SS'), TO_TIMESTAMP('2022-10-17 21:00:00', 'YYYY-MM-DD HH24:MI:SS'), 'DOSLHP83T20C898N')
SELECT 1 FROM DUAL;

INSERT ALL
INTO Stipendio VALUES (1500.50, 200.00, DATE '2022-01-10', 'DUESAF55F52N289W')
INTO Stipendio VALUES (1500.50, 200.00, DATE '2022-02-10', 'DUESAF55F52N289W')
INTO Stipendio VALUES (1500.50, 200.00, DATE '2022-03-10', 'DUESAF55F52N289W')
INTO Stipendio VALUES (1400.20, 100.25, DATE '2022-01-10', 'KZLGDK32P62O335T')
INTO Stipendio VALUES (1400.20, 100.25, DATE '2022-02-10', 'KZLGDK32P62O335T')
INTO Stipendio VALUES (1400.20, 100.25, DATE '2022-03-10', 'KZLGDK32P62O335T')
INTO Stipendio VALUES (2550.55, 150.20, DATE '2022-01-10', 'KQWMYW14M46T912E')
INTO Stipendio VALUES (2550.55, 150.20, DATE '2022-02-10', 'KQWMYW14M46T912E')
INTO Stipendio VALUES (2550.55, 150.20, DATE '2022-03-10', 'KQWMYW14M46T912E')
INTO Stipendio VALUES (2000.10, 125.35, DATE '2022-01-10', 'TYITHI81H72P241J')
INTO Stipendio VALUES (2000.10, 125.35, DATE '2022-02-10', 'TYITHI81H72P241J')
INTO Stipendio VALUES (2000.10, 125.35, DATE '2022-03-10', 'TYITHI81H72P241J')
INTO Stipendio VALUES (1865.75, 200.00, DATE '2022-01-10', 'JQYGGW73B53M696N')
INTO Stipendio VALUES (1865.75, 200.00, DATE '2022-02-10', 'JQYGGW73B53M696N')
INTO Stipendio VALUES (1865.75, 200.00, DATE '2022-03-10', 'JQYGGW73B53M696N')
INTO Stipendio VALUES (1650.10, 250.30, DATE '2022-01-10', 'PUVLVZ97F09R237B')
INTO Stipendio VALUES (1650.10, 250.30, DATE '2022-02-10', 'PUVLVZ97F09R237B')
INTO Stipendio VALUES (1650.10, 250.30, DATE '2022-03-10', 'PUVLVZ97F09R237B')
INTO Stipendio VALUES (1800.80, 125.35, DATE '2022-01-10', 'YFBLRF48O55Z048M')
INTO Stipendio VALUES (1800.80, 125.35, DATE '2022-02-10', 'YFBLRF48O55Z048M')
INTO Stipendio VALUES (1800.80, 125.35, DATE '2022-03-10', 'YFBLRF48O55Z048M')
INTO Stipendio VALUES (2200.50, 100.25, DATE '2022-01-10', 'UWWKVF45W14S828U')
INTO Stipendio VALUES (2200.50, 100.25, DATE '2022-02-10', 'UWWKVF45W14S828U')
INTO Stipendio VALUES (2200.50, 100.25, DATE '2022-03-10', 'UWWKVF45W14S828U')
INTO Stipendio VALUES (1400.20, 150.20, DATE '2022-01-10', 'HCOWJZ02T47V573F')
INTO Stipendio VALUES (1400.20, 150.20, DATE '2022-02-10', 'HCOWJZ02T47V573F')
INTO Stipendio VALUES (1400.20, 150.20, DATE '2022-03-10', 'HCOWJZ02T47V573F')
INTO Stipendio VALUES (1865.75, 280.55, DATE '2022-01-10', 'GZTZTI69R80D542D')
INTO Stipendio VALUES (1865.75, 280.55, DATE '2022-02-10', 'GZTZTI69R80D542D')
INTO Stipendio VALUES (1865.75, 280.55, DATE '2022-03-10', 'GZTZTI69R80D542D')
INTO Stipendio VALUES (3000.45, 100.25, DATE '2022-01-10', 'UXETBB25N85F898Y')
INTO Stipendio VALUES (3000.45, 100.25, DATE '2022-02-10', 'UXETBB25N85F898Y')
INTO Stipendio VALUES (3000.45, 100.25, DATE '2022-03-10', 'UXETBB25N85F898Y')
INTO Stipendio VALUES (1050.10, 125.35, DATE '2022-01-10', 'SCLOHS15F88Z768W')
INTO Stipendio VALUES (1050.10, 125.35, DATE '2022-02-10', 'SCLOHS15F88Z768W')
INTO Stipendio VALUES (1050.10, 125.35, DATE '2022-03-10', 'SCLOHS15F88Z768W')
INTO Stipendio VALUES (1650.10, 200.00, DATE '2022-01-10', 'ZMHTFC56S72T119B')
INTO Stipendio VALUES (1650.10, 200.00, DATE '2022-02-10', 'ZMHTFC56S72T119B')
INTO Stipendio VALUES (1650.10, 200.00, DATE '2022-03-10', 'ZMHTFC56S72T119B')
INTO Stipendio VALUES (1500.50, 225.35, DATE '2022-01-10', 'PKVEXQ30A01Z162C')
INTO Stipendio VALUES (1500.50, 225.35, DATE '2022-02-10', 'PKVEXQ30A01Z162C')
INTO Stipendio VALUES (1500.50, 225.35, DATE '2022-03-10', 'PKVEXQ30A01Z162C')
INTO Stipendio VALUES (2200.50, 300.45, DATE '2022-01-10', 'DPZOCJ48G58T201C')
INTO Stipendio VALUES (2200.50, 300.45, DATE '2022-02-10', 'DPZOCJ48G58T201C')
INTO Stipendio VALUES (2200.50, 300.45, DATE '2022-03-10', 'DPZOCJ48G58T201C')
INTO Stipendio VALUES (1200.50, 100.45, DATE '2022-01-10', 'CJCTBV03C75B257C')
INTO Stipendio VALUES (1200.50, 100.45, DATE '2022-02-10', 'CJCTBV03C75B257C')
INTO Stipendio VALUES (1200.50, 100.45, DATE '2022-03-10', 'CJCTBV03C75B257C')
INTO Stipendio VALUES (2200.50, 200.45, DATE '2022-01-10', 'RKNIVQ17Q56K462W')
INTO Stipendio VALUES (2200.50, 200.45, DATE '2022-02-10', 'RKNIVQ17Q56K462W')
INTO Stipendio VALUES (2200.50, 200.45, DATE '2022-03-10', 'RKNIVQ17Q56K462W')
INTO Stipendio VALUES (2500.50, 300.45, DATE '2022-01-10', 'JHMDHM13R67X714P')
INTO Stipendio VALUES (2500.50, 300.45, DATE '2022-02-10', 'JHMDHM13R67X714P')
INTO Stipendio VALUES (2500.50, 300.45, DATE '2022-03-10', 'JHMDHM13R67X714P')
INTO Stipendio VALUES (2800.50, 400.45, DATE '2022-01-10', 'DOSLHP83T20C898N')
INTO Stipendio VALUES (2800.50, 400.45, DATE '2022-02-10', 'DOSLHP83T20C898N')
INTO Stipendio VALUES (2800.50, 400.45, DATE '2022-03-10', 'DOSLHP83T20C898N')

SELECT 1 FROM DUAL;

INSERT ALL
INTO Cassa VALUES ('01', 'SCLOHS15F88Z768W')
INTO Cassa VALUES ('02', 'KZLGDK32P62O335T')
INTO Cassa VALUES ('03', 'DUESAF55F52N289W')
INTO Cassa VALUES ('04', 'HCOWJZ02T47V573F')
INTO Cassa VALUES ('05', 'ZMHTFC56S72T119B')
INTO Cassa VALUES ('06', 'PKVEXQ30A01Z162C')
INTO Cassa VALUES ('07', 'DPZOCJ48G58T201C')
INTO Cassa VALUES ('08', 'GZTZTI69R80D542D')
INTO Cassa VALUES ('09', 'UWWKVF45W14S828U')
INTO Cassa VALUES ('10', 'YFBLRF48O55Z048M')
INTO Cassa VALUES ('11', 'CJCTBV03C75B257C')
INTO Cassa VALUES ('12', 'RKNIVQ17Q56K462W')
INTO Cassa VALUES ('13', 'JHMDHM13R67X714P')
INTO Cassa VALUES ('14', 'DOSLHP83T20C898N')
INTO Cassa VALUES ('15', 'PUVLVZ97F09R237B')
SELECT 1 FROM DUAL;

INSERT ALL
INTO Tessera VALUES ('48221', DATE '2022-10-01', 'umbertoconti@gmail.com')
INTO Tessera VALUES ('53126', DATE '2022-07-25', 'graziaamica@gmail.com')
INTO Tessera VALUES ('60881', DATE '2023-01-22', 'fatimapagano@gmail.com')
INTO Tessera VALUES ('66115', DATE '2022-06-30', 'raffaelegentile@gmail.com')
INTO Tessera VALUES ('33649', DATE '2022-09-14', 'graziaricci@gmail.com')
INTO Tessera VALUES ('52887', DATE '2023-03-05', 'manfredibellini@gmail.com')
INTO Tessera VALUES ('50566', DATE '2023-06-20', 'linoserra@gmail.com')
INTO Tessera VALUES ('53648', DATE '2022-12-18', 'benedettacaputo@gmail.com')
INTO Tessera VALUES ('23491', DATE '2022-03-15', 'bartolomeobianco@gmail.com')
INTO Tessera VALUES ('50864', DATE '2022-07-19', 'giuseppebarbieri@gmail.com')
INTO Tessera VALUES ('26588', DATE '2022-10-18', 'antoniobasile@gmail.com')
INTO Tessera VALUES ('29288', DATE '2023-01-01', 'carminepellegrino@gmail.com')
INTO Tessera VALUES ('91266', DATE '2022-11-21', 'andreaesposito@gmail.com')
INTO Tessera VALUES ('72185', DATE '2022-12-20', 'annaacerbi@gmail.com')
INTO Tessera VALUES ('73830', DATE '2023-02-13', 'elisaesposito@gmail.com')
SELECT 1 FROM DUAL;

INSERT ALL
INTO Scontrino VALUES ('015', DATE '2020-04-17', '05', '48221')
INTO Scontrino VALUES ('145', DATE '2020-06-02', '04', '53126')
INTO Scontrino VALUES ('425', DATE '2020-06-24', '02', '60881')
INTO Scontrino VALUES ('100', DATE '2021-02-17', '06', '66115')
INTO Scontrino VALUES ('001', DATE '2021-04-12', '02', '33649')
INTO Scontrino VALUES ('102', DATE '2021-10-04', '09', '52887')
INTO Scontrino VALUES ('253', DATE '2021-12-24', '06', '50566')
INTO Scontrino VALUES ('197', DATE '2022-02-09', '13', '53648')
INTO Scontrino VALUES ('173', DATE '2022-04-08', '11', '23491')
INTO Scontrino VALUES ('142', DATE '2022-05-12', '05', '50864')
INTO Scontrino VALUES ('075', DATE '2022-06-03', '07', '26588')
INTO Scontrino VALUES ('275', DATE '2022-07-06', '08', '29288')
INTO Scontrino VALUES ('175', DATE '2022-08-17', '13', '91266')
INTO Scontrino VALUES ('045', DATE '2022-09-14', '09', '72185')
INTO Scontrino VALUES ('111', DATE '2022-10-10', '10', '73830')
SELECT 1 FROM DUAL;

INSERT ALL
INTO Cliente VALUES ('BOEIBA73F67F426Z', 'Umberto', 'Conti', DATE '1987-07-08', 'Via Davide', '36100', 'Vicenza', '48221')
INTO Cliente VALUES ('GODVCQ11W04A277L', 'Grazia', 'Amica', DATE '1972-12-22', 'Via Kennedy', '09170', 'Oristano', '53126')
INTO Cliente VALUES ('TBQCNP07I21I377F', 'Fatima', 'Pagano', DATE '1988-02-25', 'Via Umberto', '83047', 'Lioni', '60881')
INTO Cliente VALUES ('DCIGQV05Z95Y818X', 'Raffaele', 'Gentile', DATE '1996-02-27', 'Via De Santis', '19028', 'La Spezia', '66115')
INTO Cliente VALUES ('VEZPFE87Q32H006G', 'Grazia', 'Ricci', DATE '1995-08-04', 'Via Guerra', '53100', 'Siena', '33649')
INTO Cliente VALUES ('UHDQZT44S25X354F', 'Manfredi', 'Bellini', DATE '1996-09-26', 'Via Luigi Rizzo', '80026', 'Casoria', '52887')
INTO Cliente VALUES ('IVCTVJ88F22U748C', 'Lino', 'Serra', DATE '1990-05-26', 'Via Tosca', '36100', 'Vicenza', '50566')
INTO Cliente VALUES ('HLLSWT47Z95Z697G', 'Benedetta', 'Caputo', DATE '1992-02-14', 'Via Donati', '98050', 'Messina', '53648')
INTO Cliente VALUES ('AKFSCU28X77V201B', 'Bartolomeo', 'Bianco', DATE '1991-07-25', 'Via Torino', '13030', 'Vercelli', '23491')
INTO Cliente VALUES ('ZKIVAK24T06P908G', 'Giuseppe', 'Barbieri', DATE '1990-03-22', 'Via Andreotti', '87032', 'Cosenza', '50864')
INTO Cliente VALUES ('VSDGHD99T00M044I', 'Antonio', 'Basile', DATE '200-01-20', 'Via Giganti', '27029', 'Pavia', '26588')
INTO Cliente VALUES ('VEYUJW55X06G082Z', 'Carmine', 'Pellegrino', DATE '2003-06-23', 'Via Vicenza', '40030', 'Bologna', '29288')
INTO Cliente VALUES ('YBQKJX18Q24N403O', 'Andrea', 'Esposito', DATE '2001-10-18', 'Via Acrone', '15068', 'Alessandria', '91266')
INTO Cliente VALUES ('JFBFUZ89V01B072R', 'Anna', 'Acerbi', DATE '2002-09-30', 'Via Agnano', '71033', 'Foggia', '72185')
INTO Cliente VALUES ('WCFDPF61H94W313S', 'Elisa', 'Esposito', DATE '1999-12-02', 'Via Nolana', '19028', 'La Spezia', '73830')
SELECT 1 FROM DUAL;

INSERT ALL
INTO Brand VALUES ('Blizzard', '+4915227656077', 'blizzard@gmail.com')
INTO Brand VALUES ('CCP Games', '+48722717429', 'ccp.games@outlook.com')
INTO Brand VALUES ('Lego', '+66832692485', 'lego@live.com')
INTO Brand VALUES ('Epic Games', '+17084140252', 'epic.games@gmail.com')
INTO Brand VALUES ('Flaregames', '+420721482480', 'flaregames@yahoo.com')
INTO Brand VALUES ('Huuuge Games', '+8617107706062', 'huuuge.games@outlook.com')
INTO Brand VALUES ('Riot Games', '+33757130982', 'riot.games@live.com')
INTO Brand VALUES ('Roblox Corporation', '+972552603210', 'roblox.corporation@gmail.com')
INTO Brand VALUES ('Supercell', '+37124987607', 'supercell@outlook.com')
INTO Brand VALUES ('Mojang', '+972552603212', 'mojang@live.com')
INTO Brand VALUES ('Ubisoft', '+32460244124', 'ubisoft@gmail.com')
INTO Brand VALUES ('Sony', '+380934611643', 'sony@outlook.com')
INTO Brand VALUES ('Microsoft', '+917428723247', 'microsoft@outlook.com')
INTO Brand VALUES ('Unity Technologies', '+559551583801', 'unity.technologies@live.com')
INTO Brand VALUES ('Electronic Arts', '+642040161449', 'electronic.arts@yahoo.com')
SELECT 1 FROM DUAL;

INSERT ALL
/* videogiochi */
INTO Prodotto VALUES ('3161144353361', 25.50, 'Overwatch', 'Blizzard')
INTO Prodotto VALUES ('1452212886613', 20.00, 'World of Warcraft', 'Blizzard')
INTO Prodotto VALUES ('1261524815982', 9.90, 'Gunjack', 'CCP Games')
INTO Prodotto VALUES ('7389735471827', 5.90, 'EVE online', 'CCP Games')
INTO Prodotto VALUES ('5547126617183', 70.50, 'Harry Potter: Hogwarts', 'Lego')
INTO Prodotto VALUES ('2958458523424', 59.90, 'Star Wars: the Skywalker saga', 'Lego')
INTO Prodotto VALUES ('2516872378394', 35.50, 'Fortnite', 'Epic Games')
INTO Prodotto VALUES ('3236799153441', 10.00, 'Fall Guys', 'Epic Games')
INTO Prodotto VALUES ('5735695496534', 15.90, 'Royal Revolt', 'Flaregames')
INTO Prodotto VALUES ('7696551478743', 15.90, 'Royal Revolt 2', 'Flaregames')
INTO Prodotto VALUES ('5444637321494', 3.90, 'Billionaire Casino Slots 777', 'Huuuge Games')
INTO Prodotto VALUES ('3749327298535', 2.90, 'Traffic Puzzle', 'Huuuge Games')
INTO Prodotto VALUES ('9252654442576', 9.90, 'League of Legends', 'Riot Games')
INTO Prodotto VALUES ('3522923974493', 15.45, 'Valorant', 'Riot Games')
INTO Prodotto VALUES ('8719612476977', 10.50, 'Roblox', 'Roblox Corporation')
INTO Prodotto VALUES ('2159952449449', 5.50, 'Among Us', 'Roblox Corporation')
INTO Prodotto VALUES ('8575794632918', 1.99, 'Clash of Clans', 'Supercell')
INTO Prodotto VALUES ('8239872659154', 2.99, 'Clash Royale', 'Supercell')
INTO Prodotto VALUES ('9411876517421', 7.80, 'Minecraft', 'Mojang')
INTO Prodotto VALUES ('4158659266579', 5.90, 'Minecraft Earth', 'Mojang')
INTO Prodotto VALUES ('2117985678598', 85.90, 'Assassin Creed: Valhalla', 'Ubisoft')
INTO Prodotto VALUES ('8972798252271', 80.50, 'Far Cry 6', 'Ubisoft')
INTO Prodotto VALUES ('5534913359943', 45.25, 'Demon Souls', 'Sony')
INTO Prodotto VALUES ('2728622851118', 65.70, 'Gran Turismo 7', 'Sony')
INTO Prodotto VALUES ('6726585883313', 50.80, 'Halo Infinite', 'Microsoft')
INTO Prodotto VALUES ('8282521878755', 60.70, 'Forza Horizon 4', 'Microsoft')
INTO Prodotto VALUES ('4481662758784', 5.90, 'CupHead', 'Unity Technologies')
INTO Prodotto VALUES ('3241649593949', 7.90, 'Escape from Tarkov', 'Unity Technologies')
INTO Prodotto VALUES ('7421596293422', 75.80, 'Fifa 22', 'Electronic Arts')
INTO Prodotto VALUES ('9667389758453', 70.90, 'NBA 2k22', 'Electronic Arts')
SELECT 1 FROM DUAL;

INSERT ALL
INTO Offerta VALUES ('731', '20g', 'Sconto 20%')
INTO Offerta VALUES ('410', '10g', 'Sconto 10%')
INTO Offerta VALUES ('368', '01s', 'Sconto 15%')
INTO Offerta VALUES ('316', '03m', 'Sconto 25%')
INTO Offerta VALUES ('641', '12s', '2x1')
INTO Offerta VALUES ('463', '05s', '3x2')
INTO Offerta VALUES ('907', '05m', 'Sconto 5%')
INTO Offerta VALUES ('181', '25g', 'Sconto 50%')
INTO Offerta VALUES ('174', '01s', 'Sconto 60%')
INTO Offerta VALUES ('399', '04g', 'Sconto 45%')
INTO Offerta VALUES ('737', '10m', 'Sconto 55%')
INTO Offerta VALUES ('400', '01a', '5x4')
INTO Offerta VALUES ('844', '02m', 'Sconto 20€')
INTO Offerta VALUES ('539', '03g', 'Sconto 50€')
INTO Offerta VALUES ('866', '29g', 'Sconto 10€')
SELECT 1 FROM DUAL;

INSERT ALL
INTO Offerta_Prodotto VALUES ('3161144353361', '731')
INTO Offerta_Prodotto VALUES ('1452212886613', '410')
INTO Offerta_Prodotto VALUES ('1261524815982', '368')
INTO Offerta_Prodotto VALUES ('7389735471827', '316')
INTO Offerta_Prodotto VALUES ('5547126617183', '641')
INTO Offerta_Prodotto VALUES ('2958458523424', '463')
INTO Offerta_Prodotto VALUES ('2516872378394', '907')
INTO Offerta_Prodotto VALUES ('3236799153441', '181')
INTO Offerta_Prodotto VALUES ('5735695496534', '174')
INTO Offerta_Prodotto VALUES ('7696551478743', '399')
INTO Offerta_Prodotto VALUES ('5444637321494', '737')
INTO Offerta_Prodotto VALUES ('3749327298535', '400')
INTO Offerta_Prodotto VALUES ('9252654442576', '844')
INTO Offerta_Prodotto VALUES ('3522923974493', '539')
INTO Offerta_Prodotto VALUES ('8719612476977', '866')

INTO Offerta_Prodotto VALUES ('2159952449449', '731')
INTO Offerta_Prodotto VALUES ('8575794632918', '410')
INTO Offerta_Prodotto VALUES ('8239872659154', '368')
INTO Offerta_Prodotto VALUES ('9411876517421', '316')
INTO Offerta_Prodotto VALUES ('4158659266579', '641')
INTO Offerta_Prodotto VALUES ('2117985678598', '463')
INTO Offerta_Prodotto VALUES ('8972798252271', '907')
INTO Offerta_Prodotto VALUES ('5534913359943', '181')
INTO Offerta_Prodotto VALUES ('2728622851118', '174')
INTO Offerta_Prodotto VALUES ('6726585883313', '399')
INTO Offerta_Prodotto VALUES ('8282521878755', '737')
INTO Offerta_Prodotto VALUES ('4481662758784', '400')
INTO Offerta_Prodotto VALUES ('3241649593949', '844')
INTO Offerta_Prodotto VALUES ('7421596293422', '539')
INTO Offerta_Prodotto VALUES ('9667389758453', '866')
SELECT 1 FROM DUAL;

INSERT ALL
INTO Scontrino_Prodotto VALUES ('015', DATE '2020-04-17', '2159952449449')
INTO Scontrino_Prodotto VALUES ('145', DATE '2020-06-02', '8575794632918')
INTO Scontrino_Prodotto VALUES ('425', DATE '2020-06-24', '8239872659154')
INTO Scontrino_Prodotto VALUES ('100', DATE '2021-02-17', '9411876517421')
INTO Scontrino_Prodotto VALUES ('001', DATE '2021-04-12', '4158659266579')
INTO Scontrino_Prodotto VALUES ('102', DATE '2021-10-04', '2117985678598')
INTO Scontrino_Prodotto VALUES ('253', DATE '2021-12-24', '8972798252271')
INTO Scontrino_Prodotto VALUES ('197', DATE '2022-02-09', '5534913359943')
INTO Scontrino_Prodotto VALUES ('173', DATE '2022-04-08', '2728622851118')
INTO Scontrino_Prodotto VALUES ('142', DATE '2022-05-12', '6726585883313')
INTO Scontrino_Prodotto VALUES ('075', DATE '2022-06-03', '8282521878755')
INTO Scontrino_Prodotto VALUES ('275', DATE '2022-07-06', '4481662758784')
INTO Scontrino_Prodotto VALUES ('175', DATE '2022-08-17', '3241649593949')
INTO Scontrino_Prodotto VALUES ('045', DATE '2022-09-14', '7421596293422')
INTO Scontrino_Prodotto VALUES ('111', DATE '2022-10-10', '9667389758453')
SELECT 1 FROM DUAL;

INSERT ALL
INTO Videogioco VALUES ('', '')
SELECT 1 FROM DUAL;

INSERT ALL
INTO Console VALUES ('', '')
SELECT 1 FROM DUAL;

INSERT ALL
INTO Accessorio VALUES ('', '')
SELECT 1 FROM DUAL;

INSERT ALL
INTO Fornitore VALUES ('90264687962', 'photographoie', 'photographoie@gmail.com', '+353894060424')
INTO Fornitore VALUES ('38690894449', 'outbreakoiedo', 'outbreakoiedo@outlook.com', '+358414976066')
INTO Fornitore VALUES ('15004158468', 'airtightssket', 'airtightssket@live.com', '+18253050685')
INTO Fornitore VALUES ('91289955367', 'weldinggazpac', 'weldinggazpac@yahoo.com', '+77474070236')
INTO Fornitore VALUES ('17165219947', 'huedockinggum', 'huedockinggum@gmail.com', '+37378225275')
INTO Fornitore VALUES ('41884114528', 'friseepavilio', 'friseepavilio@outlook.com', '+4759444605')
INTO Fornitore VALUES ('62015085528', 'proportionyea', 'proportionyea@live.com', '+212652877871')
INTO Fornitore VALUES ('56441262398', 'homeothermicc', 'homeothermicc@yahoo.com', '+959457796397')
INTO Fornitore VALUES ('50613744343', 'elevationsuga', 'elevationsuga@gmail.com', '+40734897154')
INTO Fornitore VALUES ('83692961491', 'improvisation', 'improvisation@gmail.com', '+37068977922')
INTO Fornitore VALUES ('73442221108', 'foldhardboard', 'foldhardboard@gmail.com', '+601161466122')
INTO Fornitore VALUES ('96371977022', 'pointillismcu', 'pointillismcu@gmail.com', '+31630183604')
INTO Fornitore VALUES ('34217892189', 'huecarbohydra', 'huecarbohydra@gmail.com', '+528184713166')
INTO Fornitore VALUES ('67382948785', 'meltdacquoise', 'meltdacquoise@gmail.com', '+351910602928')
INTO Fornitore VALUES ('88479777451', 'rarefactionso', 'rarefactionso@gmail.com', '+37126109368')
SELECT 1 FROM DUAL;

INSERT ALL
INTO Corriere VALUES ('37883995709', 'Poste Italiane')
INTO Corriere VALUES ('20161060504', 'UPS')
INTO Corriere VALUES ('89615695713', 'DHL')
INTO Corriere VALUES ('39727028431', 'SDA')
INTO Corriere VALUES ('72216746040', 'Bartolini')
INTO Corriere VALUES ('71082936092', 'GLS')
INTO Corriere VALUES ('92906577636', 'TNT')
INTO Corriere VALUES ('90339372094', 'Nexive')
INTO Corriere VALUES ('11201360185', 'BRT')
INTO Corriere VALUES ('50910133102', 'FedEx')
INTO Corriere VALUES ('31334834307', 'UPM')
INTO Corriere VALUES ('50432359323', 'DST')
INTO Corriere VALUES ('17334521562', 'TAL')
INTO Corriere VALUES ('91695775671', 'PNC')
INTO Corriere VALUES ('32100490558', 'NPM')
SELECT 1 FROM DUAL;

INSERT ALL
INTO CaricoMerce VALUES ('VuahC', 'Eby7T13OMDYF2AUafp', DATE '2020-09-23', DATE '2020-09-28', '90264687962', '37883995709')
INTO CaricoMerce VALUES ('q9lnB', '9K0Fqa5jxfSLTcvJh5', DATE '2021-02-17', DATE '2021-02-22', '38690894449', '20161060504')
INTO CaricoMerce VALUES ('ChV2W', 'O6UyGapV3EKB3qAexq', DATE '2021-02-25', DATE '2021-02-29', '15004158468', '89615695713')
INTO CaricoMerce VALUES ('ps3bv', 'jJ7RMV2LYbmaq6gF5u', DATE '2021-04-07', DATE '2021-04-12', '91289955367', '39727028431')
INTO CaricoMerce VALUES ('wRoB5', 'Dlic6NAPLlB00Ts1XD', DATE '2021-10-11', DATE '2021-10-18', '17165219947', '72216746040')
INTO CaricoMerce VALUES ('SvBhL', 'mBLEFDmW2h91r5QNib', DATE '2021-11-12', DATE '2021-11-17', '41884114528', '71082936092')
INTO CaricoMerce VALUES ('EAsYE', 'nShLsSH8Oag1fcHxFU', DATE '2021-11-23', DATE '2021-11-29', '62015085528', '92906577636')
INTO CaricoMerce VALUES ('GrQjf', 'yMrX4Z4hmnLNx0LCyt', DATE '2021-11-30', DATE '2021-12-06', '56441262398', '90339372094')
INTO CaricoMerce VALUES ('edy2i', 'SYrB33nJYfYogAzNOm', DATE '2022-01-11', DATE '2022-01-18', '50613744343', '11201360185')
INTO CaricoMerce VALUES ('TFA5G', '51KdAXwaYuimG342Ie', DATE '2022-02-02', DATE '2022-02-09', '83692961491', '50910133102')
INTO CaricoMerce VALUES ('Fbsck', 'jMo0XigC4QGvapTBIm', DATE '2022-03-04', DATE '2022-03-09', '73442221108', '31334834307')
INTO CaricoMerce VALUES ('Ef218', 'TutEtSg6JKWM5sLXiF', DATE '2022-03-17', DATE '2022-03-19', '96371977022', '50432359323')
INTO CaricoMerce VALUES ('0v45N', 'LzWiPZDpYaVt2jwkdA', DATE '2022-04-12', DATE '2022-04-18', '34217892189', '17334521562')
INTO CaricoMerce VALUES ('LdcL4', '5OIFyEHFoGeSBsV6FQ', DATE '2022-04-14', DATE '2022-04-19', '67382948785', '91695775671')
INTO CaricoMerce VALUES ('X9YrY', 'meQ8eak059sCsEub1M', DATE '2022-07-25', DATE '2022-07-28', '88479777451', '32100490558')
SELECT 1 FROM DUAL;

INSERT ALL
INTO CaricoMerce_Prodotto VALUES ('', '', , )
INTO CaricoMerce_Prodotto VALUES ('', '', , )
INTO CaricoMerce_Prodotto VALUES ('', '', , )
INTO CaricoMerce_Prodotto VALUES ('', '', , )
INTO CaricoMerce_Prodotto VALUES ('', '', , )
INTO CaricoMerce_Prodotto VALUES ('', '', , )
INTO CaricoMerce_Prodotto VALUES ('', '', , )
INTO CaricoMerce_Prodotto VALUES ('', '', , )
INTO CaricoMerce_Prodotto VALUES ('', '', , )
INTO CaricoMerce_Prodotto VALUES ('', '', , )
INTO CaricoMerce_Prodotto VALUES ('', '', , )
INTO CaricoMerce_Prodotto VALUES ('', '', , )
INTO CaricoMerce_Prodotto VALUES ('', '', , )
INTO CaricoMerce_Prodotto VALUES ('', '', , )
INTO CaricoMerce_Prodotto VALUES ('', '', , )
SELECT 1 FROM DUAL;