function [data, auxData, metaData, txtData, weights] = mydata_Procambarus_virginalis

%% set metaData 
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Malacostraca'; 
metaData.order      = 'Decapoda'; 
metaData.family     = 'Cambaridae';
metaData.species    = 'Procambarus_virginalis'; 
metaData.species_en = 'Marbled crayfish'; 

metaData.ecoCode.climate = {'Af', 'Am', 'Aw', 'Cs', 'Cw'}; % Af, Am, Aw - tolerated; Cs, Cw - preferred (source https://www.cabi.org/isc/datasheet/110477)
metaData.ecoCode.ecozone = {'THp', 'TPam'};
metaData.ecoCode.habitat = {'0iFr', '0iFl', '0iFp', '0iFm', '0iFc'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'}; % Marbled crayfish eat almost everything, but seem to prefer plant material and snails
metaData.ecoCode.gender  = {'D'}; 
metaData.ecoCode.reprod  = {'Apo'}; 

metaData.T_typical  = C2K(20); 
metaData.data_0     = {'ah'; 'ab'; 'ap'; 'am'; 'Lh'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'; 'E0'}; 
metaData.data_1     = {'t-L_T'; 't-Ww_T'; 'L-W';'L-N'; 'Ww-N'};

metaData.COMPLETE = 3.5; 

metaData.author   = {'Ana Dobrovic', 'Nina Marn'};    
metaData.date_subm = [2020 08 04];              
metaData.email    = {'ana.dobrovic@biol.pmf.hr'};            
metaData.address  = {'University of Zagreb - Faculty of Science, Croatia'};   

metaData.curator     = {'Nina Marn'};
metaData.email_cur   = {'nina.marn@gmail.com'}; 
metaData.date_acc    = [2020 08 05]; 


%% set data
% zero-variate data
data.ah = 20;    units.ah = 'd';    label.ah = 'age at hatching'; 	   bibkey.ah = 'VogtToll2004';  
  temp.ah = C2K(20);  units.temp.ah = 'K'; label.temp.ah = 'temperature'; % the temperature was 18-21°C
  comment.ah = 'Embryonic period lasts 17-22days, depending on conditions (VogtToll2004a); The embryonic period between spawning and hatching lasts 2?3weeks';
data.ab = 20+25;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'VogtToll2004';   
  temp.ab = C2K(20);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; % the temperature was 18-21°C
  comment.ab = 'Brood care period for stages 1-3: taken as 25 days; range 11?38 days (2-5 weeks)for carriage of the juveniles. They might use up the yolk a few days before the end of stage 3'; 
data.tp = 245 - 25;    units.tp = 'd';    label.tp = 'time since birth at puberty at 20°C';   bibkey.tp = 'VogtToll2004a';
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'Computed as 35 weeks (245 days since hatching, first spawning at 20°C) - 25 days (from hatching to birth)'; 
data.am = 1154;    units.am = 'd';    label.am = 'life span';        bibkey.am = 'Vogt2010';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; % room temperature
  comment.am = 'Mean life span of the most long-lived 10% from Vogt2010 lab population'; 

data.Lh  = 0.35;   units.Lh  = 'cm';  label.Lh  = 'total length at hatching'; bibkey.Lh  = 'VogtToll2004a';
data.Lb  = 0.57;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'VogtToll2004a'; 
data.Lp  = 4;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'VogtToll2004a'; 
data.Li  = 10;   units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'VogtFalc2015';
  comment.Li = 'TL: tip of rostrum to end of telson; largest in lab: 10.3cm (VogtFalc2015), 8.8cm in Vogt2010'; 
data.LCi  = 4.5;   units.LCi  = 'cm';  label.LCi  = 'ultimate carapace length'; bibkey.LCi  = 'VogtFalc2015';
  comment.LCi = 'Carapace length; largest in lab and nature 4.9cm CL'; 

data.Wwb = 0.0053;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'SeitVilp2005';
data.Wwp = 1.537;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty'; bibkey.Wwp = 'SeitVilp2005';
data.Wwi = 30;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'VogtFalc2015';
    comment.Wwi = 'largest in lab 30g, ever recorded in nature 32g (VogtFalc2015 and refs), largest in lab in Vogt2010: 23.5g'; 

data.Ri = 450/(8*7); units.Ri = '#/d';    label.Ri = 'max reprod rate';        bibkey.Ri = {'VogtFalc2015', 'VogtDorn2019','HossKoub2019'};
    comment.Ri = ['Temperature guessed; number of eggs based on larger crayfish in datasets (clutch size increases with the female size), ' ...
        'reproducing every 8-9 weeks all year round under very good conditions; '...
        '150-270 eggs for larger crayfish in VogtToll2004a, the largest clutches of marbled crayfish in the laboratory and the wild consisted of >720 eggs(VogtFalc2015 and refs)'];  
    temp.Ri = C2K(20);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.E0 = 55.56 * 1.5/2.22; units.E0  = 'J'; label.E0  = 'initial energy content of the egg'; bibkey.E0  = {'RodrGarc2006', 'VogtToll2004a'};
comment.E0 = 'Based on Redclaw crayfish: egg diameter (2.22 mm) and energy (55.56 J/egg) [RodrGarc2006], and egg diameter of marble crayfish of 1.5mm [VogtToll2004a] ';

% uni-variate data
% experimental t-L data for juvenile marbled crayfish exposed to pathogen conc. 7500 spores/ml
data.tL_path7500 = [ ... % time since birth (days), total length (cm)
87	87	87	87	87	87	87	87	87	87	87	87	87	87	87	87	87	87	87	87	101	101	101	101	101	101	101	101	101	101	101	101	101	101	101	101	101	101	101	101	115	115	115	115	115	115	115	115	115	115	115	115	115	115	115	115	115	115	115	115	129	129	129	129	129	129	129	129	129	129	129	129	129	129	129	129	129	129	129	129	143	143	143	143	143	143	143	143	143	143	143	143	143	143	143	143	143	143	143	143	157	157	157	157	157	157	157	157	157	157	157	157	157	157	157	157	157	157	157	171	171	171	171	171	171	171	171	171	171	171	171	171	171	171	171	171	171	185	185	185	185	185	185	185	185	185	185	185	185	185	185	185	185	185	185	213	213	213	213	213	213	213	213	213	213	213	213	213	213	213	213	213;
1.7319	2.0804	1.7265	1.8636	1.8443	1.9538	1.8091	1.8458	1.8670	2.0389	2.4983	1.8990	2.0343	1.9966	1.8969	1.7083	1.8364	1.6945	1.6549	2.0791	1.9739	2.252	1.9286	2.1411	2.0812	2.0091	2.0066	2.0402	2.0235	2.0346	2.5148	2.0838	2.2258	2.1384	2.1238	1.8639	1.9706	1.943	1.9173	2.0973	2.1419	2.3089	2.1763	2.3201	2.1380	2.0703	2.1392	2.1262	2.0372	2.2655	2.5235	2.1302	2.2355	2.4062	2.3396	2.0790	2.2054	2.1271	2.1168	2.3199	2.2017	2.2887	2.1585	2.3332	2.2793	2.3085	2.1602	2.2921	2.2168	2.2681	2.7243	2.3157	2.4577	2.4503	2.3668	2.0868	2.1718	2.1585	2.1052	2.338	2.4283	2.4855	2.3638	2.6038	2.3036	2.3443	2.1960	2.2944	2.1454	2.3091	2.6497	2.2983	2.4362	2.4057	2.3669	2.3061	2.3823	2.4006	2.1220	2.3300	2.4736	2.5301	2.3658	2.5419	2.3394	2.3648	2.3087	2.3931	2.3764	2.3964	2.7292	2.4848	2.4528	2.5452	2.5316	2.2893	2.4740	2.3823	2.5576	2.5651	2.4775	2.4567	2.5212	2.4516	2.4774	2.4349	2.4495	2.3497	2.8907	2.4618	2.6237	2.5551	2.5001	2.4262	2.4609	2.4543	2.5674	2.7297	2.5243	2.4192	2.7235	2.4197	2.4742	2.4024	2.4307	2.4748	2.8985	2.6257	2.6189	2.5658	2.5239	2.3922	2.3904	2.4158	2.7346	2.6638	2.5610	2.5484	2.6775	2.6050	2.6527	2.6776	2.6133	2.5568	2.8720	2.5405	2.8142	2.7088	2.7239	2.5806	2.5959	2.7057]';
units.tL_path7500 = {'d', 'cm'};  label.tL_path7500 = {'time since birth', 'total length'}; bibkey.tL_path7500 = 'misc';
temp.tL_path7500 = C2K(20);  units.temp.tL_path7500 = 'K'; label.temp.tL_path7500 = 'temperature';

% experimental t-Ww data for juvenile marbled crayfish exposed to pathogen conc. 7500 spores/ml
data.tWw_path7500 = [ ... % time since birth (days), wet weight (g)
87	87	87	87	87	87	87	87	87	87	87	87	87	87	87	87	87	87	87	87	101	101	101	101	101	101	101	101	101	101	101	101	101	101	101	101	101	101	101	101	115	115	115	115	115	115	115	115	115	115	115	115	115	115	115	115	115	115	115	115	129	129	129	129	129	129	129	129	129	129	129	129	129	129	129	129	129	129	129	129	143	143	143	143	143	143	143	143	143	143	143	143	143	143	143	143	143	143	143	143	157	157	157	157	157	157	157	157	157	157	157	157	157	157	157	157	157	157	157	171	171	171	171	171	171	171	171	171	171	171	171	171	171	171	171	171	171	185	185	185	185	185	185	185	185	185	185	185	185	185	185	185	185	185	185	213	213	213	213	213	213	213	213	213	213	213	213	213	213	213	213	213;
0.0990	0.1517	0.0910	0.1149	0.1269	0.1275	0.1066	0.1223	0.1112	0.1525	0.2621	0.1210	0.1395	0.1366	0.1230	0.0812	0.1070	0.0926	0.0909	0.1604	0.1337	0.2009	0.1219	0.1653	0.1586	0.1335	0.1392	0.1547	0.1486	0.1514	0.2758	0.1635	0.191	0.1854	0.0833	0.2108	0.1351	0.1273	0.1158	0.1685	0.1653	0.2051	0.1653	0.1957	0.1547	0.1528	0.1654	0.1554	0.1477	0.1897	0.2728	0.1686	0.1866	0.2481	0.2118	0.1593	0.1821	0.1695	0.152	0.2173	0.1813	0.2076	0.1693	0.2035	0.1968	0.2026	0.174	0.198	0.1807	0.1897	0.2087	0.2105	0.2392	0.2415	0.2313	0.1582	0.1755	0.1703	0.1544	0.2094	0.2402	0.2691	0.2082	0.2546	0.2033	0.2057	0.2010	0.2018	0.1864	0.2161	0.3316	0.2162	0.2457	0.2425	0.2287	0.1919	0.2348	0.2101	0.1571	0.2183	0.2587	0.2744	0.2300	0.2669	0.2124	0.2128	0.2159	0.2636	0.2187	0.2227	0.3373	0.2573	0.2532	0.2937	0.2780	0.2056	0.2452	0.2221	0.2754	0.2507	0.2788	0.2516	0.2694	0.2495	0.2545	0.2558	0.2546	0.2244	0.3912	0.2489	0.2809	0.289	0.2704	0.2249	0.2347	0.2449	0.2683	0.3221	0.2831	0.2468	0.3137	0.2442	0.2475	0.2468	0.2477	0.2531	0.4034	0.2981	0.2921	0.2919	0.2800	0.2295	0.2425	0.2521	0.3150	0.3304	0.2901	0.2932	0.3212	0.3084	0.3099	0.3206	0.2989	0.2634	0.4070	0.3048	0.3519	0.3321	0.3308	0.2759	0.2983	0.322]';
units.tWw_path7500 = {'d', 'g'}; label.tWw_path7500 = {'time since birth', 'wet weight'}; bibkey.tWw_path7500 = 'misc';
temp.tWw_path7500 = C2K(20);  units.temp.tWw_path7500 = 'K'; label.temp.tWw_path7500 = 'temperature';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 2 * weights.ab;  % more weight to age at birth
weights.ah = 2 * weights.ah;  % more weight to ah 
weights.Lh = 2 * weights.Lh;  % more weight to Lh 
weights.E0 = 3 * weights.E0;  % more weight to E_0
weights.Wwb = 5 * weights.Wwb;      % more weight to weight at birth
weights.tL_path7500 = 3 * weights.tL_path7500;  % less weight to tricky temps, more weight to optima
weights.tWw_path7500 = 3 * weights.tWw_path7500;  % less weight to tricky temps, more weight to optima

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp; 
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Model  std is applied, instead of abj, since freshwater crayfish, unlike marine decapods, have no larval stage';
metaData.discussion = struct('D1',D1);  

%% Facts 
F1 = 'Eggs are glued to hairs under the abdomen; after hatching the young continue to cling to the hairs, moult 2 or 3 times and a miniature crayfish walks off';
metaData.bibkey.F1 = 'VogtToll2004a'; 
F2 = 'Reproduction exclusively by parthenogenesis, no male specimen found';
metaData.bibkey.F2 = 'VogtToll2004a'; 
F3 = 'Not much is known about the species, common in aquariums,  best cultured at temperatures of 18-25°C. Maximum growth is obtained at 25°C and maximum survival at 20°C';
metaData.bibkey.F3 = 'VogtToll2004a'; 
F4 = ['Life cycle can be subdivided into 5 stages: (1) embryo, (2) juvenile stages 1-3 (brood period), (3) differentiation of sexual organs from stage 4 juveniles to 2cm TL adolescents,'...
    '(4) gonadal maturatation (2cm to 4cm TL), (5) the adult reproducing period (4cm to 12cm TL). Duration of each stage but also mean size of crayfish at each stage' ...
    'depend on rearing conditions'];
metaData.bibkey.F4 = 'VogtToll2004a'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);

%% Links
metaData.links.id_CoL = ''; % not in CoL
metaData.links.id_EoL = '52207817'; % Ency of Life, unresolved name
metaData.links.id_Wiki = 'Marbled_crayfish'; % Wikipedia
metaData.links.id_Taxo = '4928155'; % Taxonomicon

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Marbled_crayfish}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HossKoub2019'; type = 'Article'; bib = [ ...
'author = {Hossain, Md Shakhawate and Kouba, Antonin and Burie, Milos}, ' ...
'year = {2019}, ' ...
'title = {Morphometry, size at maturity, and fecundity of marbled crayfish (\textit{Procambarus virginalis})}, ' ...
'journal = {Zoologischer Anzeiger}, ' ...
'volume = {281}, ' ...
'pages = {68-75}, ' ...
'doi = {10.1016/j.jcz.2019.06.005}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RodrGarc2006'; type = 'Article'; bib = [ ...
'author = {Rodriguez-Gonzalez, Hervey and Garcia-Ulloa, Manuel and Hernandez-Llamas, Alfredo and Villarreal, Humberto}, ' ...
'year = {2006}, ' ...
'title = {Effect of dietary protein level on spawning and egg quality of redclaw crayfish \textit{Cherax quadricarinatus}}, ' ...
'journal = {Aquaculture}, ' ...
'volume = {257}, ' ...
'pages = {412--419}, ' ...
'doi = {10.1016/j.aquaculture.2006.01.020}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SeitVilp2005'; type = 'Article'; bib = [ ...
'author = {Seitz, Robert and Vilpoux, Kathia and Hopp, Ulrich and Harzsch, Steffen and Maier, Gerhard}, ' ...
'year = {2005}, ' ...
'title = {Ontogeny of the Marmorkrebs (marbled crayfish): a parthenogenetic crayfish with unknown origin and phylogenetic position},' ...
'journal = {Journal of experimental zoology. Part A, Comparative experimental biology},' ...
'volume = {303}, ' ...
'pages = {393-405}, ' ...
'doi = {10.1002/jez.a.143}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VogtToll2004'; type = 'Article'; bib = [ ...  
'author = {Vogt, Gunter and Tolley, Laura}, ' ...
'year = {2004}, ' ...
'title = {Brood care in freshwater crayfish and relationship with the offsprings sensory deficiencies}, ' ...
'journal = {Journal of morphology}, ' ...
'volume = {262}, ' ...
'pages = {566-82},' ...
'doi = {10.1002/jmor.10169}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VogtToll2004a'; type = 'Article'; bib = [ ...  
'author = {Vogt, Gunter and Tolley, Laura and Scholtz, Gerhard}, ' ...
'year = {2004}, ' ...
'title = {Life stages and reproductive components of the Marmorkrebs (Marbled Crayfish), the first parthenogenetic decapod crustacean}, ' ...
'journal = {Journal of morphology}, ' ...
'volume = {261}, ' ...
'pages = {286-311}, ' ...
'doi = {10.1002/jmor.10250}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Vogt2010'; type = 'Article'; bib = [ ... 
'author = {Vogt, Gunter}, ' ...
'year = {2010}, ' ...
'title = {Suitability of the clonal marbled crayfish for biogerontological research: {A} review and perspective, with remarks on some further crustaceans}, ' ...
'journal = {Biogerontology}, ' ...
'volume = {11}, ' ...
'pages = {643-69}, ' ...
'doi = {10.1007/s10522-010-9291-6}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VogtFalc2015'; type = 'Article'; bib = [ ... 
'author = {Vogt, Gunter and Falckenhayn, Cassandra and Schrimpf, Anne and Schmid, Katharina and Hanna, Katharina and Panteleit, Jorn and Helm, Mark and Schulz, Ralf and Lyko, Frank}, ' ...
'year = {2015}, ' ...
'title = {The marbled crayfish as a paradigm for saltational speciation by autopolyploidy and parthenogenesis in animals}, ' ...
'journal = {Biology Open}, ' ...
'volume = {4 (11)}, ' ...
'pages = {1583 -- 1594}, ' ...
'url = {https://pubmed.ncbi.nlm.nih.gov/26519519}, ' ...
'doi = {10.1242/bio.014241}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VogtDorn2019'; type = 'Article'; bib = [ ...  
'author = {Vogt, Gunter and Dorn, Nathan and Pfeiffer, Michael and Lukhaup, Chris and Williams, Bronwyn and Schulz, Ralf and Schrimpf, Anne}, ' ...
'year = {2019}, ' ...
'title = {The dimension of biological change caused by autotriploidy: {A} meta-analysis with triploid crayfish \emph{Procambarus virginalis} and its diploid parent \emph{Procambarus fallax}}, ' ...
'journal = {Zoologischer Anzeiger}, ' ...
'volume = {281}, ' ...
'pages = {53-67}, ' ...
'doi = {10.1016/j.jcz.2019.06.006}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
