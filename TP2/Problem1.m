Im = 5e-9;
Rm = 10e6;
dt = 20e-6;
Vreset = -80e-3;
Vth = -40e-3;
Ve = -70e-3;
Taum = 10e-3;
totalTime = 1;
VmSize = ceil(totalTime/dt);
Vm = zeros(VmSize, 1);
% rmod = sqrt(1 + 4 * Taum * (Ve + Rm*Im)) / (2*Taum);
for i = 1:VmSize
%     A = exp(-i/(2*Taum));
%     B = exp(rmod * dt) + exp(-rmod * dt)
    dV = -(Vm(i) - Ve) + Im*Rm / Taum;
    Vm(i + 1) = Vm(i) + dV * dt;
    if (Vm(i+1) > Vth)
        Vm(i+1) = Vreset;
    end
end

plot(Vm);
