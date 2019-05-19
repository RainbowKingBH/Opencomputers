local component = require("component")
local colors = require("colors")
local gpu = component.gpu
r = component.br_reactor
name = Yellorsten
version = 1.5.4.2
rrod = 0
term.clear()
os.execute("resolution 45 15")
io.write("Resolution updated!\n")
os.sleep(1)
term.clear()
io.write(gpu.setForeground(colors.yellow).. name); io.write(gpu.setForeground(colors.white).. version)
io.write("Powered by EMDK Launcher\n")
io.write("launcher.diehard.pl\n")
os.sleep(1)
term.clear()
while true do
  rstatus = r.getActive()
  restored = r.getEnergyStored()
  repoduced = r.getEnergyProducedLastTick()
  rtempf = r.getFuelTemperature()
  rtempc = r.getCasingTemperature()
  rfuel = r.getFuelAmount()
  rfuelm = r.getFuelAmountMax()
  rfuelc = r.getFuelConsumedLastTick()
  rrod = restored / 100000
  r.setAllControlRodLevels(rrod)
  os.sleep(0.1)
  term.clear()
  io.write(gpu.setForeground(colors.yellow).. name); io.write(gpu.setForeground(colors.white).. version)
  if rstatus == true then
    io.write(gpu.setForeground(colors.white).."Status: "); io.write(gpu.setForeground(colors.green).."Online\n")
  end
  if rstatus == false then
    io.write(gpu.setForeground(colors.white).."Status: "); io.write(gpu.setForeground(colors.red).."Offline\n")
  end
  io.write("Energy produced: "..repoduced"\n")
  io.write("Energy stored: "..restored.."/10000000 RF\n")
  io.write("Rods limit: "..rrod.." %\n")
  io.write("Fuel temperature: "..rtempf.." *C\n")
  io.write("Case temperature: "..rtempc.." *C\n")
  io.write("Fuel level: "..rfuel.."/"..rfuelm.." mB\n")
  io.write("Fuel consume: "..rfuelc.." mB/t\n")
  io.write("API by Matesz063 and 3Rr0rExE404\n")
end