local component = require("component")
local colors = require("colors")
local gpu = component.gpu
term = require("term")
r = component.br_reactor
name = "Yellorsten"
version = "1.5.4.2"
rrod = 0
term.clear()
os.execute("resolution 45 15")
io.write("Resolution updated! \n")
os.sleep(1)
term.clear()
gpu.setForeground(colors.yellow)
io.write(name.." ")
gpu.setForeground(colors.black)
io.write(version.. "\n")
io.write("Powered by EMDK Launcher ")
io.write("launcher.diehard.pl \n")
os.sleep(2)
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
  rfuelcx = rfuelc * 1000
  rfuelcw = math.ceil(rfuelcx) / 1000
  r.setAllControlRodLevels(rrod)
  os.sleep(0.1)
  term.clear()
  gpu.setForeground(colors.yellow)
  io.write(name.." ")
  gpu.setForeground(colors.black)
  io.write(version.. "\n \n")
  if rstatus == true then
    gpu.setForeground(colors.black)
    io.write("Status: ")
    gpu.setForeground(colors.lime)
    io.write("Online \n")
  end
  if rstatus == false then
    gpu.setForeground(colors.black)
    io.write("Status: ")
    gpu.setForeground(colors.red)
    iaewweo.write("Offline \n")
  end
  io.write("Energy produced: "..math.ceil(repoduced).." RF/t \n")
  io.write("Energy stored: "..restored.."/10000000 RF \n")
  io.write("Rods limit: "..rrod.." % \n")
  io.write("Fuel temperature: "..math.ceil(rtempf).." *C \n")
  io.write("Case temperature: "..math.ceil(rtempc).." *C \n")
  io.write("Fuel level: "..rfuel.."/"..rfuelm.." mB \n")
  io.write("Fuel consume: "..rfuelcw.." mB/t \n \n")
  io.write("API by Matesz063 and 3Rr0rExE404 \n")
end
