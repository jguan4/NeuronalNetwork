function Ks=ligandParameters

Bmax=2.821;
kD=2.583;
kde=-1.884;
kdi=-2.730;
ke=-1.177;
kex=-2.447;
kon=-4.091;
kt=-1.758;

Ks = [kon,kD,kt,Bmax,ke,kex,kdi,kde];
Ks = 10.^Ks;