function [prdData, info] = predict_Procambarus_virginalis(par, data, auxData)
  
  % unpack par, data, auxData
  cPar = parscomp_st(par); vars_pull(par); 
  vars_pull(cPar);  vars_pull(data);  vars_pull(auxData);
  
  
  pars_T = [T_A, T_L, T_H, T_AL, T_AH]; 
  % compute temperature correction factors
  TC_ah = tempcorr(temp.ah, T_ref, T_A);
  TC_ab = tempcorr(temp.ab, T_ref, T_A);
  TC_tp = tempcorr(temp.tp, T_ref, T_A);
  TC_am = tempcorr(temp.am, T_ref, T_A);
  TC_Ri = tempcorr(temp.Ri, T_ref, T_A);
  TC_tL_path7500 = tempcorr(temp.tL_path7500, T_ref, pars_T);
  TC_tWw_path7500 = tempcorr(temp.tWw_path7500, T_ref, pars_T);
    
 %% zero-variate data

  % life cycle
  pars_tp = [g k l_T v_Hb v_Hp];
  [tau_p, tau_b, l_p, l_b, info] = get_tp(pars_tp, f);
  
  % initial
  pars_UE0 = [V_Hb; g; k_J; k_M; v]; % compose parameter vector
  U_E0 = initial_scaled_reserve(f, pars_UE0); % d.cm^2, initial scaled reserve
  E0 = J_E_Am * U_E0 * mu_E; % J
  
  % hatch   
  [U_H, aUL] = ode45(@dget_aul, [0; U_Hh; U_Hb], [0 U_E0 1e-10], [], kap, v, k_J, g, L_m);
  a_h = t_0 + aUL(2,1); aT_h = a_h/ TC_ah; % d, age at hatch at f and T
  L_h = aUL(2,3);                  % cm, structural length at f
  Lw_h = L_h/ del_Mh;               % cm, S-V length at hatch at f
  
  % birth
  L_b = L_m * l_b;                  % cm, structural length at birth at f
  Lw_b = L_b/ del_M;                % cm, physical length at birth at f
  Ww_b = L_b^3 * (1 + f * ome);     % g, wet weight at birth at f 
  aT_b = (t_0 + tau_b/ k_M)/ TC_ab;         % d, age at birth at f and T

  % puberty 
  L_p = L_m * l_p;                  % cm, structural length at puberty at f
  Lw_p = L_p/ del_M;                % cm, physical length at puberty at f
  Ww_p = L_p^3 *(1 + f * ome);      % g, wet weight at puberty 
  tT_p = (tau_p - tau_b)/ k_M/ TC_tp;% d, time since birth at puberty at f and T

  % ultimate
  l_i = f - l_T;                    % -, scaled ultimate length
  L_i = L_m * l_i;                  % cm, ultimate structural length at f
  Lw_i = L_i/ del_M;                % cm, ultimate physical length at f
  LCw_i = L_i / del_Mcl;            % cm, ultimate carapace length at f
  Ww_i = L_i^3 * (1 + f * ome);     % g, ultimate wet weight 
   
  % life span
  pars_tm = [g; l_T; h_a/ k_M^2; s_G];  % compose parameter vector at T_ref
  t_m = get_tm_s(pars_tm, f, l_b);      % -, scaled mean life span at T_ref
  aT_m = t_m/ k_M/ TC_am;               % d, mean life span at T
  
  % reproduction
  pars_R = [kap; kap_R; g; k_J; k_M; L_T; v; U_Hb; U_Hp]; % compose parameter vector at T
  RT_i = TC_Ri * reprod_rate(L_i, f, pars_R);             % #/d, ultimate reproduction rate at T * reprod_rate_j(2 * del_M, f, pars_R);          % #/d, ultimate reproduction rate at T

  % pack to output
  prdData.ah = aT_h;
  prdData.ab = aT_b;
  prdData.tp = tT_p;
  prdData.am = aT_m;
  prdData.Lh = Lw_h; 
  prdData.Lb = Lw_b;
  prdData.Lp = Lw_p;
  prdData.Li = Lw_i;
  prdData.LCi = LCw_i;
  prdData.Wwb = Ww_b;
  prdData.Wwp = Ww_p;
  prdData.Wwi = Ww_i;
  prdData.Ri = RT_i;
  prdData.E0 = E0;
  
  
 %% uni-variate data
    
 % experimental t-L and t-Ww data for juvenile marbled crayfish exposed to pathogen conc. 7500 spores/ml
 F = f_path7500;
 L_b = L_m * get_lb([g k v_Hb], F); Lw_b = L_b / del_M;
 Lw_i = L_m * (F - l_T)/ del_M;
 ir_B = 3/ k_M + 3 * F * L_m/ v; rT_B = TC_tL_path7500/ ir_B;  % d, 1/von Bert growth rate // % 1/d, von Bert growth rate
 % tL_path7500
 ELw_path7500 = Lw_i - (Lw_i - Lw_b) * exp( - rT_B * tL_path7500(:,1)); % cm, total length
 
 % tWw_path7500
 L = L_i - (L_i - L_b) * exp( - rT_B * tWw_path7500(:,1));           % cm, structural length at time
 EWw_path7500 = L.^3 * (1 + F * ome);                                 % g, wet weight
 
 
 
 % pack to output
  prdData.tL_path7500 = ELw_path7500;
  prdData.tWw_path7500 = EWw_path7500;
 