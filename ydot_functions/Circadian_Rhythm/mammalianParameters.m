function [Ks]=mammalianParameters
V0_Per1 = 0.000001; V1_Per1 = 3.0; V0_Per2 = 0.09; V1_Per2 = 3.29; V0_Cry1 = 0.26;
V1_Cry1 = 2.44; V2_Cry1 = 2.89; V0_Cry2 = 1.29; V1_Cry2 = 2.72; V2_Cry2 = 0.1;
V1_Rev_erbalpha = 11.06; V0_Clk = 3.98; V1_Clk = 3.36; V0_Bmal1 = 1.98; V1_Bmal1 = 4.12;
V0_Rorc = 0.06; V1_Rorc = 3.55; V2_Rorc = 0.46;

na1_Per1 = 2.0; ni1_Per1 = 2.0; ni2_Per1 = 1.0; ni3_Per1 = 2.0; ni4_Per1 = 4.0;
na1_Per2 = 10.0; ni1_Per2 = 1.0; ni2_Per2 = 1.0; ni3_Per2 = 9.0; ni4_Per2 = 8.0;

na1_Cry1 = 4.91;na2_Cry1 = 3.01; ni1_Cry1 = 1.0; ni2_Cry1 = 1.0; ni3_Cry1 = 6.0;
ni4_Cry1 = 4.0; ni5_Cry1 = 2.24; na1_Cry2 = 4.39; na2_Cry2 = 4.43; ni1_Cry2 = 1.0;
ni2_Cry2 = 1.0; ni3_Cry2 = 4.0; ni4_Cry2 = 8.0; ni5_Cry2 = 1.75; na1_Rev_erbalpha = 4.40;
ni1_Rev_erbalpha = 0.15; ni2_Rev_erbalpha = 0.3; ni3_Rev_erbalpha = 7.0; ni4_Rev_erbalpha = 7.0;
na1_Clk = 3.50; ni1_Clk = 1.96; na1_Bmal1 = 4.13; ni1_Bmal1 = 0.02; na1_Rorc = 1.57;
na2_Rorc = 0.56; ni1_Rorc = 1.0; ni2_Rorc = 1.0; ni3_Rorc = 7.0; ni4_Rorc = 7.0;
ni5_Rorc = 4.33;

KA1_Per1 = 1.98; KI1_Per1 = 1.07; KI2_Per1 = 3.96; KI3_Per1 = 1.68; KI4_Per1 = 3.11;
KA1_Per2 = 1.90; KI1_Per2 = 4.51; KI2_Per2 = 2.98; KI3_Per2 = 2.24; KI4_Per2 = 3.31;
KA1_Cry1 = 1.46; KA2_Cry1 = 3.76; KI1_Cry1 = 0.03; KI2_Cry1 = 0.77; KI3_Cry1 = 3.59;
KI4_Cry1 = 3.44; KI5_Cry1 = 2.82; KA1_Cry2 = 0.69; KA2_Cry2 = 2.96; KI1_Cry2 = 4.63;
KI2_Cry2 = 2.95; KI3_Cry2 = 3.57; KI4_Cry2 = 2.75; KI5_Cry2 = 3.97; KA1_Rev_erbalpha = 3.15;
KI1_Rev_erbalpha = 3.56; KI2_Rev_erbalpha = 3.62; KI3_Rev_erbalpha = 4.71; KI4_Rev_erbalpha = 1.23;
KA1_Clk = 1.59; KI1_Clk = 0.83; KA1_Bmal1 = 2.59; KI1_Bmal1 = 2.47; KA1_Rorc = 4.30;
KA2_Rorc = 4.89; KI1_Rorc = 3.49; KI2_Rorc = 2.34; KI3_Rorc = 2.71; KI4_Rorc = 2.09;
KI5_Rorc = 3.36;

km_Per1 = 2.18; km_Per2 = 0.20; km_Cry1 = 0.22; km_Cry2 = 0.41; km_Rev_erbalpha = 0.60;
km_Clk = 3.19; km_Bmal1 = 1.42; km_Rorc = 1.50; kp_PER1 = 2.58; kp_PER2 = 3.0;
kp_CRY1 = 0.312; kp_CRY2 = 5.9; kp_REV_ERBalpha = 0.31; kp_CLK = 1.52; kp_BMAL1 = 2.28;
kp_RORc = 3.33;

tPer1 = 3.05; tPer2 = 2.38; tCry1 = 3.94; tCry2 = 1.69; tRev_erbalpha = 1.60; tClk = 3.04;
tBmal1 = 4.00; tRorc = 1.39;

aPER1_CRY1 = 3.57; aPER1_CRY2 = 3.12; aPER2_CRY1 = 3.81; aPER2_CRY2 = 4.0;
aCLK_BMAL1 = 1.98; dPER1_CRY1 = 1.32; dPER1_CRY2 = 1.85; dPER2_CRY1 = 1.37;
dPER2_CRY2 = 2.42; dCLK_BMAL1 = 0.97;

Ks=[V0_Per1, V1_Per1, V0_Per2, V1_Per2, V0_Cry1, V1_Cry1, V2_Cry1, V0_Cry2,...
    V1_Cry2, V2_Cry2, V1_Rev_erbalpha, V0_Clk, V1_Clk, V0_Bmal1, V1_Bmal1,...
    V0_Rorc, V1_Rorc, V2_Rorc, na1_Per1, ni1_Per1, ni2_Per1, ni3_Per1, ni4_Per1,...
    na1_Per2, ni1_Per2, ni2_Per2, ni3_Per2, ni4_Per2, na1_Cry1, na2_Cry1,...
    ni1_Cry1, ni2_Cry1, ni3_Cry1, ni4_Cry1, ni5_Cry1, na1_Cry2, na2_Cry2, ni1_Cry2,...
    ni2_Cry2, ni3_Cry2, ni4_Cry2, ni5_Cry2, na1_Rev_erbalpha, ni1_Rev_erbalpha,...
    ni2_Rev_erbalpha, ni3_Rev_erbalpha, ni4_Rev_erbalpha, na1_Clk, ni1_Clk,...
    na1_Bmal1, ni1_Bmal1, na1_Rorc, na2_Rorc, ni1_Rorc, ni2_Rorc, ni3_Rorc,...
    ni4_Rorc, ni5_Rorc, KA1_Per1, KI1_Per1, KI2_Per1, KI3_Per1, KI4_Per1,...
    KA1_Per2, KI1_Per2, KI2_Per2, KI3_Per2, KI4_Per2, KA1_Cry1, KA2_Cry1,...
    KI1_Cry1, KI2_Cry1, KI3_Cry1, KI4_Cry1, KI5_Cry1, KA1_Cry2, KA2_Cry2,...
    KI1_Cry2, KI2_Cry2, KI3_Cry2, KI4_Cry2, KI5_Cry2, KA1_Rev_erbalpha,...
    KI1_Rev_erbalpha, KI2_Rev_erbalpha, KI3_Rev_erbalpha, KI4_Rev_erbalpha,...
    KA1_Clk, KI1_Clk, KA1_Bmal1, KI1_Bmal1, KA1_Rorc, KA2_Rorc, KI1_Rorc,...
    KI2_Rorc, KI3_Rorc, KI4_Rorc, KI5_Rorc, km_Per1, km_Per2, km_Cry1,...
    km_Cry2, km_Rev_erbalpha, km_Clk, km_Bmal1, km_Rorc, kp_PER1, kp_PER2,...
    kp_CRY1, kp_CRY2, kp_REV_ERBalpha, kp_CLK, kp_BMAL1, kp_RORc, tPer1,...
    tPer2, tCry1, tCry2, tRev_erbalpha, tClk, tBmal1, tRorc, aPER1_CRY1,...
    aPER1_CRY2, aPER2_CRY1, aPER2_CRY2, aCLK_BMAL1, dPER1_CRY1, dPER1_CRY2,...
    dPER2_CRY1, dPER2_CRY2, dCLK_BMAL1];